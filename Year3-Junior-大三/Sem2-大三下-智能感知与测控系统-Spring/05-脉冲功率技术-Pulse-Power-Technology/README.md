# Academic Portfolio: Pulse Power Technology (脉冲电源)

This directory contains the academic portfolio for the **Pulse Power Technology (脉冲电源)** course at University of Electronic Science and Technology of China (UESTC). It includes core power electronics simulation models (PLECS), schematic/PCB design files for an Automated External Defibrillator (AED), relevant chip datasheets, slides, and three comprehensive academic reports.

## Student Information
- **Name**: 刘超然 (Chao-Ran Liu)
- **Student ID**: 2023060904025
- **Department**: School of Automation Engineering (自动化工程学院)
- **Major**: Automation (自动化)

---

## Directory Structure

```
Pulse-Power-Technology/
├── Simulation/
│   ├── flyback.plecs                 # Task 1: Flyback converter charging simulation model
│   ├── push_pull.plecs               # Task 2: Push-pull converter simulation model
│   ├── full_bridge.plecs             # Full-bridge inverter simulation model
│   ├── sn74aup1t97.plecs             # Auxiliary logic gates simulation
│   └── Assets/                       # Simulation waveforms and visual outputs
│       ├── 医用脉冲电源反激电路仿真.png
│       └── 医用脉冲电源推挽电路仿真.png
├── Hardware/                         # EasyEDA Pro hardware design files
│   ├── AED_Main/                     # Altium/EasyEDA project for AED main board
│   │   ├── AED.epro, AED.eprj2
│   ├── AED_Charging/                 # EasyEDA project for AED capacitor charger
│   │   └── AED充电电路.eprj2
│   ├── AED_Discharging/              # EasyEDA project for BTE pulse discharger
│   │   └── 放电电路.eprj2
│   ├── Datasheets/                   # Key component datasheets
│   │   ├── MCP14A0902.pdf            # 9A high-speed MOSFET driver
│   │   └── sn74aup1t97.pdf           # Configurable logic gate
│   └── Backups/                      # Historical ZIP backups of the design
├── Slides/                           # Technical presentations
│   ├── 毕设原理.pptx
│   └── 毕设原理 (2).pptx
├── Reports/                          # Formal academic reports (Word and PDF formats)
│   ├── Task1_Flyback_Converter_Simulation_Report.docx  # Report for Task 1
│   ├── Task1_Flyback_Converter_Simulation_Report.pdf
│   ├── Task2_Push_Pull_Converter_Simulation_Report.docx # Report for Task 2
│   ├── Task2_Push_Pull_Converter_Simulation_Report.pdf
│   ├── Task3_AED_Hardware_Circuit_Design_Report.docx    # Report for Task 3
│   └── Task3_AED_Hardware_Circuit_Design_Report.pdf
├── task.md                           # Reorganization task checklist
└── README.md                         # Portfolio documentation (this file)
```

---

## Task Details & Project Descriptions

### Task 1: Flyback Converter Charger Design & Simulation
- **File**: `Simulation/flyback.plecs`
- **Methodology**:
  - Analyzes single-ended Flyback topology in continuous conduction mode (CCM) and discontinuous conduction mode (DCM).
  - Implements a constant power charging strategy to pump voltage into a $100\mu\text{F}$ capacitor from 0V to 1500V.
  - Designs a Resistor-Capacitor-Diode (RCD) snubber circuit to clamp the high-voltage transient spike induced by transformer leakage inductance:
    $$P_{\text{sn}} = \frac{1}{2} L_{\text{leak}} I_{\text{peak}}^2 f_s \cdot \frac{V_{\text{clamp}}}{V_{\text{clamp}} - n V_o}$$

### Task 2: Push-Pull Converter & DC Bias Correction
- **File**: `Simulation/push_pull.plecs`
- **Methodology**:
  - Investigates DC magnetization bias in double-ended push-pull topologies caused by asymmetric switching timings.
  - Deploys a closed-loop PI bias correction loop using differential peak current sensing to balance Volt-second products.
  - Integrates an RC snubber network to protect switches against drain-source transient overvoltages.

### Task 3: Medical High-Voltage Pulse (AED) Hardware Circuit Design
- **File**: `Hardware/` & `Datasheets/`
- **Methodology**:
  - Designs hardware circuit schematics in EasyEDA Pro for a portable defibrillator (AED) charging and pulse generating board.
  - Features the **MCP14A0902** gate driver offering 9A peak source/sink current to minimize switching losses.
  - Incorporates the **SN74AUP1T97** configurable logic gate to implement a hardware-level interlock protection mechanism, generating a $1.5\mu\text{s}$ dead-time between high-side and low-side IGBTs to prevent bridge shoot-through.
  - Evaluates the Biphasic Truncated Exponential (BTE) discharge pulse in PLECS matching clinical standards.
