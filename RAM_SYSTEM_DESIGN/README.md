# RAM SYSTEM DESIGN 🚀

### 🔧 Project Title: `RAM_SYSTEM_DESIGN`

### 🏢 Organization: SURE ProEd  
### 👨‍💻 Engineer: P. VENKATA LAKSHMI BHAVANA 
### 🛠️ Tools Used: Verilog, Vivado, Artix-7 FPGA (optional), ModelSim/Questasim (for simulation)  

---

## 🧠 Project Overview

This project implements a **RAM-based data communication and validation system** using Verilog HDL. It simulates the writing of generated data into RAM and verifies its correctness by reading back.

The core components include:
- A **Data Generator** for producing 32-bit values.
- A **Block RAM** (using Xilinx's `blk_mem_gen_0` IP).
- A **Data Checker** that validates data integrity.
- A **Top Module** that coordinates the flow with start/stop control.

---

## 🧩 Block Diagram

![Block Diagram](https://github.com/caprizz08/BHAVANA_8105/blob/main/RAM_SYSTEM_DESIGN/RAM_block_diagram.jpeg)
---

## 🔧 RTL Architecture

![schematic](https://github.com/caprizz08/BHAVANA_8105/blob/main/RAM_SYSTEM_DESIGN/schematic_diagram/RAM_SCHEMATIC.png)

---

## 🖥️ Simulation Result

![Simulation Output](https://github.com/caprizz08/BHAVANA_8105/blob/main/RAM_SYSTEM_DESIGN/simulation/RAM_SIM.png)

---

## 📁 Module Description

### `data_generator.v`
- Generates a stream of 32-bit sequential data on receiving a `start` pulse.
- Latency: 1 clock cycle.
- Ports: `i_clk`, `i_rst`, `i_start`, `o_data_valid`, `o_data`.

### `blk_mem_gen_0` (RAM IP)
- 64-word RAM, each word 32 bits.
- Supports synchronous read/write operations.
- Write controlled by `wea = 4'b1111` when writing data.

### `data_checker.v`
- Receives data from RAM and internally regenerates expected data.
- Compares incoming data with expected data.
- Validates the frame upon completion.
- Generates:
  - `o_checking_done` – End-of-frame signal
  - `o_valid_frame` – Indicates correctness of the received data

### `top_module.v`
- Integrates the generator, RAM, and checker.
- Manages:
  - Start/stop system control
  - Write/read address generation
  - Valid signal pipelining
  - Frame counting and match result tracking

---

## ⚙️ Control Flow

1. User gives `i_start_system` pulse.
2. 64 packets generated → written to RAM.
3. Write completes → triggers checker.
4. 64 packets read → checked for validity.
5. `checker_done` and `valid_frame` flags are raised.
6. `i_stop_system` can pause the system.

---

## 📊 Output Signals

| Signal                | Description                               |
|------------------------|-------------------------------------------|
| `data_sets_generated` | Total number of frames processed          |
| `data_sets_matched`   | Number of frames matched successfully     |

---

## ✅ Features

- Frame-based data validation  
- Memory-mapped structure simulation  
- Controlled start/stop mechanism  
- Separate read and write logic  
- Counter-based flow tracking  

---

## 📦 How to Run

### In Vivado:
1. Create a new project.
2. Add source files: `data_generator.v`, `data_checker.v`, `top_module.v`.
3. Generate RAM IP (`blk_mem_gen_0`): 64x32-bit.
4. Simulate using a testbench or synthesize for FPGA.

### In Simulation:
- Use `i_start_system` and `i_stop_system` as test stimuli.
- Observe `data_sets_generated` and `data_sets_matched`.

---

## 📌 Future Enhancements
- Add error injection to test checker robustness  
- Expand to multi-frame buffers  
- FPGA implementation with buttons/switches for start/stop  

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
