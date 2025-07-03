# 🎛️ Digital FIR Low Pass Filter

This project implements a **9-tap Finite Impulse Response (FIR) Low Pass Filter** in Verilog HDL. It also features a 🌀 CORDIC-based sine/cosine signal generator for testing, with comprehensive testbenches and simulation waveforms.

## 📝 Overview

- **Filter Type:** 9-tap FIR lowpass filter  
- **Purpose:** Attenuates high-frequency components from digital signals  
- **Target Cutoff Frequency:** ~10 MHz (Sampling Clock: 100 MHz)  
- **Test Signals:** Sine waves at 2 MHz and 30 MHz (generated using CORDIC)

## 🔍 Functional Description

- The FIR filter module (`FIR.v`) processes digital input signals and removes frequencies above the cutoff.
- The `sincos.v` module generates test sine and cosine waveforms.
- Testbenches (`FIR_tb.v`, `sincos_tb.v`) automate simulation and verification.

## ⚙️ Implementation & Testing

1. **Signal Generation:**  
   - Two sine waves at 2 MHz and 30 MHz are generated and summed to create a noisy test signal. 🎶
   - The noisy signal is resampled at 100 MHz and fed into the FIR filter.

2. **Filter Output:**  
   - The 30 MHz component is attenuated, while the 2 MHz component passes through. ✅

3. **Expected Results:**  
   - Top two waveforms: 2 MHz and 30 MHz sines. 🌊
   - Third waveform: Noisy (sum) signal. 🔊
   - Fourth waveform: FIR filter output (only 2 MHz component remains). 🎯

## 🛠️ Tools & Technologies

- Xilinx Vivado Design Suite (recommended version: 2022.2 or later) 🖥️
- Verilog HDL 💾
- CORDIC IP/core for signal generation
- Simulation waveform viewers (Vivado or ModelSim) 📈

## 📂 Project Files

- `FIR.v`: FIR filter module
- `FIR_tb.v`: FIR filter testbench
- `sincos.v`: Sine/cosine generator (CORDIC-based)
- `sincos_tb.v`: Testbench for sine/cosine generator

## 📊 Simulation Waveforms

- Sine 2 MHz and 30 MHz outputs (from `sincos.v`) 🌐
- Noisy signal (sum)
- Filtered output (from `FIR.v`)
- ![FIR_SIMULATION](../LOW_PASS_FIR_FILTER/FIR_SIMULATION.png)
- ![FIR_SIMULATION_1](../LOW_PASS_FIR_FILTER/FIR_SIMULATION_1.png)
- ![FIR_SCHEMMATIC](../LOW_PASS_FIR_FILTER/FIR_SCHEMMATIC.png)
- ![FIR_ELABORATED](../LOW_PASS_FIR_FILTER/FIR_ELABORATED.png)

## ▶️ How to Run

1. Generate and integrate the CORDIC IP core for `sincos.v` in Vivado.
2. Compile all Verilog files in your simulator.
3. Simulate `sincos_tb.v` to verify waveform generation.
4. Simulate `FIR_tb.v` to test filter response.
5. Analyze results in your simulator’s waveform viewer. 👀

## 💻 Prerequisites

- Xilinx Vivado Design Suite (2022.2+)
- Operating System: Windows 10+ (64-bit) / Linux (CentOS/RHEL 7.6+, Ubuntu 18.04+)
- Processor: Quad-core minimum (i7/Ryzen recommended) 🧠
- RAM: 8 GB minimum (16 GB+ recommended) 🪫
- Disk Space: 50–100 GB free 💾

## 🛠️ Customization & Notes

- Adjust filter coefficients in `FIR.v` for your application. 🔧
- Ensure module and signal names match between sources and testbenches.
- For hardware implementation, add appropriate constraints and integration.

## 🚀 Future Scope

- FPGA hardware testing and measurement
- Adaptive/multi-band FIR filters
- Real-time signal processing applications
- GUI for dynamic coefficient updates

## 📬 Contact

For questions or collaboration, open an issue or contact:  
**P. Venkata Lakshmi Bhavana, ECE Undergraduate, IIIT Ongole**  
[![Email](https://img.shields.io/badge/Email-bhavanapuckakayala@gmail.com-blue?logo=gmail&logoColor=white)](mailto:bhavanapuckakayala@gmail.com)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-View_Profile-blue?logo=linkedin)](https://surl.li/cftmdh)  
[![GitHub](https://img.shields.io/badge/GitHub-caprizz08-181717?logo=github)](https://github.com/caprizz08)

## 📝 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) – feel free to use, modify, and distribute. 🎉
