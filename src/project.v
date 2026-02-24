/*
<<<<<<< HEAD
 * Copyright (c) 2024 Your Name
=======
 * Copyright (c) 2026 Your Name
>>>>>>> origin/ttihp-template
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

<<<<<<< HEAD
module tt_um_dpi_adexp (
=======
module tt_um_analog_example (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8v power supply
>>>>>>> origin/ttihp-template
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
<<<<<<< HEAD
=======
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
>>>>>>> origin/ttihp-template
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

<<<<<<< HEAD
  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

=======
>>>>>>> origin/ttihp-template
endmodule
