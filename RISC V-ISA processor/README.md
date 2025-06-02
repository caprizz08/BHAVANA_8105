# 🚀 RISC-V ISA Processor using Verilog

---

## 📌 Overview
This project focuses on the design and implementation of a *32-bit RISC-V (RV32I)* processor using *Verilog HDL*. The processor is developed in a modular fashion and simulates the instruction pipeline architecture (fetch, decode, execute, memory, write-back). It is capable of executing basic arithmetic, logic, and control operations and is targeted for FPGA implementation on platforms like **Basys3** using *Xilinx Vivado*.

---

## 🎯 Objectives
- To understand and implement the *RISC-V RV32I Instruction Set Architecture*.
- To build individual processor components such as *ALU, Control Unit, Register File, Memory Interface*.
- To verify functional correctness through simulation.
- To synthesize the processor for implementation on an FPGA.

---

## ⚙️ Features
- Modular Verilog design following *5-stage pipeline* (optional).
- Implements a subset of *RISC-V RV32I* instructions.
- Includes:
  - Arithmetic Logic Unit (ALU)
  - Control Unit
  - Register File
  - Program Counter & Instruction Memory
  - Data Memory Interface
- Testbench validation for correctness.
- Resource utilization analyzed via Vivado synthesis.

---

## 🛠 Tools & Technologies
- *Xilinx Vivado Design Suite* (Synthesis and Implementation)
- *ModelSim / Vivado Simulator* (Functional simulation)
- *Verilog HDL* (Hardware design)
- *Digilent Basys3 Board* (FPGA Target Board)

---

## 🧠 Architecture
### 🔧 Module Descriptions

| Module Name        | File Name               | Description |
|--------------------|--------------------------|-------------|
| `RV_Processor`      | `RV_Processor.v`         | Top-level module integrating all components of the RISC-V processor. |
| `instr_mem`         | `InstructionMemory.v`    | Fetches instructions based on the program counter (PC). |
| `control`           | `Control_unit.v`         | Decodes the opcode and generates control signals. |
| `reg_file`          | `Register.v`             | Contains 32 general-purpose registers; handles register read/write operations. |
| `sign_ext`          | `SignExtender.v`         | Performs immediate value sign extension. |
| `alu`              | `ALU.v`                  | Executes arithmetic and logical operations. |
| `data_mem`         | `Data_Memory.v`          | Handles load and store operations from/to memory. |

---

> These modules interact to perform the **Instruction Fetch → Decode → Execute → Memory → Write Back** cycle as per the RISC-V RV32I ISA.
         
---

## 🧪 Simulation & Testing
- ✅ *Testbench* created for core components like ALU, Control Unit, and Top Module.
- ✅ Simulated sample programs for RISC-V instructions (ADD, SUB, AND, OR, LW, SW, BEQ).
- ✅ *Waveform analysis* using Vivado simulator.
- ✅ Edge cases and hazards checked in simulation.

---

## ✅ Outcome
- Successfully designed and verified a *functional 32-bit RISC-V Processor* in Verilog.
- Synthesized design fit on *Basys3 FPGA*, confirming area/resource efficiency.
- Achieved foundational understanding of **ISA design**, **hardware architecture**, and **digital processor design flow**.
- Created a reusable and extendable template for more complex instruction sets or pipelined implementations.

---

## 📬 Contact
*P. Venkata Lakshmi Bhavana*  
ECE Undergraduate | RGUKT Ongole  
GitHub: [caprizz08](https://github.com/caprizz08)
[![Email](https://img.shields.io/badge/Email-bhavanapuckakayala@gmail.com-blue?logo=gmail&logoColor=white)](mailto:bhavanapuckakayala@gmail.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-View_Profile-blue?logo=linkedin)](https://surl.li/cftmdh)
