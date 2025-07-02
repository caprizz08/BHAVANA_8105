# 16-bit ALU using FPGA (Basys3 Board)🔧💻

## 🧾 Overview
This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL, synthesized on a Basys3 FPGA development board. The ALU performs basic arithmetic and logic operations, such as addition, subtraction, bitwise operations, shifting, and comparison.

## 🎯 Objectives
- Understand ALU architecture in digital systems
- Practice Verilog design and simulation
- Deploy on FPGA hardware using Xilinx Vivado

## ✨ Features
- 16-bit inputs and output
- Supports addition, subtraction
- Bitwise AND, OR, XOR, NOT
- Shift left, shift right
- Comparison operations (zero, negative flags)

## 🧰 Tools Used
- **Simulation tool:** Xilinx Vivado
- **Hardware:** Basys3 FPGA Board
- **Language:** Verilog HDL

## 🏗️ Architecture
The ALU design is modular and includes:
- ALU Control Unit
- Arithmetic Block
- Logic Block
- Shifter Unit
- Comparator

## ⚙️ Functional Description
**Inputs:**
- `A[15:0]`: First operand
- `B[15:0]`: Second operand
- `ALU_Sel[3:0]`: 4-bit select signal to choose operation

**Outputs:**
- `ALU_Out[15:0]`: Result of selected operation
- `Zero`: Flag indicating if output is zero
- `Overflow`: Flag for overflow detection

## 🧪 Simulation & Testing
Testbenches are written in Verilog to validate all operations. 
Simulations are run using the Vivado simulator.

## 🏆 Outcome
- Designed and implemented ALU architecture
- Successfully synthesized and deployed the ALU on the Basys3 board
- Performs all operations based on control inputs; results displayed on 7-segment displays and LEDs
- Includes functional and edge-case simulation
- Signal-level debugging and waveform analysis completed

## 📝 Prerequisites
- [Xilinx Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html) installed (version 2024.2 or later recommended)
- Basic knowledge of Vivado IDE and HDL simulation

### Minimum System Requirements
1. **Operating System:**
   - **Windows:** Windows 10 or later (64-bit)
   - **Linux:** CentOS/RHEL 7.6 or later, Ubuntu 18.04 or later (64-bit)
2. **Processor:**
   - Minimum: Quad-core processor
   - Recommended: Intel i7 or AMD Ryzen equivalent (multi-core)
3. **RAM:**
   - Minimum: 8 GB
   - Recommended: 16 GB or higher for large projects
4. **Disk Space:**
   - Minimum: 50 GB free
   - Recommended: 100 GB free

## 📂 Project Files

- [`ALU_16OUT.v`](https://github.com/caprizz08/BHAVANA_8105/blob/main/16-bit-ALU/ALU_16OUT.v): Main Verilog module for the ALU
- [`ALU_16OUT_tb.v`](https://github.com/caprizz08/BHAVANA_8105/blob/main/16-bit-ALU/ALU_16OUT_tb.v): Testbench for simulation and verification

---

### 🖼️ Simulation Waveforms

![ALU MODE schematic](16-bit-ALU/ALU_MODE_schematic.png)  
![ALU mode simulation](16-bit-ALU/ALU_mode_simulation.png)

---

## 🚀 Running Simulation in Vivado

**Step 1: Open Vivado and Create/Open the Project**
- Launch Vivado
- Create a new project or open the existing `ALU_16OUT.xpr` project
- Add the source file (`ALU_16OUT.v`) to the project

**Step 2: Set the Simulation Top Module**
- In the Vivado Flow Navigator, under **Simulation**, click **Run Simulation** > **Run Behavioral Simulation**
- Set `ALU_16OUT_tb.v` as the top module for simulation

**Step 3: Run the Simulation**
- The Vivado simulator (XSIM) will launch
- The waveform window will open displaying simulation results
- Run the simulation for the desired time (e.g., in the TCL console: `run 100 ns`)
- Observe the output signals in the waveform viewer

**Step 4: Analyze Results**
- Verify behavior by checking waveform outputs
- Use zoom, cursors, and measurement tools to inspect timing and characteristics

---

## 📝 Additional Notes
- To modify simulation time or add assertions, update the testbench file
- For synthesis and implementation, ensure the correct constraints file (`.xdc`) is set
- Refer to [Vivado documentation](https://docs.xilinx.com/) for advanced simulation options

---

## 📌 Future Scope
- Pipelined ALU design
- Integration into CPU datapath
- Support for signed/unsigned multiplication and division

---

## 📬 Contact
For queries or collaboration, please open an issue or contact the repository owner:  
**P. Venkata Lakshmi Bhavana, ECE Undergraduate, IIIT Ongole.**

[![Email](https://img.shields.io/badge/Email-bhavanapuckakayala@gmail.com-blue?logo=gmail&logoColor=white)](mailto:bhavanapuckakayala@gmail.com)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-View_Profile-blue?logo=linkedin)](https://surl.li/cftmdh)  
[![GitHub](https://img.shields.io/badge/GitHub-caprizz08-181717?logo=github)](https://github.com/caprizz08)

---

## 📄 License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) – feel free to use, modify, and distribute.  
Let me know if you'd like a version customized for a specific simulation tool (like Vivado or ModelSim), or if you’d like to add GitHub badges and a license section.

---
