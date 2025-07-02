`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RGUKT ONGOLE
// Engineer: P.VENKATA LAKSHMI BHAVANA
// 
// Create Date: 23.12.2024 20:01:22
// Design Name: 16-bit Arithematic Logic unit
// Module Name: ALU_16OUT_tb
// Project Name: 16 -bit(ALU) using verilog HDL
// Target Devices: Xilinx FPGA (basys3 board or similar)
// Tool Versions: vivado 2024.2
// Description: This module implements a 16-bit ALU , capable of performing arithematic and logical operations based on opcode.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Used for digital design and simulation-based testing.
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_16OUT_tb();
   // reg [15:0] a,b;
    reg[15:0]switches;
    reg[3:0] opcode;
    reg mode;
    wire [15:0] aluout;
    wire cout;
    wire Zero;
    
    ALU_16OUT alu_16(
    //.a(a),
    //.b(b),
    .switches(switches),
    .opcode(opcode),
    .mode(mode),
    .aluout(aluout),
    .cout(cout),
    .Zero(Zero));
    
   /* initial begin
    a=16'b00001101;b=16'b00000101;opcode=4'b000;#10;
    a=14'b00001101;b=16'b00000101;opcode=4'b001;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b010;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b011;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b100;#10;
    a=16'b00001101;opcode=4'b101;#10;
    a=16'b00001101;opcode=4'b110;#10;
    a=16'b00001101;opcode=4'b111;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1000;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1001;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1010;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1011;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1100;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1101;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1110;#10;
    a=16'b00001101;b=16'b00000101;opcode=4'b1111;#10;
    */
    integer i;
    initial begin
        i=4'b0000;
        opcode=8'b00000000;
        $display("Starting ALU test...");
        $monitor("Time=%0d | mode=%b | switches=%h | 0pcode=%b | aluot=%h | cout=%b | Zero=%b", 
                        $time, mode, switches, opcode, aluout, cout, Zero);
    //set a and b
        mode = 0; switches = 16'h0005; #10;// Set A = 16'h0005
        mode = 1;switches = 16'h0003;#10;// Set B = 16'h0003
        for(i=0;i<16;i=i+1)begin
        opcode=i[3:0];
        #10; 
        end $finish;
      end
endmodule
