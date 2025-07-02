`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RGUKT ONGOLE
// Engineer: P.VENKATA LAKSHMI BHAVANA
// 
// Create Date: 23.12.2024 20:01:22
// Design Name: 16-bit Arithematic Logic unit
// Module Name: ALU_16OUT
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


module ALU_16OUT(
    //input [15:0] a,//operand a
   // input [15:0] b,//operand b
    input [15:0]switches,
    input [3:0] opcode,
    input mode,//4-bits selection line(opcode)//
    output reg [15:0] aluout,// result of the operation
    output reg cout,//carry output
    output Zero//zero flag 
    );
     wire [15:0]a,b;
     assign a=(mode==1'b0)?switches:16'b0;
     assign b=(mode==1'b1)?switches:16'b0;
    assign Zero=(aluout==16'b0);//zero flag if the output is zero//
    //ALU operations
   reg [31:0]result;
   
    always@(*)begin
    cout=1'b0;
    aluout=32'b0;
    case(opcode)
    4'b0000:begin
    {cout,aluout}=a+b;//ADD//
    end
    4'b0001:begin
    {cout,aluout}=a-b;//SUB//
    end
    4'b0010:begin
    aluout=a&b;
    cout=1'b0;//1 if both are 1 else 0//AND
    end
    4'b0011:begin
    aluout=a|b;
    cout=1'b0;//1 if one of input is 1//OR
    end
    4'b0100:begin
    aluout=a^b;
    cout=1'b0;//1 if odd no of inputs are 1//XOR
    end
    4'b0101:begin
    aluout=~a;
    cout=1'b0;//complement of a//
    end
    4'b0110:begin
    aluout=a<<1;
    cout=1'b0;//Logical left shift by 1 bit //
    end
    4'b0111:begin
    aluout=a>>1;
    cout=1'b0;// logical right shift by 1//
    end
    4'b1000:begin
    aluout=~(a|b);
    cout=1'b0;// NOR OPERATION 
    end
    4'b1001:begin
    aluout=(a<b)?1'b1:1'b0;
    cout=1'b0;//i if a is less than b//
    end
    4'b1010:begin
    aluout=(a>b)?1'b1:1'b0;
    cout=1'b0;//i if a is greater than b//
    end
    4'b1011:begin
    aluout=~(a^b);
    cout=1'b0;// XNOR OPERATION 
    end
    4'b1100:begin
    result=a*b;
    aluout=result[15:0];
    cout=result[16];//MUL//
    end
    4'b1101:begin
    aluout=(b!=0)?a%b:16'b0;
    cout=1'b0;//mod//
    end
    4'b1110:begin
    aluout=(b!=0)?a/b:16'b0;
    cout=1'b0;//div//
    end
    4'b1111:begin
    aluout=~(a&b);
    cout=1'b0;//NAND operation //
    end
    default:
    aluout=16'h0000;
    
    endcase
    end    
endmodule
