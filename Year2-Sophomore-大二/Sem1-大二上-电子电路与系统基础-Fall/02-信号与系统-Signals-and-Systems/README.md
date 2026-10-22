# Signals & Systems: Course Design & Laboratory Portfolio

This directory contains the code, simulation models, and comprehensive lab reports for the **Signals & Systems** curriculum. It documents both the mathematical modeling/simulations in MATLAB and the hardware experiments conducted using analog signal generator/oscilloscope measurement boxes.

---

## 📂 Directory Structure

```text
Signals-and-Systems/
├── Course-Design/              # Telephone Dual-Tone Multi-Frequency (DTMF) Project
│   ├── src/
│   │   └── DTMF_Codec.m        # DTMF sound wave generator & FFT decoder
│   └── docs/
│       └── DTMF_Design_Report.pdf # Final course design report
│
├── Simulation-Labs/            # MATLAB Simulation Laboratories (Labs 1-4)
│   └── src/
│       ├── Lab1_Signal_Generation.m # Continuous & discrete signal synthesis
│       ├── Lab2_System_Response.m   # System LTI zero-state response & convolution
│       ├── Lab3_Fourier_Analysis.m  # Fourier series approximation & FFT
│       └── Lab4_System_Filters.m    # Butterworth filter & sampling theorem
│
├── Physical-Labs/              # Hardware Box Experiments (Signal box & Oscilloscope)
│   └── docs/
│       ├── Physical_Lab_Report_1_Frequency_Response.pdf # Active/Passive Filter measurements
│       └── Physical_Lab_Report_2_Sampling_Theorem.pdf    # Sampling gate & low-pass recovery
│
└── README.md                   # Project overview & navigation (This file)
```

---

## 📞 Project 1: DTMF Telephone Dialing Generator & Decoder (Course Design)

*   **Source Code**: [DTMF_Codec.m](CourseDesign-%E8%AF%BE%E7%A8%8B%E8%AE%BE%E8%AE%A1-%E5%88%98%E8%B6%85%E7%84%B6/Source-%E8%A7%A3%E7%A0%81%E7%AE%97%E6%B3%95%E6%BA%90%E7%A0%81-src/DTMF_Codec.m)
*   **Technical Report**: [DTMF_Design_Report.pdf](CourseDesign-%E8%AF%BE%E7%A8%8B%E8%AE%BE%E8%AE%A1-%E5%88%98%E8%B6%85%E7%84%B6/Docs-%E8%AE%BE%E8%AE%A1%E6%96%87%E6%A1%A3-docs/DTMF_Design_Report.pdf)

### Overview
This project implements a software-defined **Dual-Tone Multi-Frequency (DTMF)** dial tone generator and receiver system using MATLAB. It generates standardized dual-frequency signals matching keys `0-9` and decodes them back to character arrays using Fast Fourier Transform (FFT) frequency spectrum matching.

### Core Architecture
1.  **DTMF Generation**: Standard dial tones consist of a low frequency and a high frequency mixed together:
    $$x(t) = \sin(2\pi f_{\text{low}} t) + \sin(2\pi f_{\text{high}} t)$$
2.  **FFT Spectrum Decoder**: 
    *   Applies a 2048-point Fast Fourier Transform (FFT) to extract absolute frequency peaks.
    *   Splits the signal band to check low-frequency peaks ($1 - 250$ bins) and high-frequency peaks ($250 - 400$ bins) against a matching tolerance ($10\text{ Hz}$).
    *   Looks up the corresponding keypad value from a dual-frequency matrix.
3.  **Playback**: Decodes a sequence representing a phone number (e.g., `18339861180`), merges the waveform segment with short pause segments, and plays it back using the `sound` driver.

---

## 💻 Simulation Laboratories (MATLAB Exercises)

The simulation subfolder contains code files representing the computer-simulation homework assignments for the course.

