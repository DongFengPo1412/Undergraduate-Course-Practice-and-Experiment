# Automatic Control Principles (自动控制原理)

This repository contains the academic portfolio for the course **Automatic Control Principles (自动控制原理)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio covers comprehensive simulation labs in MATLAB/Simulink and physical hardware experiments on control system performance analysis, compensator design, and real-time control applications (e.g., Inverted Pendulum PID control).

---

## Portfolio Directory Structure

```
Automatic-Control-Principles/
│
├── README.md                                 # This document
│
├── Simulation-Labs/                          # MATLAB & Simulink simulation experiments
│   ├── src/
│   │   ├── Lab1_Time_Domain_Analysis.m       # Time-domain analysis & system modeling
│   │   ├── Lab2_Root_Locus_Analysis.m         # Root locus design under varying gains
│   │   ├── Lab3_Frequency_Response_Correction.m # Frequency domain lead compensator design
│   │   ├── Continuous_System_Loop.slx        # Continuous-time control loop model
│   │   └── Lab4_Digital_Control_System.slx   # Discrete-time digital control loop model
│   └── docs/
│       ├── Simulation_Lab_Report_1_Time_Domain.pdf
│       ├── Simulation_Lab_Report_2_Root_Locus.pdf
│       ├── Simulation_Lab_Report_3_Frequency_Response.pdf
│       └── Simulation_Lab_Report_4_Digital_Control.pdf
│
└── Physical-Labs/                            # Hardware experimental box & physical controls (Room 科A306)
    ├── src/
    │   └── Inverted_Pendulum_PID_Design.m    # Root-locus-based PID design for Inverted Pendulum
    └── docs/
        ├── Physical_Lab_Report_1_System_Analysis.pdf                # Linear system time-domain response
        ├── Physical_Lab_Report_2_Inverted_Pendulum_PID.pdf          # PID parameters tuning & simulation
        └── Physical_Lab_Report_3_Inverted_Pendulum_Lead_Correction.pdf # Real-time speed control & lead correction
```

---

## 1. Simulation Labs (自控仿真实验)

The simulation part consists of four structured experiments focusing on modeling, classical control analysis, and discrete-time implementation using MATLAB and Simulink.

### [Lab 1: Time-Domain Analysis & System Modeling](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab1_Time_Domain_Analysis.m)
*   **Concepts**: Modeling systems using Zero-Pole-Gain (ZPK) and Transfer Functions (TF); system interconnections (series, parallel, feedback); transient step and impulse responses for first-order and second-order systems; poles analysis and steady-state error of high-order systems.
*   **MATLAB Script**: [Lab1_Time_Domain_Analysis.m](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab1_Time_Domain_Analysis.m)
*   **Report**: Simulation_Lab_Report_1_Time_Domain.pdf [not archived](#unavailable-references)

### [Lab 2: Root Locus Analysis & Loop Gain Control](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab2_Root_Locus_Analysis.m)
*   **Concepts**: Plotting open-loop poles/zeros configuration and root loci; studying closed-loop system stability, damping ratio, natural frequency, and transient response (overshoot, settling time) as the open-loop gain $K$ varies.
*   **MATLAB Script**: [Lab2_Root_Locus_Analysis.m](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab2_Root_Locus_Analysis.m)
*   **Report**: Simulation_Lab_Report_2_Root_Locus.pdf [not archived](#unavailable-references)

### [Lab 3: Frequency-Domain Analysis & Series Lead Compensator Design](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab3_Frequency_Response_Correction.m)
*   **Concepts**: Bode plots, Nyquist stability criterion, phase margin (PM), gain margin (GM). Designing a series lead compensator to satisfy transient overshoot ($\le 25\%$), settling time ($T_s \le 0.7\text{s}$), and velocity error coefficient ($K_v \ge 12$).
*   **MATLAB Script**: [Lab3_Frequency_Response_Correction.m](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab3_Frequency_Response_Correction.m)
*   **Report**: Simulation_Lab_Report_3_Frequency_Response.pdf [not archived](#unavailable-references)

### [Lab 4: Discrete/Digital Control Systems](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab4_Digital_Control_System.slx)
*   **Concepts**: Hybrid continuous-discrete system modeling. Comparing continuous control loops with discrete control systems under different sampling times $T$.
*   **Simulink Models**: 
    *   [Continuous_System_Loop.slx](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Continuous_System_Loop.slx) - Continuous loop simulation.
    *   [Lab4_Digital_Control_System.slx](Simulation-Labs-%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Lab4_Digital_Control_System.slx) - Hybrid discrete control system with zero-order hold (ZOH) and discrete transfer function.
*   **Report**: Simulation_Lab_Report_4_Digital_Control.pdf [not archived](#unavailable-references)

---

## 2. Physical & Hardware Labs (自控物理实验 - 科A306)

Conducted using the physical experimental box and real-time oscilloscope in the Laboratory Room 科A306. These experiments connect theory with physical hardware and real-time controller tuning.

### Physical Lab 1: Linear System Time-Domain Response & Stability
*   **Description**: Constructing physical analog control loops (first-order, second-order, and high-order systems) using operational amplifiers on the hardware box. Observing real-time step response curves on an oscilloscope and measuring overshoot, settling time, and steady-state error.
*   **Report**: Physical_Lab_Report_1_System_Analysis.pdf [not archived](#unavailable-references)

### Physical Lab 2: Inverted Pendulum PID Control Design
*   **Description**: PID parameter design and root-locus tuning for stabilizing a linear inverted pendulum. The open-loop transfer function of the pendulum is unstable:
    $$G_0(s) = \frac{\Theta(s)}{U(s)} = \frac{2.9586}{s^2 - 28.9941}$$
    Double zeros are placed at $s = -6 \pm 6j$ to pull the unstable poles to the left half-plane. A gain of $K = 15.0$ stabilizes the closed-loop system.
*   **MATLAB Code**: [Inverted_Pendulum_PID_Design.m](Physical-Labs-%E7%A1%AC%E4%BB%B6%E7%89%A9%E7%90%86%E5%AE%9E%E9%AA%8C/Source-%E6%BA%90%E7%A0%81-src/Inverted_Pendulum_PID_Design.m)
*   **Report**: Physical_Lab_Report_2_Inverted_Pendulum_PID.pdf [not archived](#unavailable-references)

### Physical Lab 3: Real-Time Inverted Pendulum Lead Correction
*   **Description**: Designing and executing a lead compensator on physical hardware for stabilizing an inverted pendulum and achieving real-time speed control.
*   **Report**: Physical_Lab_Report_3_Inverted_Pendulum_Lead_Correction.pdf [not archived](#unavailable-references)

---

## Key Highlights of Designs
1.  **PID Controller Design**: Successfully stabilized an open-loop unstable inverted pendulum system using double-zero configuration ($s = -6 \pm 6j$) via root-locus design, calculating optimal PID parameters ($K_p = 180, K_i = 1080, K_d = 15$) and validating stability via impulse response.
2.  **Lead Compensator Design**: Developed a systematic compensator design script in frequency-domain using the pole-zero cancellation method to meet strict overshoot, transient settling time, and steady-state error constraints.

<a id="unavailable-references"></a>

## Unavailable references

Items marked **not archived** are names from earlier course documentation that were not located in this repository. They are not runnable entry points or evidence of a completed experiment. Use the existing source links and files; reports, models or data still need their original version before reproduction.
