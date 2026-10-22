# Communications and Network Technologies (通信与网络技术)

This repository contains the academic portfolio for the course **Communications and Network Technologies (通信与网络技术)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio covers core communications and computer network engineering designs across multiple layers of the OSI model: from physical layer modulation (BPSK/QPSK) and data link layer error control (CRC) to network layer routing (VMware) and transport layer packet analysis (Wireshark).

---

## Portfolio Directory Structure

```
Communications-and-Network-Technologies/
│
├── README.md                                 # This document
│
├── Simulation-Labs/                          # Communications physical & link layer simulations (Labs 1 & 2)
│   ├── src/
│   │   ├── QPSK_Carrier_Transmission_Sim.slx # QPSK modulation carrier transmission model
│   │   ├── QPSK_BER_Analysis.m               # QPSK bit error rate (BER) analysis script
│   │   ├── CRC_Error_Control_Sim.slx         # CRC cyclic check error control model
│   │   └── CRC_Encoding_Decoding.m           # CRC coding modulo-2 calculation script
│   └── docs/
│       ├── Simulation_Lab_Report_1_Carrier_Transmission.pdf # Lab 1 carrier transmission report
│       └── Simulation_Lab_Report_2_CRC_Coding.pdf          # Lab 2 CRC coding report
│
└── Network-Labs/                             # Network & transport layer protocols labs (Labs 3 & 4)
    ├── src/
    │   └── captures/                         # VMware configuration & Wireshark grab screenshots (28 images)
    └── docs/
        ├── Network_Lab_Report_3_VMware_Routing.pdf         # Lab 3 VMware virtual routing report
        └── Network_Lab_Report_4_Wireshark_TCP_Analysis.pdf # Lab 4 Wireshark TCP handshake report
```

---

## 1. Communications Simulation Labs (物理层与数据链路层)

The simulation labs explore digital carrier transmission systems and error detection codes implemented in MATLAB and Simulink.

### A. QPSK Digital Carrier Transmission
*   **Concepts**: Principles of Binary Phase Shift Keying (BPSK) and Quadrature Phase Shift Keying (QPSK) modulators/demodulators. Evaluating bit error rate (BER) performance under Additive White Gaussian Noise (AWGN) channels.
*   **Simulink Model**: [QPSK_Carrier_Transmission_Sim.slx](Simulation-Labs-%E9%80%9A%E4%BF%A1%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F/src/QPSK_Carrier_Transmission_Sim.slx)
*   **MATLAB Script**: [QPSK_BER_Analysis.m](Simulation-Labs-%E9%80%9A%E4%BF%A1%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F/src/QPSK_BER_Analysis.m)
*   **Report**: [Simulation_Lab_Report_1_Carrier_Transmission.pdf](Simulation-Labs-%E9%80%9A%E4%BF%A1%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F/docs/Simulation_Lab_Report_1_Carrier_Transmission.pdf)

### B. CRC Link Layer Error Control Coding
*   **Concepts**: Modulo-2 binary polynomial arithmetic. For a generator polynomial $G(X) = X^3 + X^2 + 1$ (represented as `1101` in binary), the frame data $C(X)$ is multiplied by $X^3$ and divided by $G(X)$ to yield the remainder $R(X)$ appended as the checksum bits.
*   **Simulink Model**: [CRC_Error_Control_Sim.slx](Simulation-Labs-%E9%80%9A%E4%BF%A1%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F/src/CRC_Error_Control_Sim.slx)
*   **MATLAB Script**: [CRC_Encoding_Decoding.m](Simulation-Labs-%E9%80%9A%E4%BF%A1%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F/src/CRC_Encoding_Decoding.m)
*   **Report**: [Simulation_Lab_Report_2_CRC_Coding.pdf](Simulation-Labs-%E9%80%9A%E4%BF%A1%E7%B3%BB%E7%BB%9F%E4%BB%BF%E7%9C%9F/docs/Simulation_Lab_Report_2_CRC_Coding.pdf)

---

## 2. Computer Network Labs (网络层与传输层)

The network labs focus on real-world routing and transport layer protocol verification using virtualization and packet capturing.

### A. VMware Virtual Networking & Routing
*   **Concepts**: Creating private networks using VMware Workstation virtual machines. Configuring IP addresses, subnet masks, default gateways, and static routing tables across multi-hop networks.
*   **Verification**: Path diagnostics and connectivity testing using `ping`, `tracert` (traceroute), and `pathping` command-line tools.
*   **Report**: [Network_Lab_Report_3_VMware_Routing.pdf](Network-Labs-%E7%BD%91%E7%BB%9C%E5%AE%9E%E9%AA%8C/docs/Network_Lab_Report_3_VMware_Routing.pdf)
*   **Visual Proof**: Captured VM configs and route trace screenshots stored in [captures/](Network-Labs-%E7%BD%91%E7%BB%9C%E5%AE%9E%E9%AA%8C/src/captures).

### B. Wireshark TCP/UDP Transport Layer Packet Analysis
*   **Concepts**: Network packet sniffing on Ethernet interfaces. Parsing Ethernet II frames, IPv4 packet headers (checksum, TTL, protocol type), and TCP segment formats.
*   **Three-Way Handshake**: Capture and analysis of TCP session establishment:
    1.  `SYN` (synchronize sequence number)
    2.  `SYN-ACK` (synchronize acknowledgement)
    3.  `ACK` (acknowledgement)
*   **Four-Way Teardown**: Capture and analysis of TCP connection termination:
    1.  `FIN` (finished sending data)
    2.  `ACK` (acknowledge FIN)
    3.  `FIN` (receiver finishes sending data)
    4.  `ACK` (final acknowledge)
*   **Report**: [Network_Lab_Report_4_Wireshark_TCP_Analysis.pdf](Network-Labs-%E7%BD%91%E7%BB%9C%E5%AE%9E%E9%AA%8C/docs/Network_Lab_Report_4_Wireshark_TCP_Analysis.pdf)
*   **Visual Proof**: Wireshark frame grabs and sequence diagrams stored in [captures/](Network-Labs-%E7%BD%91%E7%BB%9C%E5%AE%9E%E9%AA%8C/src/captures).
