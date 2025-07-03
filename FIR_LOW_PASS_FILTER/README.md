# Digital FIR Low Pass Filter
Building a 9-tap Finite Impulse Response (FIR) lowpass filter.
## Overview
This project implements a Digital Low Pass FIR (Finite Impulse Response) Filter using Verilog HDL. The design includes modules for the FIR filter and CORDIC-based sine/cosine signal generation, along with their testbenches, aimed at simulation and verification of filter response.

## Functional Description
- The `FIR` module receives a digital input (e.g., a sinusoidal signal) and filters out frequencies above the designed cut-off.
- The `sincos.v` module generates sine and cosine waveforms, serving as test signals for the filter.
- Testbenches (`FIR_tb.v` and `sincos_tb.v`) provide automated simulation scenarios and stimulus, checking for expected outputs.



- 📌 Target cutoff frequency: ~10MHz.
  💡 Sampling clock frequency: 100MHz.

## 1. Project Overview
- 📊 Filter type: 9-tap FIR lowpass filter.
- 🎯 Implemented in: Verilog.
- 🔄 Purpose: Attenuate high-frequency components.

## 2. Filter Implementation
- 📈 Synthesizing two sine waves for testing.
- 📉 First sine wave frequency: 2MHz.
- 📊 Second sine wave frequency: 30MHz.

## 3. Testbench Design
- ➕ Addition of the two sine waves to create a "noisy" signal.
- 🔄 Resampling of the noisy signal at 100MHz.
- 🔌 Feeding the resampled noisy signal into the FIR lowpass filter.

## 4. Signal Generation
- 📉 Attenuation of the 30MHz component of the noisy signal.
- ✅ Preservation of the 2MHz component of the noisy signal.
- 🎯 Demonstration of lowpass filtering effectiveness.

## 5. Expected Filter Behavior
- 🌊 Top two analog waveforms: Individual 2MHz and 30MHz sine waves.
- 🔵 Third noisy signal (cyan): Sum of the two sine waves, resampled at 100MHz.
- 🟣 Fourth filtered signal (magenta): Output from the FIR lowpass filter.

## 6. Visual Representation of Signals
- 📉 Clear attenuation of the 30MHz component.
- ✅ Unchanged 2MHz component, confirming lowpass action.
- 📊 Visual confirmation of filter performance.

## 7. Tools Used
- #️⃣ FPGA: Field-Programmable Gate Array.
- #️⃣ Xilinx Vivado (for CORDIC IP/core generation/Modules/Testbench)
- #️⃣ Verilog: Hardware description language.

## 8. Key Technologies
- #️⃣ DSP: Digital Signal Processing.
- #️⃣ Impulse Response: Characteristic of FIR filters.
- #️⃣ Simulation: Testing filter behavior before hardware implementation.

## Objectives
- Develop a Verilog-based FIR low pass filter.
- Generate sine and cosine test signals using the CORDIC algorithm (via IP or direct Verilog).
- Simulate and verify the filter’s frequency response to sinusoidal inputs.

## Features
- Parameterized FIR filter module.
- Sine and cosine signal generation using CORDIC approach (`sincos.v`).
- Comprehensive testbenches for both FIR filter and CORDIC generator.
- Ready for simulation in standard HDL tools.

## Architecture
## Simulation and Testing
- Run `sincos_tb.v` to verify output waveforms from the CORDIC generator.
- Run `FIR_tb.v` with sine/cosine signals as input to verify filtering action.
- Use waveform viewers to inspect output quality, frequency response, and attenuation.

## Outcomes
- Functional and verified digital FIR low pass filter.
- Accurate sine/cosine signal generation for test and measurement.
- Simulation waveforms demonstrating filter performance.
  
## 📝 Prerequisites
- [Xilinx Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html) installed (version 2022.2 or later recommended)
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

- [`FIR.v`](https://github.com/caprizz08/BHAVANA_8105/blob/main/FIR_LOW_PASS_FILTER/FIR.v): Main Verilog module for the FIR filter.
- [`FIR_tb.v`](https://github.com/caprizz08/BHAVANA_8105/blob/main/FIR_LOW_PASS_FILTER/FIR_tb.v): Testbench for simulation and verification.
- [`sincos.v`](https://github.com/caprizz08/BHAVANA_8105/blob/main/FIR_LOW_PASS_FILTER/sincos.v): Main Verilog module for the sincos signal generator.
- [`sincos_tb.v`](https://github.com/caprizz08/BHAVANA_8105/blob/main/FIR_LOW_PASS_FILTER/sincos_tb.v): Testbench for simulation and verification of sincos.

---

### 🖼️ Simulation Waveforms
- Expected: 
  - Sine 2MHz and sine 30MHz outputs (from `sincos.v`)
  - Noisy signal(Sine 2MHz + sine 30MHz).
  - Filtered output signal (from `FIR.v`)
- Use Vivado or ModelSim waveform viewer to analyze and capture results.
![FIR_SIMULATION](https://github.com/caprizz08/BHAVANA_8105/blob/main/LOW_PASS_FIR_FILTER/FIR_SIMULATION.png)  
![FIR_SIMULATION_1](https://github.com/caprizz08/BHAVANA_8105/blob/main/LOW_PASS_FIR_FILTER/FIR_SIMULATION_1.png)
![FIR_SCHEMMATIC](https://github.com/caprizz08/BHAVANA_8105/blob/main/LOW_PASS_FIR_FILTER/FIR_SCHEMMATIC.png)  
![FIR_ELABORATED](https://github.com/caprizz08/BHAVANA_8105/blob/main/LOW_PASS_FIR_FILTER/FIR_ELABORATED.png)

---

## How to Run
1.  Generate and integrate CORDIC IP core for `sincos.v` using Xilinx Vivado.
2. Compile all Verilog files in your preferred simulator.
3. Run `sincos_tb.v` to verify waveform generation.
4. Run `FIR_tb.v` to simulate the filter response to test signals.
5. View results using the simulator’s waveform viewer.

## Additional Notes
- Ensure that all module and signal names match between main modules and testbenches.
- Modify filter coefficients in `FIR.v` as needed for your application.
- For hardware realization, add appropriate constraints and top-level integration.

## Future Scope
- Implementation on FPGA (hardware testing and measurement).
- Extension to adaptive or multi-band FIR filters.
- Real-time audio/signal processing use cases.
- GUI for dynamic filter coefficient updates.

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
