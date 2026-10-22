# Modern Control Theory (现代控制理论)

This repository contains the academic portfolio for the course **Modern Control Theory (现代控制理论)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio showcases a complete control engineering design cycle, including state-space modeling, time-domain response analysis, controllability/observability verification, Lyapunov stability analysis, and feedback control system synthesis (pole placement & state observer design) for a physical **RLC Circuit System**.

---

## Portfolio Directory Structure

```
Modern-Control-Theory/
│
├── README.md                                 # This document
│
└── Simulation-Labs/                          # MATLAB simulation experiments
    ├── src/
    │   └── RLC_System_Simulation.m           # Main MATLAB simulation script
    └── docs/
        └── Modern_Control_Lab_Report_RLC_Circuit.pdf  # Comprehensive simulation report (PDF)
```

---

## 1. Project Overview: RLC Circuit State-Space Analysis

The RLC circuit is modeled as a linear time-invariant (LTI) continuous system. By selecting the capacitor voltage $u_C(t)$ and the inductor current $i_L(t)$ as the state variables, the system retains a clear physical meaning representing the electrical energy stored in the reactive components.

### System Parameters
*   **Resistor ($R$)**: $2\ \Omega$
*   **Inductor ($L$)**: $0.5\text{ H}$
*   **Capacitor ($C$)**: $0.1\text{ F}$ (Selected to yield an underdamped open-loop response)

### State-Space Modeling
Let the state vector be $x(t) = \begin{bmatrix} x_1(t) \\ x_2(t) \end{bmatrix} = \begin{bmatrix} u_C(t) \\ i_L(t) \end{bmatrix}$, the input voltage be $u(t)$, and the output be the capacitor voltage $y(t) = u_C(t)$.
Applying Kirchhoff's Voltage Law (KVL) and Current Law (KCL):
$$\dot{x}(t) = A x(t) + B u(t)$$
$$y(t) = C x(t) + D u(t)$$

Substituting the numerical parameters:
$$A = \begin{bmatrix} 0 & \frac{1}{C} \\ -\frac{1}{L} & -\frac{R}{L} \end{bmatrix} = \begin{bmatrix} 0 & 10 \\ -2 & -4 \end{bmatrix}$$
$$B = \begin{bmatrix} 0 \\ \frac{1}{L} \end{bmatrix} = \begin{bmatrix} 0 \\ 2 \end{bmatrix}$$
$$C = \begin{bmatrix} 1 & 0 \end{bmatrix}, \quad D = 0$$

---

## 2. Core Control Analysis & Design Tasks

All analysis and designs are implemented and verified in [RLC_System_Simulation.m](Simulation-Labs-%E7%8A%B6%E6%80%81%E7%A9%BA%E9%97%B4%E4%BB%BF%E7%9C%9F/Source-%E4%BB%BF%E7%9C%9F%E8%84%9A%E6%9C%AC-src/RLC_System_Simulation.m) and detailed in [Modern_Control_Lab_Report_RLC_Circuit.pdf](Simulation-Labs-%E7%8A%B6%E6%80%81%E7%A9%BA%E9%97%B4%E4%BB%BF%E7%9C%9F/Docs-%E8%AE%B2%E4%B9%89%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Modern_Control_Lab_Report_RLC_Circuit.pdf).

### A. Time-Domain Analysis & System Response
*   **Zero-Input Response**: Evaluated from an initial state of $x(0) = \begin{bmatrix} 5\text{ V} \\ 0\text{ A} \end{bmatrix}$ (fully charged capacitor).
*   **Step Response**: Evaluated for a $10\text{ V}$ step input voltage from a zero initial state, illustrating underdamped oscillation before settling at steady-state.

### B. Controllability & Observability
*   **Controllability Matrix ($Q_c$)**:
    $$Q_c = \begin{bmatrix} B & AB \end{bmatrix} = \begin{bmatrix} 0 & 20 \\ 2 & -8 \end{bmatrix}$$
    $\text{Rank}(Q_c) = 2$ (Full rank $\implies$ the system is **completely state controllable**).
*   **Observability Matrix ($Q_o$)**:
    $$Q_o = \begin{bmatrix} C \\ CA \end{bmatrix} = \begin{bmatrix} 1 & 0 \\ 0 & 10 \end{bmatrix}$$
    $\text{Rank}(Q_o) = 2$ (Full rank $\implies$ the system is **completely observable**).

### C. Lyapunov Stability Analysis
Lyapunov's second method is used to determine asymptotic stability. For a given positive definite matrix $Q = I$, the Lyapunov equation $A^T P + P A = -Q$ is solved to yield the symmetric matrix $P$:
$$P = \begin{bmatrix} 1.625 & 0.25 \\ 0.25 & 1.875 \end{bmatrix}$$
Since all eigenvalues of $P$ are strictly positive ($\lambda_1 = 1.427$, $\lambda_2 = 2.073$), $P$ is positive-definite. Thus, the system is **asymptotically stable** at the origin.

### D. Pole Placement & State Feedback Design
To speed up the settling time and eliminate oscillations (overshoot), the target closed-loop poles are placed at the LHP to achieve critical damping ($\zeta = 1$) with natural frequency $\omega_n = 10\text{ rad/s}$:
*   **Desired Poles**: $s_1 = -10$, $s_2 = -10$
*   **State Feedback Gain ($K$)**: Calculated using Ackerman's formula:
    $$K = \begin{bmatrix} 48 & 8 \end{bmatrix}$$
*   **Pre-filter Pre-gain ($N_{\text{bar}}$)**: Introducing $N_{\text{bar}} = 5.0$ to eliminate steady-state error for step tracking.

### E. Full-State Observer Design
Since the inductor current $i_L(t)$ might be hard to measure directly in practice, a full-state Luenberger observer is designed. The observer poles are placed $3$ times faster than the controller poles for rapid state convergence:
*   **Desired Observer Poles**: $s_{\text{obs}} = \begin{bmatrix} -30 & -31 \end{bmatrix}$
*   **Observer Gain ($L_{\text{obs}}$)**:
    $$L_{\text{obs}} = \begin{bmatrix} 57 \\ 84.5 \end{bmatrix}$$

---

## 3. Code Implementation Details

The MATLAB file [RLC_System_Simulation.m](Simulation-Labs-%E7%8A%B6%E6%80%81%E7%A9%BA%E9%97%B4%E4%BB%BF%E7%9C%9F/Source-%E4%BB%BF%E7%9C%9F%E8%84%9A%E6%9C%AC-src/RLC_System_Simulation.m) executes:
1.  State-Space Model setup and parameter configuration.
2.  Computation of eigenvalues, natural frequency, and open-loop damping ratio.
3.  Plotting zero-input response and zero-state step response.
4.  Checking matrix rank of $Q_c$ and $Q_o$ automatically.
5.  Solving the Lyapunov equation and verifying $P$'s positive definiteness.
6.  Calculating control feedback gain $K$ and observer gain $L_{\text{obs}}$.
7.  Simulating the augmented closed-loop system (combining plant + observer + state feedback) to demonstrate excellent output tracking and observer convergence.
