`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SURE PROed
// Engineer: VENKATA LAKSHMI BHAVANA
// 
// Create Date: 12.06.2025 19:06:42
// Design Name: RAM_SYSTEM _DESIGN 
// Module Name: data_generator.v
// Project Name: data_generator
// Target Devices: 
// Tool Versions: vivado 2024.2
// Description:  Description: DATA GENERATOR:
                       /* - Port list:
                           - i_clk        : system clk
                           - i_rst        : data generated in the generator resets to 0
                           - i_start      : whenever start pulse is recieved, generator starts 
                                            generating data from the previous stop value (or 0 for first iteration)
                                             -- once start pulse is recieved; data generation starts
                           - o_data_valid : indicates valid data generated from the generator
                           - o_data [31:0]: generated data from the generator
      Latency: 1 clk*/
      
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
  module data_generate
       (
          // ---------- Input signals ----------
          input             i_clk              ,
          input             i_rst              ,
          input             i_start            ,  // control signal to start the data generation
          // ---------- Output signals ---------
          output         o_data_valid       ,  // counter indicating total data packets being generated
          output [31:0] o_data                // counter indicating total data packets being generated
       );
       
       /*
          Design Details
             - Data is of incremental nature: we can generate it
               with an incremental counter
             - Data width is 32-bits, hence, counter would be 32-bit wide
             
             - The counter resets to 0 whenever we get reset
             - The counter starts incrementing when we get i_start pulse
             - The generator generates 64 data for a Tx packet
             - The data generation starts from seed value 
                - seed = 32'b0 for 1st interation
                - seed = last value of previous packet for other interations
         
         - We also require a control counter that keeps 
           a check on number of data begin generated
           It counts from 0-63 for every iteration
           
           This counter will count from 0-63 in every iteration
           Size of the counter [5:0]
       */
       
       reg         generate_data  ; // This signal stays high for 64 clks
       reg [5 :0]  control_counter;
       reg [31:0]  generated_data ;
       
       // *** generate_data flag logic *** //
       always @ (posedge i_clk) begin
          if (i_rst) begin
             generate_data <= 1'b0;
          end else begin
             if (i_start) begin
                generate_data <= 1'b1;
             end else if (control_counter == 6'd63) begin
                generate_data <= 1'b0;
             end
          end
       end
       
       // *** Control counter logic *** //
       always @ (posedge i_clk) begin
          if (i_rst) begin
             control_counter <= 6'b0;
          end else begin
             if (generate_data) begin
                control_counter <= control_counter + 6'b1;
             end
          end
       end
       
       // *** Data counter logic *** //
       always @ (posedge i_clk) begin
          if (i_rst) begin
             generated_data <= 32'b0;
          end else begin
             if (generate_data) begin
                generated_data <= generated_data + 32'b1;
             end
          end
       end
       
       assign o_data_valid = generate_data ;
       assign o_data       = generated_data;    
endmodule
