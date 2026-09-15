# Academic Portfolio: Analog Electronics & Simulation (模拟电子技术仿真)

This directory contains the academic portfolio for the **Analog Electronics & Simulation (模拟电子技术仿真)** course at University of Electronic Science and Technology of China (UESTC). It includes Multisim simulation models (.ms14) and three formatted experimental reports with waveforms and analyses.

## Student Information
- **Name**: 刘超然 (Chao-Ran Liu)
- **Student ID**: 2023060904025
- **Department**: School of Automation Engineering (自动化工程学院)
- **Major**: Automation (自动化)

---

## Directory Structure

```
Analog-Electronics-and-Simulation/
├── Simulation/
│   ├── design1_common_emitter.ms14   # Task 4: Common Drain/Emitter Amplifier simulation
│   ├── design2_differential_amp.ms14 # Task 5: Differential amplifier & Integrated Op-Amp simulation
│   ├── design3_waveform_generator.ms14# Task 6: Waveform generator & Active low-pass filter
│   └── simulation_final_exam.ms14    # Final simulation exam circuits
├── Reports/
│   ├── Task4_Common_Drain_Amplifier_Simulation_Report.docx  # Report for Task 4
│   ├── Task4_Common_Drain_Amplifier_Simulation_Report.pdf
│   ├── Task5_Differential_and_OpAmp_Simulation_Report.docx # Report for Task 5
│   ├── Task5_Differential_and_OpAmp_Simulation_Report.pdf
│   ├── Task6_Waveform_Generator_and_Filter_Simulation_Report.docx # Report for Task 6
│   └── Task6_Waveform_Generator_and_Filter_Simulation_Report.pdf
├── task.md                           # Reorganization task checklist
└── README.md                         # Portfolio documentation (this file)
```

---

## Task Details & Project Descriptions

### Task 4: Common Drain/Emitter Amplifier Simulation
- **File**: `Simulation/design1_common_emitter.ms14`
- **Report**: `Reports/Task4_Common_Drain_Amplifier_Simulation_Report.pdf`
- **Methodology**:
  - Implements a common drain FET amplifier circuit.
  - Tests circuit performance under different input sine wave amplitudes ($50\text{mV}_{\text{pk}}$, $500\text{mV}_{\text{pk}}$, $2000\text{mV}_{\text{pk}}$) at a frequency determined by student ID.
  - Analyzes voltage magnification gain $A_{ui}$ and verifies that the output voltage tracks the input in phase with a gain slightly less than 1 ($\approx 1$).

### Task 5: Differential & Integrated Op-Amp Simulation
- **File**: `Simulation/design2_differential_amp.ms14`
- **Report**: `Reports/Task5_Differential_and_OpAmp_Simulation_Report.pdf`
- **Methodology**:
  - Analyzes differential amplifications (differential gain, common-mode rejection ratio CMRR).
  - Employs integrated operational amplifiers (Op-Amps) to design standard inverting/non-inverting and summing math operators.

### Task 6: Waveform Generator & Active Low-pass Filter Simulation
- **File**: `Simulation/design3_waveform_generator.ms14`
- **Report**: `Reports/Task6_Waveform_Generator_and_Filter_Simulation_Report.pdf`
- **Methodology**:
  - Models square/triangular waveform generators using comparator and integrator Op-Amp stages.
  - Designs a second-order active low-pass filter (LPF) to smooth out high-frequency noise and shape output waveforms.
