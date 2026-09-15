# Comprehensive Undergraduate Course Practice & Engineering Experiment Portfolio

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)
[![Disciplines: 19 Courses](https://img.shields.io/badge/Disciplines-19%20Specialized%20Courses-red.svg?style=flat-square)](docs/)
[![Domain: Automation & AI](https://img.shields.io/badge/Domain-Automation%20%7C%20Robotics%20%7C%20AI-blueviolet.svg?style=flat-square)](src/)
[![Toolchain: Full Stack](https://img.shields.io/badge/Toolchain-MATLAB%20%7C%20Vivado%20%7C%20STM32%20%7C%20PyTorch-orange.svg?style=flat-square)](src/)
[![Status: Complete](https://img.shields.io/badge/Curriculum-Full%20Theory%20to%20Practice-green.svg?style=flat-square)](docs/)

[**中文文档**](README.md) | [**English**](README_EN.md) | [**日本語**](README_JA.md)

</div>

---

## 1. Curriculum Overview

The **Comprehensive Undergraduate Course Practice & Engineering Experiment Portfolio** serves as an exhaustive, multi-disciplinary engineering repository encompassing the full academic trajectory across Automation, Robotics Engineering, Microelectronics, and Artificial Intelligence.

Structured upon the modern engineering cycle—**"Rigorous Mathematical Derivation $\rightarrow$ Computer-Aided Simulation $\rightarrow$ Low-Level Hardware Prototyping $\rightarrow$ System-Level Integrated Verification"**—this repository aggregates experimental source code, mathematical scripts, circuit schematics, hardware description files (HDL), and formal laboratory reports across 19 core specialized courses.

Spanning analog/digital microelectronics and FPGA logic synthesis (Analog Electronics, Digital Systems, Verilog), real-time embedded systems (C Programming, ARM Cortex-M, STM32 HAL/DMA/Assembly), classical and modern dynamical control systems (Signals and Systems, Automatic Control, Modern Control Theory, Computer Control), and high-level artificial intelligence (Computer Vision, Pattern Recognition, Deep Learning via PyTorch), this portfolio demonstrates a solid theoretical foundation, disciplined software engineering, and hands-on cyber-physical integration skills.

---

## 2. Visual Showcase & Representative Experimental Milestones

<div align="center">

| Four-Tier Curriculum System Architecture | Automatic Control Closed-Loop PID Dynamic Response |
| :---: | :---: |
| <img src="docs/images/system_architecture.png" width="450" alt="Curriculum Architecture"> | <img src="docs/images/demo_control_response.png" width="450" alt="Control Response"> |
| **Computer Vision Homography & Panoramic Image Stitching** | **Pattern Recognition Non-Parametric Bayesian Classification** |
| <img src="docs/images/demo_computer_vision.jpg" width="450" alt="Computer Vision"> | <img src="docs/images/demo_pattern_recognition.png" width="450" alt="Pattern Recognition"> |

</div>

---

## 3. Comprehensive Matrix of 19 Specialized Engineering Disciplines

The following matrix categorizes all 19 specialized engineering courses, their disciplinary domains, software toolchains, and primary laboratory milestones:

| No. | Course Discipline Title | Domain | Core Tech Stack & Tools | Key Laboratory Experiments & Engineering Deliverables | Relative Directory Path |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **01** | **Analog Electronics & Simulation** | Hardware | Multisim, LTspice, Op-Amps | BJT common-emitter amplification, active bandpass filters, Wien-bridge oscillator simulation | [`Analog-Electronics-and-Simulation`](Analog-Electronics-and-Simulation) |
| **02** | **Automatic Control Principles** | Control | MATLAB, Simulink, Oscilloscope | Root-locus analysis, Bode/Nyquist frequency response, DC motor speed/position closed-loop PID tuning | [`Automatic-Control-Principles`](Automatic-Control-Principles) |
| **03** | **C Programming & Low-Level Systems** | Computing | C99, GCC, Visual Studio | Pointer arithmetic, dynamic doubly linked lists, bitfield manipulation, console engineering systems | [`C-Programming-Labs`](C-Programming-Labs) |
| **04** | **Communications & Networking** | Telecom | Wireshark, MATLAB, PacketTracer | Digital baseband transmission, QAM/FSK modulation, packet inspection across TCP/IP protocol stack | [`Communications-and-Network-Technologies`](Communications-and-Network-Technologies) |
| **05** | **Computer Control Technology** | Control | MATLAB, Discrete Control | Continuous-to-discrete conversion (Tustin transform), Dahlin digital algorithm, Smith predictor | [`Computer-Control-Technology`](Computer-Control-Technology) |
| **06** | **Computer Software Basics** | Software | C++, Python, SQL, Data Structures | Hash table collision algorithms, Red-Black tree traversals, relational database schema normalization | [`Computer-Software-Basics`](Computer-Software-Basics) |
| **07** | **Computer Vision** | AI & Vision | Python, OpenCV, NumPy | SIFT/ORB feature extraction, homography matrix estimation, perspective correction, image blending | [`Computer-Vision`](Computer-Vision) |
| **08** | **Data Acquisition & Processing** | Instrumentation | LabVIEW, AD/DA, Signal Circuits | SAR and $\Sigma\text{-}\Delta$ ADC conversion, anti-aliasing filtering, high-speed acquisition pipelines | [`Data-Acquisition-and-Processing`](Data-Acquisition-and-Processing) |
| **09** | **Digital Electronics & FPGA** | Digital Logic | Verilog HDL, Xilinx Vivado | 4x4 matrix key debouncing, DAC arbitrary waveform generation, VGA framebuffers, calculator ASIC | [`Digital-Electronics`](Digital-Electronics) |
| **10** | **Electronic Circuit Experiments** | Hardware | Altium Designer, Soldering, Test | Sensor preamplifier PCB layout, regulated DC linear supply, differential noise immunity verification | [`Electronic-Circuit-Experiments`](Electronic-Circuit-Experiments) |
| **11** | **Machine Learning** | Applied AI | PyTorch, Scikit-Learn | CNN for constellation modulation classification, MLP for Lithium-ion battery SOH regression | [`Machine-Learning`](Machine-Learning) |
| **12** | **Micro-Embedded Systems (STM32)** | Embedded | ARM Cortex-M, Keil MDK, HAL | Nested Vectored Interrupts (NVIC), circular DMA double-buffering, mixed C and Cortex-M assembly | [`Micro-Embedded`](Micro-Embedded) |
| **13** | **Modern Control Theory** | Modern Control | MATLAB, State-Space Analysis | State equation formulation, Kalman controllability/observability rank criteria, pole placement observer | [`Modern-Control-Theory`](Modern-Control-Theory) |
| **14** | **Motor Drives & Motion Actuation** | Electrical | MATLAB/Simulink, Motor Drivers | DC motor mechanical characteristics, dual closed-loop speed/current regulation (ACR/ASR) simulation | [`Motor-Drives`](Motor-Drives) |
| **15** | **Pattern Recognition** | Machine Learning | MATLAB, Statistical Learning | Minimum error-rate Bayesian decision boundary, Parzen window density estimation, SVM face classification | [`Pattern-Recognition`](Pattern-Recognition) |
| **16** | **Power Electronics Technology** | Power Eng. | MATLAB/Simulink, Inverters | Buck/Boost DC-DC converters, single-phase fully-controlled bridge rectifiers, SPWM modulation | [`Power-Electronics-Technology`](Power-Electronics-Technology) |
| **17** | **Pulse Power Technology** | High Energy | PSpice, Pulse Forming Networks | Pulse Forming Network (PFN) discharge dynamics, multi-stage Marx generators, pulse steepening | [`Pulse-Power-Technology`](Pulse-Power-Technology) |
| **18** | **Sensor Principles & Applications** | Sensing | Conditioning Circuits, Wheatstone | Strain gauge bridge non-linearity compensation, Hall-effect current sensing, thermocouple cold-junction | [`Sensor-Principles-and-Applications`](Sensor-Principles-and-Applications) |
| **19** | **Signals and Systems** | Signal Theory | MATLAB, Integral Transforms | Continuous/discrete convolution, Continuous-Time Fourier Transform (CTFT), Laplace ROC analysis | [`Signals-and-Systems`](Signals-and-Systems) |

---

## 4. Fundamental Mathematical Formulations & Control Models

To articulate theoretical rigor across multidisciplinary domains, five representative mathematical formulations implemented throughout the curriculum are documented below:

### 4.1 Continuous & Discrete Convolution Integrals for LTI Systems

For a Linear Time-Invariant (LTI) system excited by input signal $x(t)$ with unit impulse response $h(t)$, the continuous-time output $y(t)$ is evaluated via the convolution integral:

$$
y(t) = x(t) * h(t) = \int_{-\infty}^{\infty} x(\tau) h(t - \tau) \, d\tau
$$

In sampled discrete-time systems with sequences $x[n]$ and $h[n]$, the discrete convolution sum is given by:

$$
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{\infty} x[k] h[n - k]
$$

### 4.2 State-Space Representation & Kalman Controllability Criterion

A continuous-time multi-input multi-output (MIMO) linear time-invariant dynamical system is represented in state-space form:

$$
\dot{\mathbf{x}}(t) = \mathbf{A}\mathbf{x}(t) + \mathbf{B}\mathbf{u}(t)
$$

$$
\mathbf{y}(t) = \mathbf{C}\mathbf{x}(t) + \mathbf{D}\mathbf{u}(t)
$$

The necessary and sufficient condition for complete state controllability is that the controllability matrix $\mathcal{C}$ satisfies full rank:

$$
\text{rank}(\mathcal{C}) = \text{rank}\left( \left[ \mathbf{B} \quad \mathbf{A}\mathbf{B} \quad \mathbf{A}^2\mathbf{B} \quad \cdots \quad \mathbf{A}^{n-1}\mathbf{B} \right] \right) = n
$$

### 4.3 Discrete Fourier Transform (DFT) Frequency-Domain Representation

For a finite-length discrete sequence $x[n]$ of length $N$, the discrete frequency spectrum $X[k]$ is evaluated via the DFT:

$$
X[k] = \sum_{n=0}^{N-1} x[n] \cdot W_N^{kn}, \quad W_N = e^{-j\frac{2\pi}{N}}
$$

The original discrete-time sequence is reconstructed orthogonally through the Inverse Discrete Fourier Transform (IDFT):

$$
x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot W_N^{-kn}
$$

### 4.4 Continuous & Discrete Incremental PID Control Formulation

The continuous-time ideal PID controller generates actuation output $u(t)$ based on error signal $e(t)$:

$$
u(t) = K_p e(t) + K_i \int_0^t e(\tau) \, d\tau + K_d \frac{de(t)}{dt}
$$

When implemented within digital microcontrollers, the discrete incremental PID algorithm eliminates integral windup and provides smooth actuator transitions:

$$
\Delta u[k] = K_p \left( e[k] - e[k-1] \right) + K_i e[k] + K_d \left( e[k] - 2e[k-1] + e[k-2] \right)
$$

### 4.5 Empirical Risk Minimization & Regularized Optimization

In supervised machine learning, given training dataset $$\{(\mathbf{x}_i, y_i)\}_{i=1}^M$$ and parameter vector $\mathbf{w}$, the objective loss combines empirical risk with an $L_2$ regularization penalty:

$$
\min_{\mathbf{w}} \mathcal{L}(\mathbf{w}) = \frac{1}{M} \sum_{i=1}^M \ell(f(\mathbf{x}_i; \mathbf{w}), y_i) + \frac{\lambda}{2} \|\mathbf{w}\|_2^2
$$

---

## 5. Software & Hardware Toolchain Ecosystem

| Toolchain Domain | Software & IDE Environments | Core Applications & Disciplines |
| :--- | :--- | :--- |
| **Numerical Modeling** | MATLAB R2022b/R2023a, Simulink | Signals & Systems, Automatic Control, Modern Control, Motor Drives |
| **Digital Logic & EDA** | Xilinx Vivado Design Suite, Verilog HDL | Digital Electronics, FPGA Hardware Accelerators, Interface Design |
| **Embedded Firmware** | Keil uVision MDK-ARM v5, STM32CubeIDE | Micro-Embedded Systems, ARM Assembly, Computer Control Tech |
| **Circuit Simulation** | NI Multisim 14.0, Altium Designer, LTspice | Analog Electronics, Electronic Circuit Experiments, Pulse Power |
| **Machine Intelligence** | Python 3.8+, PyTorch 2.0+, OpenCV, Scikit-Learn | Machine Learning Labs, Pattern Recognition, Computer Vision |
| **Network & Telemetry** | Wireshark, Cisco Packet Tracer, LabVIEW | Communications & Networking, Data Acquisition & Processing |

---

## 6. License

This repository is distributed under the open-source **MIT License**. Refer to the [LICENSE](LICENSE) file for complete details.
