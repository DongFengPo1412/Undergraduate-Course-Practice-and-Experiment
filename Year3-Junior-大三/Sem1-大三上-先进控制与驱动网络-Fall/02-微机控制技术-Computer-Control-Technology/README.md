# Computer Control Technology (计算机控制技术)

This repository contains the academic portfolio for the course **Computer Control Technology (计算机控制技术)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio showcases discrete-time control engineering designs, including **Digital PID Control Systems** and **Minimal Prototype (Deadbeat) Control Systems** modeled and simulated using MATLAB and Simulink.

---

## Portfolio Directory Structure

```
Computer-Control-Technology/
│
├── README.md                                 # This document
│
└── Simulation-Labs/                          # Simulink simulation experiments
    ├── src/
    │   ├── Digital_PID_Control_System.slx    # Digital PID control system model
    │   └── Deadbeat_Control_System.slx        # Deadbeat control system model
    └── docs/
        ├── Lab_Report_1_Digital_PID_Control.pdf # Digital PID simulation report
        └── Lab_Report_2_Deadbeat_Control.pdf    # Deadbeat simulation report
```

---

## 1. Digital PID Control System (数字 PID 控制)

In computer control systems, the analog PID controller is discretized into either positional (位置式) or incremental (增量式) PID algorithms.

### Mathematical Formulation
The discrete positional PID control law is represented as:
$$u(k) = K_p \left[ e(k) + \frac{T}{T_i} \sum_{j=0}^{k} e(j) + \frac{T_d}{T} (e(k) - e(k-1)) \right]$$
Where:
*   $u(k)$ is the control output at step $k$.
*   $e(k) = r(k) - y(k)$ is the system error.
*   $K_p$ is the proportional gain.
*   $T_i$ and $T_d$ are the integral and derivative time constants.
*   $T$ is the sampling period.

### Design and Analysis
Using the Simulink model [Digital_PID_Control_System.slx](Simulation-Labs/src/Digital_PID_Control_System.slx), the effects of $K_p, K_i, K_d$ parameters and the sampling period $T$ on the system overshoot, settling time, and steady-state error are systematically simulated and evaluated. 
Detailed analysis is provided in the report [Lab_Report_1_Digital_PID_Control.pdf](Simulation-Labs/docs/Lab_Report_1_Digital_PID_Control.pdf).

---

## 2. Minimal Prototype (Deadbeat) Control System (最少拍与无纹波控制)

Minimal prototype (deadbeat) control is a classic discrete design method. The objective is to design a digital controller $D(z)$ such that the system's closed-loop output tracks a specific reference input (step, ramp, etc.) without steady-state error in the minimum number of sampling periods.

### Mathematical Design and Discretization
Given the continuous-time control plant:
$$G(s) = \frac{10}{s(s+1)}$$
Under a zero-order hold (ZOH) with a sampling period of $T = 1\text{s}$, the pulse transfer function $G(z)$ is computed as:
$$G(z) = (1 - z^{-1}) \mathcal{Z}\left\{ \frac{10}{s^2(s+1)} \right\} = \frac{3.678 z + 2.644}{(z - 1)(z - 0.3679)}$$

### Deadbeat vs. Ripple-Free Deadbeat
1.  **Standard Deadbeat Control**: The system output tracks the input in $N$ steps. However, standard deadbeat control often exhibits **inter-sample ripples (纹波)** because the control signal continues to oscillate between sampling instants.
2.  **Ripple-Free Deadbeat Control (无纹波最少拍)**: By placing constraints on the closed-loop transfer function to ensure the controller $D(z)$ cancels the plant's open-loop zeros (excluding $z=1$), the control signal settles to a constant value, thereby eliminating inter-sample oscillations.

### Files
*   **Simulink Model**: [Deadbeat_Control_System.slx](Simulation-Labs/src/Deadbeat_Control_System.slx) (Simulates step/ramp responses and evaluates control signals to verify the presence or absence of ripples).
*   **Simulation Report**: [Lab_Report_2_Deadbeat_Control.pdf](Simulation-Labs/docs/Lab_Report_2_Deadbeat_Control.pdf)
