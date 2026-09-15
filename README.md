# 本科课程实践与综合实验全栈工程知识库
# Comprehensive Undergraduate Course Practice & Engineering Experiment Portfolio

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)
[![Disciplines: 19 Courses](https://img.shields.io/badge/Disciplines-19%20Specialized%20Courses-red.svg?style=flat-square)](docs/)
[![Curriculum: 3--Year%20Timeline](https://img.shields.io/badge/Timeline-Freshman%20to%20Junior-orange.svg?style=flat-square)](docs/)
[![Domain: Automation & AI](https://img.shields.io/badge/Domain-Automation%20%7C%20Robotics%20%7C%20AI-blueviolet.svg?style=flat-square)](docs/)
[![Toolchain: Full Stack](https://img.shields.io/badge/Toolchain-MATLAB%20%7C%20Vivado%20%7C%20STM32%20%7C%20PyTorch-green.svg?style=flat-square)](docs/)

[**中文文档**](README.md) | [**English Documentation**](README_EN.md) | [**日本語ドキュメント**](README_JA.md)

</div>

---

## 1. 知识库总览 (Curriculum Overview)

**本科课程实践与综合实验全栈工程知识库** 是涵盖自动化、机器人、测控技术、微电子芯片及人工智能学科核心课程的完整实践工程与学术资产全集。

本知识库以**大学三年（大一至大三，5 个工科专业学期）时间线**为编年史脉络，严谨遵循现代工科教育“理论推导 $\rightarrow$ 计算机辅助建模仿真 $\rightarrow$ 底层硬件验证 $\rightarrow$ 系统级集成创新”的工程闭环体系，全面收录了 **19 门专业核心主干课程**的实验源码、数学建模脚本、仿真原理图、硬件描述代码与学术实验报告，并经系统级去重与纯化审计，确保所有收录内容具备高度的个人原创性与工程纯粹度。

---

## 2. 核心实验与课程成果展示 (Visual Showcase)

<div align="center">

| 课程体系四大层级系统架构图 | 自动控制原理闭环动态 PID 响应曲线与频域分析 |
| :---: | :---: |
| <img src="docs/images/system_architecture.png" width="450" alt="Curriculum Architecture"> | <img src="docs/images/demo_control_response.png" width="450" alt="Control Response"> |
| **计算机视觉高精度特征匹配与全景图像拼接** | **模式识别非参数估计与贝叶斯决策边界分类面** |
| <img src="docs/images/demo_computer_vision.jpg" width="450" alt="Computer Vision"> | <img src="docs/images/demo_pattern_recognition.png" width="450" alt="Pattern Recognition"> |

</div>

---

## 3. 大学三年 19 门专业课程实践编年史矩阵 (Chronological Curriculum Matrix)

### 3.1 Year 1 大一 (Freshman)

#### Sem 2 大一下 · 工程编程与模拟电路 (Spring Semester)
| 序号 | 课程名称 | 学科领域 | 核心技术栈 | 关键工程实验与学术实践成果 | 目录相对路径 |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **01** | **模拟电子技术与电路仿真** | 硬件电路 | Multisim, 运放, 晶体管 | 晶体管共射/共漏放大电路、有源带通滤波器、文氏电桥振荡器仿真与参数实测 | [`01-模拟电子技术与电路仿真`](Year1-Freshman-大一/Sem2-大一下-工程编程与模拟电路-Spring/01-模拟电子技术与电路仿真-Analog-Electronics-and-Simulation) |
| **02** | **C语言程序设计** | 基础计算 | C99, GCC, Visual Studio | 指针内存深层操作、动态双向链表、位域操作与控制台期末综合大作业 | [`02-C语言程序设计`](Year1-Freshman-大一/Sem2-大一下-工程编程与模拟电路-Spring/02-C语言程序设计-C-Programming-Labs) |

---

### 3.2 Year 2 大二 (Sophomore)

#### Sem 1 大二上 · 电子电路与系统基础 (Fall Semester)
| 序号 | 课程名称 | 学科领域 | 核心技术栈 | 关键工程实验与学术实践成果 | 目录相对路径 |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **03** | **数字电子技术与FPGA** | 数字芯片 | Verilog HDL, Vivado | 矩阵键盘消抖驱动、DAC 波形发生器、VGA 显存控制器与多功能硬件工程 | [`01-数字电子技术与FPGA`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/01-数字电子技术与FPGA-Digital-Electronics-and-FPGA) |
| **04** | **信号与系统** | 信号处理 | MATLAB, 积分变换 | 连续与离散卷积积分、CTFT/时频分析、基于双音多频 DTMF 电话按键解码系统 | [`02-信号与系统`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/02-信号与系统-Signals-and-Systems) |
| **05** | **电子电路综合实验** | 硬件实践 | 运放应用, 滤波调理 | 文氏桥 RC 正弦波产生电路、电压比较器、积分器与幅频特性扫频测试 | [`03-电子电路综合实验`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/03-电子电路综合实验-Electronic-Circuit-Experiments) |
| **06** | **计算机软件技术基础** | 软件系统 | C++, Access, 数据结构 | 散列表碰撞算法、树形遍历、基于 Access 教室管理系统数据库设计与科技论文 | [`04-计算机软件技术基础`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/04-计算机软件技术基础-Computer-Software-Basics) |

#### Sem 2 大二下 · 控制理论与嵌入式硬件 (Spring Semester)
| 序号 | 课程名称 | 学科领域 | 核心技术栈 | 关键工程实验与学术实践成果 | 目录相对路径 |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **07** | **自动控制原理** | 控制科学 | MATLAB, 闭环系统 | 根轨迹绘制、Bode/Nyquist 频域分析、典型环节模拟与倒立摆 PID 闭环校正 | [`01-自动控制原理`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/01-自动控制原理-Automatic-Control-Principles) |
| **08** | **微机与嵌入式系统** | 嵌入式 | ARM Cortex-M, STM32, HAL | 嵌套向量中断（NVIC）、DMA 双缓冲循环传输、C 与 Cortex-M 汇编混合编程 | [`02-微机与嵌入式系统`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/02-微机与嵌入式系统-Micro-Embedded-Systems) |
| **09** | **传感器原理与应用** | 工业感知 | 传感器电路, 标定补偿 | 应变片全桥非线性度对比、位移/霍尔测速实验、一阶温度传感器动态标定 | [`03-传感器原理与应用`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/03-传感器原理与应用-Sensor-Principles-and-Applications) |
| **10** | **电力电子技术** | 电能变换 | Simulink, 斩波/逆变 | Buck 降压斩波拓扑设计、单相/三相桥式全控整流电路与无刷电机驱动验证 | [`04-电力电子技术`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/04-电力电子技术-Power-Electronics-Technology) |

---

### 3.3 Year 3 大三 (Junior)

#### Sem 1 大三上 · 先进控制与驱动网络 (Fall Semester)
| 序号 | 课程名称 | 学科领域 | 核心技术栈 | 关键工程实验与学术实践成果 | 目录相对路径 |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **11** | **现代控制理论** | 现代控制 | MATLAB, 状态空间分析 | 状态空间表达、卡尔曼能控/能观性秩判据、状态反馈极点配置与状态观测器 | [`01-现代控制理论`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/01-现代控制理论-Modern-Control-Theory) |
| **12** | **微机控制技术** | 控制工程 | MATLAB, 离散控制 | 连续控制器离散化建模、数字 PID 控制系统设计、最少拍无纹波离散系统仿真 | [`02-微机控制技术`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/02-微机控制技术-Computer-Control-Technology) |
| **13** | **电机拖动与运动控制** | 电气工程 | MATLAB/Simulink | 他励直流电机开环控制与机械特性仿真、鼠笼异步电机调速模型与动态分析 | [`03-电机拖动与运动控制`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/03-电机拖动与运动控制-Motor-Drives-and-Motion-Control) |
| **14** | **通信与网络技术** | 通信网络 | Wireshark, 调制分析 | 数字基带传输特性、通信信道衰落建模、TCP/IP 协议栈抓包报文分析 | [`04-通信与网络技术`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/04-通信与网络技术-Communications-and-Network-Technologies) |

#### Sem 2 大三下 · 智能感知与测控系统 (Spring Semester)
| 序号 | 课程名称 | 学科领域 | 核心技术栈 | 关键工程实验与学术实践成果 | 目录相对路径 |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **15** | **计算机视觉** | 人工智能 | Python, OpenCV | SIFT/ORB 特征提取与高精度匹配、单应性矩阵透视变换、全景图像拼接系统 | [`01-计算机视觉`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/01-计算机视觉-Computer-Vision) |
| **16** | **数据采集与处理** | 仪器测控 | AD9284, FIFO, Vivado | 8位高速 ADC 采样调理、FIFO IP 核中断传输机制与数据采集课程设计 | [`02-数据采集与处理`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/02-数据采集与处理-Data-Acquisition-and-Processing) |
| **17** | **机器学习** | 智能决策 | PyTorch, Scikit-Learn | 调制信号深度学习自动识别、星座图分类大作业模型与完整训练评估流水线 | [`03-机器学习`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/03-机器学习-Machine-Learning) |
| **18** | **模式识别** | 统计学习 | MATLAB, 模式分析 | 最小错误率贝叶斯决策边界建模、二维正态分布分类面设计与决策面可视化 | [`04-模式识别`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/04-模式识别-Pattern-Recognition) |
| **19** | **脉冲功率技术** | 高能物理 | PLECS, 脉冲放电 | 脉冲形成网络（PFN）放电动态仿真、全桥与反激拓扑高压脉冲发生电路 | [`05-脉冲功率技术`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/05-脉冲功率技术-Pulse-Power-Technology) |

---

## 4. 核心数学模型与控制工程理论推导 (Mathematical Formulations)

为展示工科专业深厚的理论底蕴，知识库针对代表性学科领域建立了严谨的数理公式推导：

### 4.1 线性时不变（LTI）系统连续与离散卷积积分方程

设线性时不变系统的输入激励为 $x(t)$，系统的单位冲激响应为 $h(t)$。连续时间输出响应 $y(t)$ 由时域卷积积分严格确定：

$$
y(t) = x(t) * h(t) = \int_{-\infty}^{\infty} x(\tau) h(t - \tau) \, d\tau
$$

在数字离散时间采样域中，设序列为 $x[n]$ 与 $h[n]$，离散卷积和方程表示为：

$$
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{\infty} x[k] h[n - k]
$$

### 4.2 现代控制理论状态空间表达与卡尔曼能控性判据

多输入多输出（MIMO）连续线性定常系统的状态空间模型由状态方程与输出方程联立构成：

$$
\dot{\mathbf{x}}(t) = \mathbf{A}\mathbf{x}(t) + \mathbf{B}\mathbf{u}(t)
$$

$$
\mathbf{y}(t) = \mathbf{C}\mathbf{x}(t) + \mathbf{D}\mathbf{u}(t)
$$

系统完全状态能控的充要条件为能控性判别矩阵 $\mathcal{C}$ 满足满秩条件：

$$
\text{rank}(\mathcal{C}) = \text{rank}\left( \left[ \mathbf{B} \quad \mathbf{A}\mathbf{B} \quad \mathbf{A}^2\mathbf{B} \quad \cdots \quad \mathbf{A}^{n-1}\mathbf{B} \right] \right) = n
$$

### 4.3 离散傅里叶变换（DFT）时频转换模型

对长度为 $N$ 的有限长离散时域采样序列 $x[n]$，其在离散频域的第 $k$ 个频谱分量由 DFT 正变换给出：

$$
X[k] = \sum_{n=0}^{N-1} x[n] \cdot W_N^{kn}, \quad W_N = e^{-j\frac{2\pi}{N}}
$$

逆离散傅里叶变换（IDFT）实现时域正交重建：

$$
x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot W_N^{-kn}
$$

### 4.4 连续型与离散增量型 PID 反馈控制算法

经典 PID 连续控制器输出驱动量表达式为：

$$
u(t) = K_p e(t) + K_i \int_0^t e(\tau) \, d\tau + K_d \frac{de(t)}{dt}
$$

在嵌入式微控制器中执行时，采用离散增量型 PID 算法以消除积分饱和并提升执行机构平滑度：

$$
\Delta u[k] = K_p \left( e[k] - e[k-1] \right) + K_i e[k] + K_d \left( e[k] - 2e[k-1] + e[k-2] \right)
$$

### 4.5 监督学习经验风险最小化与正则化泛化准则

在机器学习特征映射任务中，设训练集包含 $M$ 个样本对 $(\mathbf{x}_i, y_i)$，模型参数权重为 $\mathbf{w}$。目标优化损失函数采用经验风险最小化结合 $L_2$ 正则化惩罚项：

$$
\min_{\mathbf{w}} \mathcal{L}(\mathbf{w}) = \frac{1}{M} \sum_{i=1}^M \ell(f(\mathbf{x}_i; \mathbf{w}), y_i) + \frac{\lambda}{2} \|\mathbf{w}\|_2^2
$$

---

## 5. 独立开源工程生态 (Featured Standalone Repositories)

除了上述 19 门工科专业课程的系统实践，知识库作者还在以下 GitHub 独立仓库中开源了系统级、多模态及智能硬件代表项目：

* 🤖 [**ChessRobot (四轴国际象棋视觉与运动控制机器人)**](https://github.com/DongFengPo1412/ChessRobot)  
  *基于 YOLO 棋子姿态估计、逆运动学求解、PCA9685舵机驱动与实物交互的四轴下棋机器人系统。*
* 🚪 [**All-in-One-Smart-Access-Control-System (三合一智慧人脸识别门禁系统)**](https://github.com/DongFengPo1412/All-in-One-Smart-Access-Control-System)  
  *集成人脸识别、指纹与 RFID 多因子认证的边缘计算嵌入式智慧门禁系统，具备多任务实时调度机制。*
* 💡 [**Intelligent-Lighting-Control-System-Basic (智能离线语音灯光音乐交互系统·初阶)**](https://github.com/DongFengPo1412/Intelligent-Lighting-Control-System-Basic)  
  *基于 ASRPRO 离线语音 SoC 与 16×16 WS2812B RGB 全彩矩阵的手作实木光影音画交互系统。*
* 💡 [**Intelligent-Lighting-Control-System-Pro (具身多模态智能光影交互系统·高阶)**](https://github.com/DongFengPo1412/Intelligent-Lighting-Control-System-Pro)  
  *基于 ESP32-S3 端云协同、语音交互、音乐律动及多模态注意力的智能光影交互硬件系统。*
* 🎛️ [**Design-of-Simple-Calculator-Based-on-FPGA (基于 FPGA 的多功能硬件计算器)**](https://github.com/DongFengPo1412/Design-of-Simple-Calculator-Based-on-FPGA)  
  *基于 Verilog HDL 实现的浮点与定点算术硬件协处理器，具备完整状态机调度与按键/显示驱动。*
* 🎽 [**Fabric-Electronics-Based-Wearable-Posture-Sensing-System (织物电子可穿戴姿态感知)**](https://github.com/DongFengPo1412/Fabric-Electronics-Based-Wearable-Posture-Sensing-System)  
  *基于柔性织物电子传感器的可穿戴人体体态感知与计算硬件系统。*
* 🎮 [**Vampire-Survivors-like-roguelite-casual-game (Unity 独立游戏《ROGue Survivor》)**](https://github.com/DongFengPo1412/Vampire-Survivors-like-roguelite-casual-game)  
  *采用 Unity 引擎与 C# 开发的俯视角 Rogue-lite 动作幸存者游戏。*
* ✍️ [**Multi-class-Handwritten-Character-Recognition-System-Based-on-CNN (CNN手写字符识别)**](https://github.com/DongFengPo1412/Multi-class-Handwritten-Character-Recognition-System-Based-on-CNN)  
  *支持 62 类字符（数字、大小写字母）的端到端卷积神经网络手写识别与置信度校正系统。*
* 🖱️ [**Virtual-Mouse-and-Gesture-Control-System (手势识别虚拟鼠标)**](https://github.com/DongFengPo1412/Virtual-Mouse-and-Gesture-Control-System)  
  *基于单目视觉手部关键点追踪的无接触虚拟光标交互控制系统。*

---

## 6. 开源许可证 (License)

本项目遵循 [MIT License](LICENSE) 开源协议。