*   **Lab 1: Continuous & Discrete Signal Synthesis**
    *   **Code**: [Lab1_Signal_Generation.m](Labs-%E4%BF%A1%E5%8F%B7%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%AE%9E%E9%AA%8C/Source-%E5%AE%9E%E9%AA%8C%E8%84%9A%E6%9C%AC-src/Lab1_Signal_Generation.m)
    *   **Description**: Synthesizes continuous sinusoidal waves with arbitrary amplitudes, phases, and frequencies alongside discrete-time sequences utilizing MATLAB's plotting (`plot` and `stem`) functions to demonstrate digital sampling.
*   **Lab 2: Linear Time-Invariant (LTI) System Response**
    *   **Code**: [Lab2_System_Response.m](Labs-%E4%BF%A1%E5%8F%B7%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%AE%9E%E9%AA%8C/Source-%E5%AE%9E%E9%AA%8C%E8%84%9A%E6%9C%AC-src/Lab2_System_Response.m)
    *   **Description**: Analyzes zero-state responses of LTI differential systems. It visualizes the step and impulse responses of second-order filters and performs numerical convolution ($y(t) = x(t) * h(t)$) in the time domain.
*   **Lab 3: Fourier Series & Transform Analysis**
    *   **Code**: [Lab3_Fourier_Analysis.m](Labs-%E4%BF%A1%E5%8F%B7%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%AE%9E%E9%AA%8C/Source-%E5%AE%9E%E9%AA%8C%E8%84%9A%E6%9C%AC-src/Lab3_Fourier_Analysis.m)
    *   **Description**: Demonstrates the Gibb's phenomenon by summing harmonic Fourier components to approximate square and triangular waveforms. Calculates and plots continuous signal spectrum magnitudes.
*   **Lab 4: Sampling Theorem & Digital Filter Design**
    *   **Code**: [Lab4_System_Filters.m](Labs-%E4%BF%A1%E5%8F%B7%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%AE%9E%E9%AA%8C/Source-%E5%AE%9E%E9%AA%8C%E8%84%9A%E6%9C%AC-src/Lab4_System_Filters.m)
    *   **Description**: Simulates the Shannon sampling theorem. Applies interpolation functions to reconstruct signals, and designs Butterworth low-pass filters to remove out-of-band noise.

---

## 🔌 Physical Laboratories (Hardware Box & Oscilloscope)

These hardware experiments were conducted in Laboratory Room 科A306 using hardware circuit boards, analog function signal generators, and digital oscilloscopes.

*   **Lab 1: Frequency Response Characteristics of Continuous Systems**
    *   **Report**: [Physical_Lab_Report_1_Frequency_Response.pdf](Labs-%E4%BF%A1%E5%8F%B7%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%AE%9E%E9%AA%8C/Docs-%E5%AE%9E%E9%AA%8C%E6%96%87%E6%A1%A3-docs/Physical_Lab_Report_1_Frequency_Response.pdf)
    *   **Description**: Discusses the properties of passive RC/RL filters and active filters using operational amplifiers. Records the output gain and phase shift over varying frequencies to plot Bode magnitude/phase frequency responses.
*   **Lab 2: Sampling Theorem and Signal Reconstruction**
    *   **Report**: [Physical_Lab_Report_2_Sampling_Theorem.pdf](Labs-%E4%BF%A1%E5%8F%B7%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%AE%9E%E9%AA%8C/Docs-%E5%AE%9E%E9%AA%8C%E6%96%87%E6%A1%A3-docs/Physical_Lab_Report_2_Sampling_Theorem.pdf)
    *   **Description**: Demonstrates digital pulse sampling on analog signals. Discusses the Nyquist sampling criterion ($f_s \ge 2f_m$), analyzes spectrum folding (aliasing) on the oscilloscope when the condition is violated, and recovers the signal using active low-pass reconstruction networks.

---

## 🚀 How to Run Code

1.  Launch MATLAB.
2.  Navigate to the directory of interest:
    *   For course design, run `Course-Design/src/DTMF_Codec.m`.
    *   For simulation labs, open `Simulation-Labs/src/` and run individual scripts.
3.  Ensure your speaker volume is turned up to hear audio playback in the DTMF system!
