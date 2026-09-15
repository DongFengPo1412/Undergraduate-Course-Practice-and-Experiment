# Motor Drives (电机拖动)

This repository contains the academic portfolio for the course **Motor Drives (电机拖动)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio covers core control principles, Matlab/Simulink modeling, simulation-based analysis, and physical bench experiments for both **Separately Excited DC Motors (他励直流电机)** and **Three-Phase Squirrel-Cage Induction Motors (三相鼠笼异步电机)**.

---

## Portfolio Directory Structure

```
Motor-Drives/
│
├── README.md                                 # This document
│
├── Simulation-Labs/                          # MATLAB & Simulink simulation experiments
│   ├── src/
│   │   ├── DC_Motor_Open_Loop_Control.slx    # DC motor open-loop control model
│   │   ├── AC_Induction_Motor_Open_Loop_Control.slx # Induction motor open-loop control model
│   │   └── Motor_Mechanical_Characteristics_Plot.m # MATLAB speed-torque plotting script
│   └── docs/
│       ├── Simulation_Lab_Report_1_DC_Motor.pdf # DC motor simulation lab report
│       └── Simulation_Lab_Report_2_AC_Motor.pdf # Induction motor simulation lab report
│
└── Physical-Labs/                            # Bench experiments on physical control units
    └── docs/
        └── Physical_Lab_Report_DC_Motor_Experiment.pdf # DC motor physical lab report
```

---

## 1. Separately Excited DC Motor Control (他励直流电机控制)

The DC motor control focuses on steady-state mechanical characteristics and open-loop speed control modes.

### Mathematical Model
The speed-torque relationship of a separately excited DC motor is governed by:
$$n = \frac{U}{K_e \Phi} - \frac{R_a}{K_e K_T \Phi^2} T$$
Where:
*   $n$: Motor speed ($\text{r/min}$)
*   $U$: Armature voltage ($\text{V}$)
*   $R_a$: Armature resistance ($\Omega$)
*   $\Phi$: Excitation magnetic flux ($\text{Wb}$)
*   $T$: Electromagnetic torque ($\text{N}\cdot\text{m}$)
*   $K_e, K_T$: Back-EMF and torque constants

### Speed Control Modes
1.  **Armature Voltage Control (调压调速)**: Reducing voltage $U$ below rated voltage. The mechanical characteristic curves shift downward parallel to the original rated curve, maintaining a constant slope (no change in stiffness).
2.  **Field Weakening Control (弱磁调速)**: Reducing the excitation current (and hence flux $\Phi$) while keeping $U$ at rated. The no-load speed rises, and the slope of the curve increases, making the mechanical characteristics softer.

### Files
*   **Simulink Model**: [DC_Motor_Open_Loop_Control.slx](Simulation-Labs/src/DC_Motor_Open_Loop_Control.slx)
*   **Simulation Report**: [Simulation_Lab_Report_1_DC_Motor.pdf](Simulation-Labs/docs/Simulation_Lab_Report_1_DC_Motor.pdf)
*   **Physical Lab Report**: [Physical_Lab_Report_DC_Motor_Experiment.pdf](Physical-Labs/docs/Physical_Lab_Report_DC_Motor_Experiment.pdf) - Detailing physical bench setups, parameter measurements, and measured vs simulated curves.

---

## 2. Three-Phase Squirrel-Cage Induction Motor Control (三相鼠笼异步电机)

The AC motor control explores variable stator voltage control (定子降压调速) and the resulting mechanical speed-torque curves.

### Mathematical Characteristic
The electromagnetic torque is proportional to the square of the stator voltage $U_1$:
$$T = \frac{3 p U_1^2 R_2'}{s \omega_1 \left[ (R_1 + \frac{R_2'}{s})^2 + (X_1 + X_2')^2 \right]}$$
Where $s$ is the slip. Reducing $U_1$ significantly reduces the maximum torque ($T_m \propto U_1^2$), making the speed highly sensitive to load torque changes.

### MATLAB Data Analysis
The script [Motor_Mechanical_Characteristics_Plot.m](Simulation-Labs/src/Motor_Mechanical_Characteristics_Plot.m) uses the user's simulation data to plot mechanical speed-torque curves under:
*   **Rated Voltage ($U_N$)**: Speed drops slightly from $1496\text{ r/min}$ (at $0.1T_N$) to $1464\text{ r/min}$ (at rated $T_N$).
*   **Half Voltage ($0.5U_N$)**: Speed drops significantly from $1484\text{ r/min}$ (at $0.1T_N$) down to $1256\text{ r/min}$ (at rated $T_N$), demonstrating a much softer mechanical characteristic.

### Files
*   **Simulink Model**: [AC_Induction_Motor_Open_Loop_Control.slx](Simulation-Labs/src/AC_Induction_Motor_Open_Loop_Control.slx)
*   **Plotting Script**: [Motor_Mechanical_Characteristics_Plot.m](Simulation-Labs/src/Motor_Mechanical_Characteristics_Plot.m)
*   **Simulation Report**: [Simulation_Lab_Report_2_AC_Motor.pdf](Simulation-Labs/docs/Simulation_Lab_Report_2_AC_Motor.pdf)
