`timescale 1ns / 1ps
// Company        : RGUKT-ONGOLE
// Engineer       : P.VENKATA LAKSHMI BHAVANA
// 
// Create Date    : 31.03.2025 17:59:02
// Design Name    : Sine and Cosine Wave Generator
// Module Name    : sincos_tb
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
////////////////////////////////////////////////////////////////
module sincos_tb();

localparam CLK_PERIOD=10;
localparam signed [15:0] PI_POS =16'b 0110_0100_1000_1000;
localparam signed [15:0] PI_NEG =16'b 1001_1011_0111_1000;
localparam PHASE_INC =256;

reg clk=1'b0;
reg rst=1'b1;

reg signed [15:0] phase=0;
reg phase_tvalid=1'b0;
wire signed[15:0] cos,sin;
wire sincos_tvalid;

sincos sincos_inst(
.clk(clk),
.phase(phase),
.phase_tvalid(phase_tvalid),
.cos(cos),
.sin(sin),
.sincos_tvalid(sincos_tvalid)
);

initial begin 
clk=1'b0;
rst=1'b1;
rst=#(CLK_PERIOD*10) 1'b0;
end

always begin 
clk=#(CLK_PERIOD/2) ~clk;
end

always @(posedge clk)
begin 
if(rst) begin 
phase<=0;
phase_tvalid<=1'b0;
end else begin 
phase_tvalid<=1'b1; 

if (phase+PHASE_INC<PI_POS) begin 
phase<=phase+PHASE_INC;
end else begin 
phase<=PI_NEG;
end
end 
end
endmodule
