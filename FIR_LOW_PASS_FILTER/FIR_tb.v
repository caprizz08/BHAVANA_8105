`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RGUKT ONGOLE
// Engineer: P VENKATA LAKSHMI BHAVANA
// 
// Create Date: 31.03.2025 16:59:02
// Design Name: DIGITAL LOW PASS FIR FILTER 
// Module Name: FIR_tb
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
// Revision 0.01 - File Created
// Additional Comments:
//     Ensure coefficients are generated using tools like MATLAB, Python, or 
//     FDA Tool in Xilinx for desired cutoff frequency and sampling rate
//////////////////////////////////////////////////////////////////////////////////
module FIR_tb(
    //input clk,
   // input [15:0] noisy_signal,
   // output [15:0] filtered_signal
  );

localparam CORDIC_CLK_PERIOD = 2;             //to create 500MHz cordic smpling clock
localparam FIR_CLK_PERIOD = 10;               //Clock period for the CORDIC at 800 Hz localparam FIR CLK PERIOD = 1250; // Clock period for the FIR filter at 800 Hz
localparam signed [15:0] PI_POS = 16'h 6488; //Positive +Pl constant
localparam signed [15:0] PI_NEG = 16'h 9B78;  //Negative -Pl constant
localparam PHASE_INC_2MHZ = 200;             //phase jump for 2MHz sine wave synthesis
localparam PHASE_INC_30MHZ = 3000;            // 30MHz
// Phase increment for 150 Hz signal at 800 Hz localparam PHASE INC 400HZ=326, // Phase increment for 400 Hz signal at 800 Hz

reg cordic_clk = 1'b0;
reg fir_clk    = 1'b0;
reg phase_2MHZ_tvalid = 1'b0;
reg phase_30MHZ_tvalid = 1'b0;
reg signed [15:0] phase_2MHZ = 0;
reg signed [15:0] phase_30MHZ = 0;
wire sincos_2MHZ_tvalid; 
wire signed [15:0] sin_2MHZ, cos_2MHZ;
wire sincos_30MHZ_tvalid;
wire signed [15:0] sin_30MHZ, cos_30MHZ;

reg signed [15:0] noisy_signal = 0; 
wire signed [15:0] filtered_signal;

// synthesize 2MHz sine
cordic_0 cordic_inst_0(
.aclk                (cordic_clk)        ,
.s_axis_phase_tvalid (phase_2MHZ_tvalid)      ,
.s_axis_phase_tdata  (phase_2MHZ)        ,
.m_axis_dout_tvalid  (sincos_2MHZ_tvalid),
.m_axis_dout_tdata   ({sin_2MHZ,cos_2MHZ})
);

//synthesie 30MHz sine  
cordic_0 cordic_inst_1(
.aclk                 (cordic_clk)         ,
.s_axis_phase_tvalid  (phase_30MHZ_tvalid)       ,
.s_axis_phase_tdata   (phase_30MHZ)        ,
.m_axis_dout_tvalid   (sincos_30MHZ_tvalid),
.m_axis_dout_tdata    ({sin_30MHZ,cos_30MHZ})
);

//phase sweep
always @(posedge cordic_clk)begin
phase_2MHZ_tvalid <= 1'b1 ;
phase_30MHZ_tvalid <= 1'b1 ;

//sweep phase to synthesize 2MHz sine
if (phase_2MHZ + PHASE_INC_2MHZ < PI_POS)begin
  phase_2MHZ <= phase_2MHZ + PHASE_INC_2MHZ;
end else begin
  phase_2MHZ <= PI_NEG +(phase_2MHZ+PHASE_INC_2MHZ - PI_POS);
end

//sweep phase to synthesize 30MHz sine
if (phase_30MHZ + PHASE_INC_30MHZ <= PI_POS)begin
  phase_30MHZ <= phase_30MHZ + PHASE_INC_30MHZ;
end else begin
  phase_30MHZ <= PI_NEG +(phase_30MHZ+PHASE_INC_30MHZ - PI_POS);
end
end

//create 500MHz cordic clock
always begin 
cordic_clk = #(CORDIC_CLK_PERIOD/2) ~cordic_clk;
end
//create 100MHz FIR clock
always begin
fir_clk = #(FIR_CLK_PERIOD/2) ~fir_clk;
end

//moisy signal = 2MHz sine + 30MHz sine
//noisy signal is sampled at 100MH FIR sampling rate
always @(posedge fir_clk)begin 
noisy_signal <= (sin_2MHZ + sin_30MHZ)/2;
end
// feed noisy signal into FIR low pass filter
FIR fir_inst(
.clk            (fir_clk)     ,
.noisy_signal   (noisy_signal),
.filtered_signal(filtered_signal)
);
endmodule
