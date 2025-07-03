//////////////////////////////////////////////////////////////////////////////////
// Company        : RGUKT-ONGOLE
// Engineer       : P.VENKATA LAKSHMI BHAVANA
// 
// Create Date    : 31.03.2025 17:59:02
// Design Name    : Sine and Cosine Wave Generator
// Module Name    : sincos
// Project Name   : LOW PASS FIR FILTER
// Target Devices : FPGA BOARDS
// Tool Versions  : XILINX Vivado 2024.2]
// Description    : 
//     This module generates digital sine and cosine values using a phase accumulator
//     or lookup table method (typically implemented using ROM or CORDIC).
//     The output values can be used in DSP blocks for modulation, signal processing,
//     or trigonometric function approximation.
//
//     Inputs:
//       - clk     : Clock input
//       - phase_in: Phase angle input (usually a binary phase word)
//
//     Outputs:
//       - sin : Sine wave output (digital)
//       - cos : Cosine wave output (digital)
//
// Dependencies   : Requires sine and cosine lookup tables or CORDIC engine
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//     Resolution and range depend on the bit width of phase_in and output signals.
//     The module assumes a 2π phase range mapped to phase_in.
//
// License: [Optional License Info]
//////////////////////////////////////////////////////////////////////////////////

module sincos(
input clk,
input [15:0] phase,
input phase_tvalid,
output [15:0] cos,
output [15:0] sin,
output sincos_tvalid
);

cordic_0 cordic_0_inst(
.aclk(clk),
.s_axis_phase_tvalid(phase_tvalid),
.s_axis_phase_tdata(phase),
.m_axis_dout_tvalid(sincos_tvalid),
.m_axis_dout_tdata({sin,cos})
);
endmodule