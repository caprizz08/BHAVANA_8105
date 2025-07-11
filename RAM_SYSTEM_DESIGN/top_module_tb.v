`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:sure trust 
// Engineer: VENKATA LAKSHMI BHAVANA
// 
// Create Date: 12.06.2025 20:13:42
// Design Name: ram_system_design
// Module Name: top_module_tb
// Project Name: top module
// Target Devices: 
// Tool Versions: vivado 2024.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/******************************************
   Organization Name: SURE ProEd
   
   Engineer Name: Dev Chadha
   
   Project Name: Task 2
   
   Module Name: dff_tb
   
   Description:
   
   Latency:
   
   Version:
******************************************/

// Objective: Design a tb for a [7:0] dff
// clk, rst, [7:0] data_in, [7:0] data_out

// Unit of time is specified through `timescale

  //  10^-6/10^-12 == 10^6
   
// What is `timescale??
`timescale 1ns/1ps   // This means, your time unit is in ns (10^-9)
                     // 1ps means, precison is in ps (10^-12)
                     // Your time scaling would be from 1.000ns

module top_module_tb ();
   
   // Parameter declaration (Parameters are Macros)
   // These are compile time contants
   localparam tclk = 10;  // Not specifying unit of time
   
   reg             i_clk              ;
   reg             i_rst              ;
   reg            i_start_system;  // control pulse to start the data generation : Like a turn on button
   reg             i_stop_system; // control pulse to stop the data generation  : Like a turn off button
      // ---------- Output signals ---------
   wire [31:0] data_sets_generated;  // counter indicating total data packets being generated
   wire [31:0] data_sets_matched;
   
   
   top_module top_module_inst
   (
      .i_clk(i_clk)              ,
      .i_rst(i_rst)              ,
      .i_start_system(i_start_system)  ,  
      .i_stop_system(i_stop_system)   , 
      .data_sets_generated(data_sets_generated),  
      .data_sets_matched(data_sets_matched)  
   );
   
   // initilization of signals
   initial begin
      // we initialize the signals 
      // for time instant = 0
      i_clk     <= 1'b1;
      i_rst     <= 1'b1;
      i_start_system <= 1'b0;
      // data_in = 8'b0;
   end
   
   
   // Clock generation
   // Periodic pulse train; time period
   // After every T/2 time clk signal toggles
   
   // always begin
      // clk <= 1'b1;
      // #(tclk/2);
      // clk <= 1'b0;
      // #(tclk/2);
   // end
   
   always #(tclk/2) i_clk <= ~i_clk;
   
   // How do we drive reset
   initial begin
      // #(10*ti_clk);
      @(posedge i_clk);
      @(posedge i_clk);
      @(posedge i_clk);
      @(posedge i_clk);
      i_rst <= 0; 
      @(posedge i_clk);
      @(posedge i_clk);
      @(posedge i_clk);
      @(posedge i_clk);
      i_start_system <= 1'b1;
      @(posedge i_clk);
      i_start_system <= 1'b0;
      
   end
  
endmodule

     
