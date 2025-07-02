# 16-bit ALU using FPGA (Basys3 Board)🔧💻

## 🧾Overview
This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL and is synthesized on a Basys3 FPGA development board. The ALU performs basic arithmetic and logic operations such as addition, subtraction, bitwise AND, OR, XOR, NOT, shift operations, and comparison. It is parameterized for flexibility and suitable for integration in larger digital systems.

## 🎯 Objectives
- Understand ALU architecture in digital systems
- Practice Verilog design and simulation
- Deploy on FPGA hardware using Xilinx Vivado
  
## ✨ Features
- 16-bit inputs and output
- Addition, Subtraction
- Bitwise AND, OR, XOR, NOT
- Shift Left, Shift Right
- Comparison operations (Zero, Negative)

##  🧰Tools Used
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

## ⚙️ Functional Description

- *Inputs:*
  - A[15:0]: First operand
  - B[15:0]: Second operand
  - ALU_Sel[3:0]: 4-bit select signal to choose operation

- *Outputs:*
  - ALU_Out[15:0]: Result of selected operation
  - Zero: Flag indicating if output is zero
  - Overflow: Flag for overflow detection

##🧪 Simulation & Testing
Testbenches were written in Verilog to validate all operations. 
Simulations were run using Vivado simulator.

## Outcome
- Designing and implemented ALU architecture
- The ALU was successfully synthesized and implemented on the Basys3 board. 
- It performs all operations based on control inputs and displays results on the 7-segment and LEDs.
- Functional and edge-case simulation
- Signal-level debugging and waveform analysis

## Getting Started
1. Clone or download the repository.
2. Open in your preferred simulator (ModelSim, Vivado, etc.)
3. Run the testbench to verify ALU functionality.
4. Observe waveform for validation.

##🖼️  Demo Images / Files
(Add images or waveform screenshots here if available)


📌 Future Scope
- Pipelined ALU design
- Integration into CPU datapath
- Support for signed/unsigned multiplication and division

## Author
P. Venkata Lakshmi Bhavana  
ECE Undergraduate, RGUKT Ongole.
