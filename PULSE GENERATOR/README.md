# 🔁 Pulse Generator – Verilog Project

## 📖 Overview

This project implements a **Pulse Generator** in Verilog HDL that emits a periodic pulse with programmable HIGH and LOW durations. The pulse timing is fully configurable using two parameters: `PULSE_DURATION` and `PULSE_PERIOD`. This module is commonly used in digital systems for clock gating, timing signals, and control mechanisms.The design
 is targeted for simulation and synthesis in Xilinx Vivado.

---

## ✨ Features

- ⏱ **Programmable Pulse Duration**: Output remains HIGH for a configurable number of clock cycles.
- 🔁 **Periodic Output**: Pulse output repeats every `PULSE_PERIOD` clock cycles.
- 🟢 **Synchronous Start**: Pulse starts immediately after reset deassertion.
- ✔️ **Verified** with multiple test cases to ensure functionality.

---

## ⚙️ Parameters

| Parameter         | Description                                      |
|------------------|--------------------------------------------------|
| `PULSE_DURATION` | Number of clock cycles output remains HIGH       |
| `PULSE_PERIOD`   | Total number of clock cycles per pulse           |

*Note: `PULSE_PERIOD` must be ≥ `PULSE_DURATION`.*

---

## 🛠 Tools Used

- **HDL Language**: Verilog
- **Simulation Tool**: Xilinx Vivado
- **Waveform Viewer**: Vivado simulator
- **Editor**: (Optional: VS Code, Vivado IDE, etc.)

---

## ✅ Test and Verification

- Designed testbench with clock and reset generation.
- Simulated with **three test cases** using different values of `(PULSE_DURATION, PULSE_PERIOD)`.
- Verified output waveform against expected pulse pattern.

### ✔️ Test Configurations Used

| Test Case | PULSE_DURATION | PULSE_PERIOD | Result    |
|-----------|----------------|---------------|-----------|
| 1         | 8              | 10            | ✅ Passed |
| 2         | 5              | 7             | ✅ Passed |
| 3         | 5              | 9             | ✅ Passed |

---

## 📷 Output Waveform

![Waveform1](waveform.png)
![Waveform2](![pulse_gen_sir_wave 1](https://github.com/user-attachments/assets/b7ee84b7-3fd6-4544-9793-587391a0f667)
)
![Waveform3](waveform.png)

These waveforms confirm that the pulse starts synchronously after reset and matches the given duration and period parameters.

---

 ## Prerequisites
- Xilinx Vivado Design Suite installed (Version 2024.2 or later recommended)
- Basic knowledge of Vivado IDE and HDL simulation

---

## Files Included
- `pulse_gen_sir.v` — Verilog source code for the pulse generator
- `pulse_gen_sir_tb.v` — Testbench file to simulate the pulse generator
- `pulse_gen_sir.xpr` — Vivado project file (optional)
  ## 📂 Project Files

- [pulse_gen_sir.v](pulse_gen_sir.v): Main Verilog module
- [pulse_gen_sir_tb.v](pulse_gen_sir_tb.v): Testbench for simulation
---

## 🚀 How to Run Simulation in Vivado

### Step 1: Open Vivado and Create/Open the Project
- Launch Vivado.
- Create a new project or open the existing `pulse_gen_sir.xpr` project.
- Add the source files (`pulse_gen_sir.v` and `pulse_gen_sir_tb.v`) to the project.

### Step 2: Set the Simulation Top Module
- In the Vivado Flow Navigator, under **Simulation**, click on **Run Simulation** > **Run Behavioral Simulation**.
- Ensure that the testbench file `pulse_generator_tb.v` is set as the top module for simulation.

### Step 3: Run the Simulation
- The Vivado simulator (based on XSIM) will launch.
- The waveform window will open displaying simulation results.
- Run the Simulation for the desired time by clicking the **Run** button or specifying the run time in the TCL console, for example:
run 100 ns
- Observe the output pulse signals in the waveform viewer.

### Step 4: Analyze Results
- Verify the pulse generator's behavior by checking the waveform outputs.
- Use zoom, cursors, and measurement tools to inspect timing and pulse characteristics.

---
## Additional Notes
- To modify simulation time or add assertions, update the testbench file.
- For synthesis and implementation, ensure to set the correct constraints file (`.xdc`).
- Refer to Vivado documentation for advanced simulation options.

---

📬 Contact
For any queries or collaboration, feel free to open an issue or contact the repository owner.
P. VENKATA LAKSHMI BHAVANA, ECE UNDERGRADUATE, IIIT ONGOLE.
[![Email](https://img.shields.io/badge/Email-bhavanapuckakayala@gmail.com-blue?logo=gmail&logoColor=white)](mailto:bhavanapuckakayala@gmail.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-View_Profile-blue?logo=linkedin)](https://surl.li/cftmdh)
[![GitHub](https://img.shields.io/badge/GitHub-caprizz08-181717?logo=github)](https://github.com/caprizz08)

---

📄 License

This project is licensed under the MIT License – feel free to use, modify, and distribute.

---

Let me know if you'd like a version customized to a specific simulation tool (like Vivado or ModelSim), or if you’d like to add GitHub badges and a license section.
