# 16-bit ALU using FPGA (Basys3 Board)

## Overview
This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL and is synthesized on a Basys3 FPGA development board. The ALU performs basic arithmetic and logic operations based on input control signals.

## Objectives
- Understand ALU architecture in digital systems
- Practice Verilog design and simulation
- Deploy on FPGA hardware using Xilinx Vivado
  
## Features
- Addition, Subtraction
- Bitwise AND, OR, XOR, NOT
- Shift Left, Shift Right
- Comparison operations (Zero, Negative)

## Tools Used
- **Simulation tool**:Xilinx Vivado
- **Hardware**:Basys3 FPGA Board
- **Language**: Verilog HDL

## Architecture
The ALU design is modular and includes:
- ALU Control Unit
- Arithmetic Block
- Logic Block
- Shifter Unit
- Comparator

## Simulation & Testing
Testbenches were written in Verilog to validate all operations. Simulations were run using Vivado simulator.

## Outcome
The ALU was successfully synthesized and implemented on the Basys3 board. It performs all operations based on control inputs and displays results on the 7-segment and LEDs.

## Getting Started
1. Clone the repository.
2. Open the project in Xilinx Vivado.
3. Run simulation and synthesis.
4. Deploy the bitstream to the Basys3 board.

## Demo Images / Files
(Add images or waveform screenshots here if available)

## Author
P. Venkata Lakshmi Bhavana  
ECE Undergraduate, RGUKT Ongole.
