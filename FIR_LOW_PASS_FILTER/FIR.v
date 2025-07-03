
 //`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RGUKT ONGOLE
// Engineer: P VENKATA LAKSHMI BHAVANA
// 
// Create Date: 31.03.2025 16:59:02
// Design Name: DIGITAL LOW PASS FIR FILTER 
// Module Name: FIR
// Project Name: LOW PASS FIR FILTER 
// Target Devices: FPGA BOARDS
// Tool Versions:Xilinx Vivado 2024.2 
// Description:
//     This module implements a Low Pass FIR Filter. The filter is designed to allow
//     low-frequency signals to pass while attenuating high-frequency components.
//     It uses a fixed set of coefficients (taps) and performs a convolution 
//     between the input signal and the coefficients to produce the filtered output.
// Features:
//       - Supports N-tap FIR filter
//       - Coefficients can be hardcoded or parameterized
//       - Pipelined structure for high-speed implementation
//       - Useful in DSP applications such as audio processing, signal smoothing
//
// Dependencies: 
//     - FIR coefficients (parameter/ROM)
//     - Clock and reset signal
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//     Ensure coefficients are generated using tools like MATLAB, Python, or 
//     FDA Tool in Xilinx for desired cutoff frequency and sampling rate
//////////////////////////////////////////////////////////////////////////////////


module FIR(
   input clk                              , //100MHz sampling clock
   input signed[15:0] noisy_signal        , //noisy signal to be filtered
   output signed[15:0] filtered_signal  //filtered output signal
    );
  integer i,j;
   
   //coefficients for 9-tap FIR filter 
   //~10MHz cutoff frequency at 100MHz sampling clock
    reg signed [15:0] coeff [0:8];
    initial begin
    coeff[0] = 16'h04F6;
    coeff[1] = 16'h0AE1;
    coeff[2] = 16'h1089;
    coeff[3] = 16'h1496;
    coeff[4] = 16'h160F;
    coeff[5] = 16'h1496;
    coeff[6] = 16'h1089;
    coeff[7] = 16'h0AE1;
    coeff[8] = 16'h04F6;
    end
  
 reg signed [15:0] delayed_signal[0:8];
 reg signed [31:0] prod  [0:8];
 reg signed [32:0] sum_0 [0:4];
 reg signed [33:0] sum_1 [0:2];
 reg signed [34:0] sum_2 [0:1];
 reg signed [35:0] sum_3    ;
 
 //shift register for delayed signal
 //Feed the noisy input signal into a 9-tap delayed line to prepare for convolution operation
 always @(posedge clk)begin
   delayed_signal[0] <= noisy_signal;
   for(i=1;i<=8;i=i+1) begin
   delayed_signal[i] <= delayed_signal[i-1];
   end
 end
 //multiply by coefficients
 //pipelined for multiply and coefficients
 always@(posedge clk)begin
     for(j=0;j<=8;j=j+1) begin
       prod[j]<=delayed_signal[j]*coeff[j];
     end
 end
 //tree adder stage 1
 always @(posedge clk)begin 
 sum_0[0]<=prod[0]+prod[1];
 sum_0[1]<=prod[2]+prod[3];
 sum_0[2]<=prod[4]+prod[5];
 sum_0[3]<=prod[6]+prod[7];
 sum_0[4]<=prod[8];
 end
 //stage 2
 always @(posedge clk)begin
 sum_1[0]<=sum_0[0]+sum_0[1];
 sum_1[1]<=sum_0[2]+sum_0[3];
 sum_1[2]<=sum_0[4];
 end
 //3
 always @(posedge clk)begin
 sum_2[0]<=sum_1[0]+sum_1[1];
 sum_2[1]<=sum_1[2];
 end
 //o/p assignment
 always @(posedge clk)begin
 sum_3<=sum_2[0]+sum_2[1];
 end
 
 assign filtered_signal = $signed (sum_3[35:14]);

endmodule
