v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 5 -60 -650 800 -650 800 -300 -60 -300 -60 -650 {}
N 510 -600 510 -580 {lab=VDD}
N 100 -520 100 -500 {lab=I_in}
N 510 -520 510 -480 {lab=I_lk}
N -10 -550 -10 -530 {lab=#net1}
N 680 -600 680 -580 {lab=VDD}
N 680 -520 680 -480 {lab=I_ref}
N -40 -150 -40 -130 {lab=VDD}
N 510 -440 510 -380 {lab=GND}
N -210 -30 -180 -30 {lab=I_lk}
N -230 -10 -180 -10 {lab=I_ref}
N 430 -10 460 -10 {lab=#net2}
N 600 -10 630 -10 {lab=ACK}
N 350 -130 520 -130 {lab=VDD}
N 520 -130 520 -50 {lab=VDD}
N 350 -130 350 -50 {lab=VDD}
N 630 -10 630 110 {lab=ACK}
N -220 10 -180 10 {lab=ACK}
N 440 90 440 150 {lab=GND}
N 440 90 520 90 {lab=GND}
N 520 30 520 90 {lab=GND}
N 350 30 350 90 {lab=GND}
N 120 -30 190 -30 {lab=REQ}
N 120 -50 170 -50 {lab=vmem}
N 190 -30 190 -10 {lab=REQ}
N 100 -600 100 -580 {lab=VDD}
N -40 -130 -40 -100 {lab=VDD}
N -20 -120 -20 -100 {lab=GND}
N 350 90 440 90 {lab=GND}
N -220 10 -220 110 {lab=ACK}
N -40 -130 350 -130 {lab=VDD}
N -220 110 630 110 {lab=ACK}
N 190 -10 290 -10 {lab=REQ}
N -210 -50 -210 -30 {lab=I_lk}
N -230 -30 -210 -30 {lab=I_lk}
N -210 -50 -180 -50 {lab=I_lk}
N 550 -440 560 -440 {lab=I_lk}
N 560 -480 560 -440 {lab=I_lk}
N 510 -480 560 -480 {lab=I_lk}
N 510 -480 510 -470 {lab=I_lk}
N 680 -440 680 -380 {lab=GND}
N 720 -440 730 -440 {lab=I_ref}
N 730 -480 730 -440 {lab=I_ref}
N 680 -480 730 -480 {lab=I_ref}
N 680 -480 680 -470 {lab=I_ref}
N 510 -380 560 -380 {lab=GND}
N 680 -380 730 -380 {lab=GND}
N 510 -380 510 -360 {lab=GND}
N 680 -380 680 -360 {lab=GND}
N -470 -170 -470 -140 {lab=VDD}
N 360 -490 360 -450 {lab=V_bias}
N 410 -530 410 -490 {lab=V_bias}
N 400 -530 410 -530 {lab=V_bias}
N 360 -490 410 -490 {lab=V_bias}
N 360 -500 360 -490 {lab=V_bias}
N 360 -590 410 -590 {lab=VDD}
N 360 -590 360 -560 {lab=VDD}
N 360 -600 360 -590 {lab=VDD}
N 360 -390 360 -360 {lab=GND}
N 340 -530 360 -530 {lab=VDD}
N -470 -0 -470 30 {lab=GND}
N -620 -100 -550 -100 {lab=V_in}
N -620 -40 -550 -40 {lab=V_cm}
N 220 -370 220 -350 {lab=GND}
N 220 -460 220 -430 {lab=V_cm}
N 100 -370 100 -350 {lab=GND}
N 100 -460 100 -430 {lab=V_in}
N -490 -170 -490 -140 {lab=V_bias}
N -360 -70 -320 -70 {lab=GND}
N -260 -70 -180 -70 {lab=I_in}
C {neuron_noahp.sym} -30 0 0 0 {name=Xneuron}
C {simulator_commands_shown.sym} 930 -1070 0 0 {name=example_Simulator1
simulator=ngspice
only_toplevel=false 
value="
.param temp=27
.param Iin_amp=200p

.ic V(vmem)=0 V(xneuron.xref.vref)=0 V(REQ)=1.2 V(ACK)=1.2

.options gmin=1e-13
.options method=gear
.control



* ======================================================
*  Iin sweep - measure firing rate of V(REQ) vs Iin
* ======================================================
*  For each DC value of Iin a transient simulation is run.
*  Rising-edge crossings of V(REQ) through a threshold
*  are counted after a settling window and the firing
*  frequency is computed.  Results go to neuron_iin_sweep.raw
* ======================================================

* --- Sweep parameters (Amps) - edit as needed ---
let iin_start = 0
let iin_stop  = 4000e-12
let iin_step  = 200e-12

* --- Compute number of sweep points ---
let num_pts = (iin_stop - iin_start) / iin_step + 1

* --- Create a new plot to hold the accumulated results ---
setplot new
set resplot = $curplot
let iin_values   = unitvec(num_pts)
let firing_rates = unitvec(num_pts)
let sweep_idx = 0
set t_sim = 50m

* --- Main sweep loop ---
dowhile sweep_idx < num_pts

  * Compute cur_iin fresh each iteration to avoid float drift
  let cur_iin = iin_start + sweep_idx * iin_step

  echo
  echo ============================================
  echo   Sweep point: Iin = $&cur_iin A
  echo ============================================

  * Save cur_iin to a shell variable before tran changes the plot context
  set cur_iin_val = $&cur_iin

  * Set the Iin_amp parameter to the current sweep value.
  alterparam Iin_amp = $cur_iin_val
  reset

  save V(REQ)

  * Run transient analysis with adaptive time
  echo   t_sim = $t_sim
  tran 50n $t_sim

  * --- Measure firing frequency using meas tran ---
  * Skip 1st spike (different freq from resting), use 2nd-4th spikes
  let t_fall1 = 0
  let t_fall2 = 0
  let t_fall3 = 0
  let t_fall4 = 0
  meas tran t_fall1 WHEN v(REQ)=0.6 FALL=1
  meas tran t_fall2 WHEN v(REQ)=0.6 FALL=2
  meas tran t_fall3 WHEN v(REQ)=0.6 FALL=3
  meas tran t_fall4 WHEN v(REQ)=0.6 FALL=4

  * Use best available data for frequency
  * More than 1 spike: f = (N-1) / (t_last - t_first)
  * Exactly 1 spike:   f = 1 / t_first
  if t_fall4 > 0
    * 4 spikes: use span from 1st to 4th
    let f_rate = 3.0 / (t_fall4 - t_fall1)
  else
    if t_fall3 > 0
      * 3 spikes: use span from 1st to 3rd
      let f_rate = 2.0 / (t_fall3 - t_fall1)
    else
      if t_fall2 > 0
        * 2 spikes: use span from 1st to 2nd
        let f_rate = 1.0 / (t_fall2 - t_fall1)
      else
        if t_fall1 > 0
          * 1 spike: estimate from time to 1st spike
          let f_rate = 1.0 / t_fall1
        else
          * No spikes
          let f_rate = 0
        end
      end
    end
  end

  echo   freq = $&f_rate Hz
  echo   Spike times:
  echo     t_fall1 = $&t_fall1 s
  echo     t_fall2 = $&t_fall2 s
  echo     t_fall3 = $&t_fall3 s
  echo     t_fall4 = $&t_fall4 s

  * --- Update t_sim for next sweep point ---
  * Need ~5 spikes worth of time, clamp to [1ms, 50ms]
  if f_rate > 0
    let t_next = 5.0 / f_rate
    if t_next < 1e-3
      let t_next = 1e-3
    end
    if t_next > 50e-3
      let t_next = 50e-3
    end
    set t_sim = $&t_next
  end

  * --- Store this point's results in the result plot ---
  set save_freq = $&f_rate
  setplot $resplot
  let iin_values[sweep_idx]   = $cur_iin_val
  let firing_rates[sweep_idx] = $save_freq
  let sweep_idx = sweep_idx + 1

end

* --- Write the result vectors to a .raw file ---
setplot $resplot
write neuron_iin_sweep.raw iin_values firing_rates

echo
echo ============================================
echo   Iin sweep complete!
echo   Results saved to:  neuron_iin_sweep.raw
echo   Vectors:
echo     iin_values   (A)  - input current
echo     firing_rates (Hz) - neuron firing rate
echo ============================================

.endc

"



































}
C {isource.sym} 510 -550 0 0 {name=Ilk value=4p}
C {simulator_commands_shown.sym} -540 -660 0 0 {name=lib_import
simulator=ngspice
only_toplevel=false 
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt"
}
C {isource.sym} 100 -550 0 0 {name=Iin value="dc 0 ac 0 pulse(0 Iin_amp 0 20n 20n 1 1)"
}
C {lab_pin.sym} 510 -500 0 0 {name=p37 sig_type=std_logic lab=I_lk}
C {vsource.sym} -10 -580 0 0 {name=VDD1 value=1.2 savecurrent=false}
C {gnd.sym} -10 -470 0 0 {name=l7 lab=GND}
C {vdd.sym} -10 -610 0 0 {name=l8 lab=VDD}
C {isource.sym} 680 -550 0 0 {name=Iref value=10n}
C {vdd.sym} 680 -600 0 0 {name=l16 lab=VDD}
C {vdd.sym} 100 -600 0 0 {name=l18 lab=VDD}
C {vdd.sym} 510 -600 0 0 {name=l20 lab=VDD}
C {ammeter.sym} -10 -500 0 0 {name=Vidd savecurrent=true spice_ignore=0}
C {vdd.sym} -40 -150 0 0 {name=l1 lab=VDD}
C {gnd.sym} 440 150 0 0 {name=l2 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} 530 -440 0 1 {name=M27
l=4u
w=4u
ng=2
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} 510 -360 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 630 80 2 1 {name=p9 sig_type=std_logic lab=ACK}
C {lab_pin.sym} 190 -10 1 1 {name=p10 sig_type=std_logic lab=REQ}
C {inv.sym} 430 -10 0 0 {name=Xinv3}
C {inv.sym} 600 -10 0 0 {name=Xinv4}
C {capa.sym} 560 -410 0 0 {name=C2
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 170 -50 2 0 {name=p12 sig_type=std_logic lab=vmem}
C {lab_wire.sym} -20 -110 0 1 {name=p6 sig_type=std_logic lab=GND}
C {lab_pin.sym} 680 -500 0 0 {name=p3 sig_type=std_logic lab=I_ref}
C {sg13g2_pr/sg13_hv_nmos.sym} 700 -440 0 1 {name=M1
l=4u
w=4u
ng=2
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} 680 -360 0 0 {name=l3 lab=GND}
C {capa.sym} 730 -410 0 0 {name=C1
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -230 -10 0 0 {name=p1 sig_type=std_logic lab=I_ref}
C {lab_pin.sym} -230 -30 0 0 {name=p4 sig_type=std_logic lab=I_lk}
C {V2I_shift_final.sym} -490 70 0 0 {name=xv2i}
C {vdd.sym} -470 -170 0 0 {name=l5 lab=VDD}
C {lab_wire.sym} 340 -530 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} 380 -530 0 1 {name=M3
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {vdd.sym} 360 -600 0 0 {name=l6 lab=VDD}
C {capa.sym} 410 -560 0 0 {name=C3
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {isource.sym} 360 -420 0 0 {name=Ilk1 value=6n}
C {gnd.sym} 360 -360 0 0 {name=l9 lab=GND}
C {lab_wire.sym} -210 -70 0 0 {name=p2 sig_type=std_logic lab=I_in}
C {gnd.sym} -470 30 0 0 {name=l10 lab=GND}
C {vsource.sym} 220 -400 0 0 {name=Vcm value=0.4 savecurrent=false}
C {gnd.sym} 220 -350 0 0 {name=l11 lab=GND}
C {lab_wire.sym} 220 -460 0 0 {name=p7 sig_type=std_logic lab=V_cm}
C {vsource.sym} 100 -400 0 0 {name=Vin value="sine(0.4 50m 10)"}
C {gnd.sym} 100 -350 0 0 {name=l12 lab=GND}
C {lab_wire.sym} 100 -460 0 0 {name=p8 sig_type=std_logic lab=V_in}
C {lab_wire.sym} -490 -170 0 0 {name=p11 sig_type=std_logic lab=V_bias}
C {lab_wire.sym} 360 -470 0 0 {name=p13 sig_type=std_logic lab=V_bias}
C {lab_wire.sym} -590 -100 0 0 {name=p14 sig_type=std_logic lab=V_in}
C {lab_wire.sym} -590 -40 0 0 {name=p15 sig_type=std_logic lab=V_cm}
C {vsource.sym} -280 -190 3 0 {name=Viinprob value=0 savecurrent=true}
C {lab_wire.sym} 100 -500 0 0 {name=p16 sig_type=std_logic lab=I_in}
C {gnd.sym} -320 -70 0 0 {name=l13 lab=GND}
C {gnd.sym} -250 -190 0 0 {name=l14 lab=GND}
