#!/usr/bin/env python3
"""
spice_for_klayout.py

Interactive netlist “normalizer” to improve compatibility with KLayout/IHP import scripts.

It will:
  1) Ask for an input .spice file path.
  2) Write an output file next to it named: <input_basename>_klayout.spice
  3) Apply these normalizations (safe defaults):
      - Uncomment the first top-level "*.subckt"/"**.subckt" and matching "*.ends"/"**.ends"
      - Convert MOS lines starting with "XM..." to "M..." (optional toggle below)
      - Convert engineering suffixes in values and param assignments:
          1p -> 1e-12, w=1u -> w=1e-6, etc. (optional toggle below)

Notes:
  - Keeps node names unchanged (e.g. Vref vs V_ref are preserved).
  - Keeps subckt instances (X...) unchanged.

Run:
  python3 spice_for_klayout.py
"""

from __future__ import annotations

import re
from pathlib import Path
from typing import Optional, Tuple


# ====== Config toggles ======
DO_XM_TO_M = True       # Convert lines starting with XM -> M
DO_SUFFIX_CONV = True   # Convert 1p, 0.5u, w=1u, etc. into numeric exponent form
# ============================


SUFFIXES = {
    "t": 1e12,
    "g": 1e9,
    "meg": 1e6,
    "k": 1e3,
    "m": 1e-3,
    "u": 1e-6,
    "n": 1e-9,
    "p": 1e-12,
    "f": 1e-15,
}

NUM_SUFFIX_RE = re.compile(
    r"""
    (?P<num>[+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)   # number
    (?P<suf>(?:meg|MEG|Meg|k|K|m|u|U|n|N|p|P|f|F|g|G|t|T))?  # suffix
    \b
    """,
    re.VERBOSE,
)

PARAM_ASSIGN_RE = re.compile(r"(?P<key>[A-Za-z_]\w*)\s*=\s*(?P<val>[^\s]+)")


def _suffix_to_factor(suf: str) -> Optional[float]:
    return SUFFIXES.get(suf.lower())


def normalize_number_token(token: str) -> str:
    """
    Convert '1p' -> '1e-12', '0.5u' -> '5e-7'.
    If token doesn't match a simple numeric+suffix pattern, return as-is.
    """
    tok = token.strip()
    m = NUM_SUFFIX_RE.fullmatch(tok)
    if not m:
        return token

    num_str = m.group("num")
    suf = m.group("suf")
    if not suf:
        return token

    try:
        num = float(num_str)
    except ValueError:
        return token

    factor = _suffix_to_factor(suf)
    if factor is None:
        return token

    val = num * factor
    return f"{val:.15g}"


def normalize_param_assignments(line: str) -> str:
    def repl(m: re.Match) -> str:
        key = m.group("key")
        val = m.group("val")
        return f"{key}={normalize_number_token(val)}"

    return PARAM_ASSIGN_RE.sub(repl, line)


def normalize_cap_value(line: str) -> str:
    """
    For capacitor lines (start with C/c), normalize the last token if it is a number+suffix.
    """
    s = line.strip()
    if not s or s.startswith("*") or s.startswith("."):
        return line
    if s[0] not in ("C", "c"):
        return line

    parts = line.split()
    if len(parts) < 4:
        return line

    parts[-1] = normalize_number_token(parts[-1])
    return " ".join(parts) + ("\n" if line.endswith("\n") else "")


def uncomment_subckt_and_ends(lines: list[str]) -> Tuple[list[str], Optional[str]]:
    """
    Uncomment the first top-level "*.subckt"/"**.subckt" and the next "*.ends"/"**.ends".
    Returns (new_lines, top_name_detected)
    """
    out = lines[:]
    top_name: Optional[str] = None

    subckt_re = re.compile(r"^\s*\*+\s*\.subckt\s+(\S+)\b", re.IGNORECASE)
    ends_re = re.compile(r"^\s*\*+\s*\.ends\b", re.IGNORECASE)

    subckt_idx = None
    for i, ln in enumerate(out):
        m = subckt_re.match(ln)
        if m:
            subckt_idx = i
            top_name = m.group(1)
            out[i] = re.sub(r"^\s*\*+\s*(?=\.subckt)", "", ln, flags=re.IGNORECASE)
            break

    if subckt_idx is not None:
        for j in range(subckt_idx + 1, len(out)):
            if ends_re.match(out[j]):
                out[j] = re.sub(r"^\s*\*+\s*(?=\.ends)", "", out[j], flags=re.IGNORECASE)
                # Prefer explicit .ends <name> if .ends is bare and we know top_name
                if top_name and out[j].strip().lower() == ".ends":
                    out[j] = f".ends {top_name}\n" if out[j].endswith("\n") else f".ends {top_name}"
                break

    return out, top_name


def xm_to_m(line: str) -> str:
    if re.match(r"^\s*XM", line):
        return re.sub(r"^(\s*)XM", r"\1M", line)
    return line


def prompt_for_file() -> Path:
    while True:
        raw = input("Enter input SPICE netlist file path: ").strip().strip('"').strip("'")
        if not raw:
            print("Please enter a path.")
            continue
        p = Path(raw).expanduser()
        if not p.exists():
            print(f"File not found: {p}")
            continue
        if not p.is_file():
            print(f"Not a file: {p}")
            continue
        return p


def main() -> None:
    in_path = prompt_for_file()
    out_path = in_path.with_name(f"{in_path.stem}_klayout{in_path.suffix or '.spice'}")

    lines = in_path.read_text(errors="replace").splitlines(True)  # keep newlines
    lines, top = uncomment_subckt_and_ends(lines)

    out_lines: list[str] = []
    for ln in lines:
        s = ln.lstrip()
        # Keep comments and dot-directives intact (top subckt/ends already handled)
        if s.startswith("*") or s.startswith("."):
            out_lines.append(ln)
            continue

        if DO_XM_TO_M:
            ln = xm_to_m(ln)

        if DO_SUFFIX_CONV:
            ln = normalize_param_assignments(ln)
            ln = normalize_cap_value(ln)

        out_lines.append(ln)

    out_path.write_text("".join(out_lines))
    print(f"\nWrote output netlist: {out_path}")
    if top:
        print(f"Detected top subckt: {top}")
    else:
        print("Top subckt not detected (no commented .subckt found).")


if __name__ == "__main__":
    main()