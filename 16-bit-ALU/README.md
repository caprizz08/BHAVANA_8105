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

## 🧪 Simulation & Testing
Testbenches were written in Verilog to validate all operations. 
Simulations were run using Vivado simulator.

## Outcome
- Designing and implemented ALU architecture
- The ALU was successfully synthesized and implemented on the Basys3 board. 
- It performs all operations based on control inputs and displays results on the 7-segment and LEDs.
- Functional and edge-case simulation
- Signal-level debugging and waveform analysis

## Prerequisites
- Xilinx Vivado Design Suite installed (Version 2024.2 or later recommended)
- Basic knowledge of Vivado IDE and HDL simulation

- ### Minimum System Requirements:
1. *Operating System*:
   - *Windows*:
     - Windows 10 or later (64-bit versions only).
   - *Linux*:
     - CentOS/RHEL 7.6 or later (64-bit).
     - Ubuntu 18.04 or later (64-bit).
2. *Processor*:
   - Minimum: Quad-core processor.
   - Recommended: Intel i7 or AMD Ryzen equivalent (multi-core).
3. *RAM*:
   - Minimum: 8 GB.
   - Recommended: 16 GB or higher for large projects and smoother performance.
4. *Disk Space*:
   - Minimum: 50 GB free space.
   - Recommended: 100 GB free space to accommodate project files, temporary files, and additional libraries.
     
## 📂 Project Files

- [16-bit ALU File- ALU_16OUT.v](16-bit-ALU/ALU_16OUT.v): Main Verilog module for the ALU.
- [16-bit ALU Testbench - ALU_16OUT_tb.v](https://github.com/caprizz08/BHAVANA_8105/blob/04dde9301b9ee86ea4ca764a6b74308b12a9142b/PULSE%20GENERATOR/pulse_gen_sir_tb): Testbench used for simulation and verification of the ALU.

---

##🖼️  Demo Images / Files
(Add images or waveform screenshots here if available)

---

## 🚀 How to Run Simulation in Vivado
### Step 1: Open Vivado and Create/Open the Project
- Launch Vivado.
- Create a new project or open the existing `ALU_16OUT.xpr` project.
- Add the source file (`ALU_16OUT.v`) to the project.

### Step 2: Set the Simulation Top Module
- In the Vivado Flow Navigator, under **Simulation**, click on **Run Simulation** > **Run Behavioral Simulation**.
- Ensure that the testbench file `ALU_16OUT_tb.v` is set as the top module for simulation.

### Step 3: Run the Simulation
- The Vivado simulator (based on XSIM) will launch.
- The waveform window will open displaying simulation results.
- Run the Simulation for the desired time by clicking the **Run** button or specifying the run time in the TCL console, for example:
run 100 ns
- Observe the output signals in the waveform viewer.

### Step 4: Analyze Results
- Verify the behavior by checking the waveform outputs.
- Use zoom, cursors, and measurement tools to inspect timing and characteristics.

---
## Additional Notes
- To modify simulation time or add assertions, update the testbench file.
- For synthesis and implementation, ensure to set the correct constraints file (`.xdc`).
- Refer to Vivado documentation for advanced simulation options.

---

## 📌 Future Scope
- Pipelined ALU design
- Integration into CPU datapath
- Support for signed/unsigned multiplication and division

---

## 📬 Contact
For any queries or collaboration, feel free to open an issue or contact the repository owner.
P. VENKATA LAKSHMI BHAVANA, ECE UNDERGRADUATE, IIIT ONGOLE.
[![Email](https://img.shields.io/badge/Email-bhavanapuckakayala@gmail.com-blue?logo=gmail&logoColor=white)](mailto:bhavanapuckakayala@gmail.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-View_Profile-blue?logo=linkedin)](https://surl.li/cftmdh)
[![GitHub](https://img.shields.io/badge/GitHub-caprizz08-181717?logo=github)](https://github.com/caprizz08)

---
## 📄 License
This project is licensed under the MIT License – feel free to use, modify, and distribute.
Let me know if you'd like a version customized to a specific simulation tool (like Vivado or ModelSim), or if you’d like to add GitHub badges and a license section.

---
