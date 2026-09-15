# 学部課程実践・総合工学実験フルスタックナレッジベース
# Comprehensive Undergraduate Course Practice & Engineering Experiment Portfolio

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)
[![Disciplines: 19 Courses](https://img.shields.io/badge/Disciplines-19%20Specialized%20Courses-red.svg?style=flat-square)](docs/)
[![Curriculum: 3--Year%20Timeline](https://img.shields.io/badge/Timeline-Freshman%20to%20Junior-orange.svg?style=flat-square)](docs/)
[![Domain: Automation & AI](https://img.shields.io/badge/Domain-Automation%20%7C%20Robotics%20%7C%20AI-blueviolet.svg?style=flat-square)](docs/)
[![Toolchain: Full Stack](https://img.shields.io/badge/Toolchain-MATLAB%20%7C%20Vivado%20%7C%20STM32%20%7C%20PyTorch-green.svg?style=flat-square)](docs/)

[**中文文档 (Chinese)**](README.md) | [**English Documentation**](README_EN.md) | [**日本語ドキュメント (Japanese)**](README_JA.md)

</div>

---

## 1. カリキュラム概要 (Curriculum Overview)

**学部課程実践・総合工学実験フルスタックナレッジベース**は、制御工学、ロボティクス、マイクロエレクトロニクス、および人工知能（AI）の主要学問領域を網羅した包括的な工学実践・学術ポートフォリオです。

本ナレッジベースは**大学3年間（学部1年次〜3年次、工学系5学期間）のタイムライン**を年代記軸とし、現代工学教育の根幹である「数理理論導出 $\rightarrow$ コンピュータ支援シミュレーション・モデリング $\rightarrow$ 低レイヤハードウェア実装検証 $\rightarrow$ システム統合実証」の閉ループ設計体系に厳密に準拠しています。専門主要19科目の実験ソースコード、数理モデルスクリプト、回路シミュレーション図、ハードウェア記述言語（HDL）資産、および学術実験レポートを体系的に収録しています。

また、過去資料に対する体系的な重複排除と純化監査を実施し、すべての収録成果物が高度な個人著作性と工学的純度を満たすよう整備されています。

---

## 2. 代表的実験成果とシステム可視化 (Visual Showcase)

<div align="center">

| 4層構造カリキュラムシステムアーキテクチャ図 | 自動制御原理 閉ループ動的 PID 応答曲線・周波数応答 |
| :---: | :---: |
| <img src="docs/images/system_architecture.png" width="450" alt="Curriculum Architecture"> | <img src="docs/images/demo_control_response.png" width="450" alt="Control Response"> |
| **コンピュータビジョン ホモグラフィ推定・パノラマ合成** | **パターン認識 ノンパラメトリックベイズ決定境界分類面** |
| <img src="docs/images/demo_computer_vision.jpg" width="450" alt="Computer Vision"> | <img src="docs/images/demo_pattern_recognition.png" width="450" alt="Pattern Recognition"> |

</div>

---

## 3. 大学3年間 専門19科目 実践年代記マトリクス (Chronological Curriculum Matrix)

### 3.1 Year 1 学部1年次 (Freshman)

#### Sem 2 学部1年次春学期 · 工学プログラミング・アナログ回路 (Spring Semester)
| 番号 | 専門科目名 | 学問領域 | 主要開発環境・技術スタック | 主要実験課題および工学成果 | 相対ディレクトリ |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **01** | **アナログ電子回路・シミュレーション** | ハードウェア | Multisim, 演算増幅器, BJT | エミッタ接地／ドレイン接地増幅回路、能動帯域通過フィルタ、ウィーンブリッジ発振回路 | [`01-アナログ電子回路`](Year1-Freshman-大一/Sem2-大一下-工程编程与模拟电路-Spring/01-模拟电子技术与电路仿真-Analog-Electronics-and-Simulation) |
| **02** | **C言語プログラミング演習** | 基礎計算機 | C99, GCC, Visual Studio | ポインタ深層メモリ管理、動的双方向リンクリスト、ビット演算、コンソール総合課題 | [`02-C言語プログラミング`](Year1-Freshman-大一/Sem2-大一下-工程编程与模拟电路-Spring/02-C语言程序设计-C-Programming-Labs) |

---

### 3.2 Year 2 学部2年次 (Sophomore)

#### Sem 1 学部2年次秋学期 · 電子回路・システム基礎 (Fall Semester)
| 番号 | 専門科目名 | 学問領域 | 主要開発環境・技術スタック | 主要実験課題および工学成果 | 相対ディレクトリ |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **03** | **ディジタル電子回路・FPGA** | 論理集積回路 | Verilog HDL, Vivado | マトリクスキーボードチャタリング防止、DAC波形発生器、VGA表示コントローラ | [`01-ディジタル電子回路・FPGA`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/01-数字电子技术与FPGA-Digital-Electronics-and-FPGA) |
| **04** | **信号とシステム** | 信号処理 | MATLAB, 積分変換理論 | 連続・離散時間たたみ込み積分、CTFT時系列解析、DTMFデュアルトーン電話復号 | [`02-信号とシステム`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/02-信号与系统-Signals-and-Systems) |
| **05** | **電子回路総合実験** | 回路試作実験 | 演算増幅器, フィルタ | RC正弦波発振回路、電圧比較器、アナログ積分器、周波数振幅特性掃引実測 | [`03-電子回路総合実験`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/03-电子电路综合实验-Electronic-Circuit-Experiments) |
| **06** | **計算機ソフトウェア基礎** | ソフトウェア | C++, Access, データ構造 | ハッシュテーブル衝突解決、二分木巡回、Access教室管理DBシステム設計 | [`04-計算機ソフトウェア基礎`](Year2-Sophomore-大二/Sem1-大二上-电子电路与系统基础-Fall/04-计算机软件技术基础-Computer-Software-Basics) |

#### Sem 2 学部2年次春学期 · 制御理論・組込みハードウェア (Spring Semester)
| 番号 | 専門科目名 | 学問領域 | 主要開発環境・技術スタック | 主要実験課題および工学成果 | 相対ディレクトリ |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **07** | **自動制御原理** | 制御科学 | MATLAB, 閉ループ制御 | 根軌跡法、Bode/Nyquist周波数解析、典型要素動特性模擬、倒立振子PID閉ループ校正 | [`01-自動制御原理`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/01-自动控制原理-Automatic-Control-Principles) |
| **08** | **マイクロコンピュータ・組込みシステム** | 組込み工学 | ARM Cortex-M, STM32, HAL | ベクタ割込み（NVIC）、DMA二重バッファ循環転送、C/アセンブラ混在プログラミング | [`02-マイクロ組込みシステム`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/02-微机与嵌入式系统-Micro-Embedded-Systems) |
| **09** | **センサ原理・応用計測** | 計測センシング | センサブリッジ回路, 補正 | ひずみゲージ全ブリッジ非線形性比較、変位・ホール速度計測、1次熱電対動的校正 | [`03-センサ原理・応用計測`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/03-传感器原理与应用-Sensor-Principles-and-Applications) |
| **10** | **パワーエレクトロニクス** | 電力変換 | Simulink, チョッパ/インバータ | Buck降圧チョッパ回路設計、単相・三相ブリッジ全制御整流回路、ブラシレスモータ駆動 | [`04-パワーエレクトロニクス`](Year2-Sophomore-大二/Sem2-大二下-控制理论与嵌入式硬件-Spring/04-电力电子技术-Power-Electronics-Technology) |

---

### 3.3 Year 3 学部3年次 (Junior)

#### Sem 1 学部3年次秋学期 · 先進制御・駆動ネットワーク (Fall Semester)
| 番号 | 専門科目名 | 学問領域 | 主要開発環境・技術スタック | 主要実験課題および工学成果 | 相対ディレクトリ |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **11** | **現代制御理論** | 現代制御 | MATLAB, 状態空間法 | 状態空間方程式導出、カルマン可制御性・可観測性ランク判据、極配置状態フィードバック | [`01-現代制御理論`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/01-现代控制理论-Modern-Control-Theory) |
| **12** | **計算機制御技術** | 制御工学 | MATLAB, 離散制御 | 連続コントローラの離散化モデリング、ディジタルPIDアルゴリズム、有限整定応答制御 | [`02-計算機制御技術`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/02-微机控制技术-Computer-Control-Technology) |
| **13** | **電動機駆動・モーションコントロール** | 電気工学 | MATLAB/Simulink | 直流電動機開ループ制御と機械特性評価、かご形誘導電動機ベクトル制御モデリング | [`03-電動機駆動制御`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/03-电机拖动与运动控制-Motor-Drives-and-Motion-Control) |
| **14** | **通信・ネットワーク技術** | 通信ネットワーク | Wireshark, 変調解析 | ディジタル基底帯域伝送特性、伝送チャネルフェージングモデル、TCP/IPパケット解析 | [`04-通信・ネットワーク技術`](Year3-Junior-大三/Sem1-大三上-先进控制与驱动网络-Fall/04-通信与网络技术-Communications-and-Network-Technologies) |

#### Sem 2 学部3年次春学期 · 知能センシング・計測制御システム (Spring Semester)
| 番号 | 専門科目名 | 学問領域 | 主要開発環境・技術スタック | 主要実験課題および工学成果 | 相対ディレクトリ |
| :---: | :--- | :---: | :--- | :--- | :--- |
| **15** | **コンピュータビジョン** | 人工知能 | Python, OpenCV | SIFT/ORB特徴量抽出・マッチング、ホモグラフィ透視変換、パノラマ画像スティッチング | [`01-コンピュータビジョン`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/01-计算机视觉-Computer-Vision) |
| **16** | **データ収集・信号処理** | 計測機器 | AD9284, FIFO, Vivado | 8ビット高速ADCサンプリング信号調整、FIFO IPコア割込みDMAデータ収集システム設計 | [`02-データ収集・信号処理`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/02-数据采集与处理-Data-Acquisition-and-Processing) |
| **17** | **機械学習** | 知能システム | PyTorch, Scikit-Learn | 通信変調方式ディープラーニング自動分類、コンスタレーション分類モデルパイプライン | [`03-機械学習`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/03-机器学习-Machine-Learning) |
| **18** | **パターン認識** | 統計的学習 | MATLAB, パターン分析 | 最小誤り率ベイズ決定境界モデル、2次元正規分布決定面設計と決定境界可視化 | [`04-パターン認識`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/04-模式识别-Pattern-Recognition) |
| **19** | **パルスパワー工学** | 高エネルギー | PLECS, パルス放電 | パルス形成回路網（PFN）放電動特性シミュレーション、フルブリッジ/フライバック発生器 | [`05-パルスパワー工学`](Year3-Junior-大三/Sem2-大三下-智能感知与测控系统-Spring/05-脉冲功率技术-Pulse-Power-Technology) |

---

## 4. コア数理モデルと制御工学理論導出 (Mathematical Formulations)

学際的分野における理論的厳密性を示すため、全カリキュラムを代表する5つの数理定式化を以下に示します：

### 4.1 線形時不変（LTI）システムの連続・離散たたみ込み積分方程式

単位インパルス応答 $h(t)$ を有する LTI システムに入力 $x(t)$ が印加されたとき、連続時間応答 $y(t)$ は時域たたみ込み積分によって決定されます：

$$
y(t) = x(t) * h(t) = \int_{-\infty}^{\infty} x(\tau) h(t - \tau) \, d\tau
$$

ディジタル離散サンプリング系列 $x[n]$ および $h[n]$ に対しては、離散たたみ込み和として表現されます：

$$
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{\infty} x[k] h[n - k]
$$

### 4.2 現代制御理論における状態空間表現とカルマン可制御性判据

多入力多出力（MIMO）連続線形時不変システムの状態空間方程式は次のように定義されます：

$$
\dot{\mathbf{x}}(t) = \mathbf{A}\mathbf{x}(t) + \mathbf{B}\mathbf{u}(t)
$$

$$
\mathbf{y}(t) = \mathbf{C}\mathbf{x}(t) + \mathbf{D}\mathbf{u}(t)
$$

システムが完全状態可制御であるための必要十分条件は、可制御性行列 $\mathcal{C}$ がフルランクを満たすことです：

$$
\text{rank}(\mathcal{C}) = \text{rank}\left( \left[ \mathbf{B} \quad \mathbf{A}\mathbf{B} \quad \mathbf{A}^2\mathbf{B} \quad \cdots \quad \mathbf{A}^{n-1}\mathbf{B} \right] \right) = n
$$

### 4.3 離散フーリエ変換（DFT）による周波数スペクトル解析モデル

有限長離散系列 $x[n]$（長さ $N$）の離散周波数スペクトル $X[k]$ は次式により評価されます：

$$
X[k] = \sum_{n=0}^{N-1} x[n] \cdot W_N^{kn}, \quad W_N = e^{-j\frac{2\pi}{N}}
$$

逆離散フーリエ変換（IDFT）による時間領域直交再構成：

$$
x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot W_N^{-kn}
$$

### 4.4 連続時間型および離散増分型 PID フィードバック制御則

連続時間理想 PID コントローラの出力操作量 $u(t)$ は次式で表されます：

$$
u(t) = K_p e(t) + K_i \int_0^t e(\tau) \, d\tau + K_d \frac{de(t)}{dt}
$$

ディジタルマイコン実装時には、積分ワインドアップを防止しアクチュエータの円滑な動作を保証する離散増分型 PID アルゴリズムを適用します：

$$
\Delta u[k] = K_p \left( e[k] - e[k-1] \right) + K_i e[k] + K_d \left( e[k] - 2e[k-1] + e[k-2] \right)
$$

### 4.5 教師あり学習における正則化付き経験リスク最小化規範

機械学習の最適化問題において、訓練データセット $(\mathbf{x}_i, y_i)$（$i=1,\dots,M$）および重みパラメータ $\mathbf{w}$ に対する目的関数は、$L_2$ 正則化ペナルティ項を付加した経験リスク最小化として定式化されます：

$$
\min_{\mathbf{w}} \mathcal{L}(\mathbf{w}) = \frac{1}{M} \sum_{i=1}^M \ell(f(\mathbf{x}_i; \mathbf{w}), y_i) + \frac{\lambda}{2} \|\mathbf{w}\|_2^2
$$

---

## 5. 独立オープンソースプロジェクトエコシステム (Featured Standalone Repositories)

上記19科目の工学課程実践に加えて、システムレベル・マルチモーダル・知能ハードウェアの代表成果がGitHubの個別リポジトリにて公開されています：

* 🤖 [**ChessRobot (4軸チェス対局ロボット・ビジョンモーション制御システム)**](https://github.com/DongFengPo1412/ChessRobot)  
  *YOLOによる駒姿勢推定、逆運動学解析、PCA9685サーボ駆動、実機対局統合システム。*
* 🚪 [**All-in-One-Smart-Access-Control-System (3-in-1 スマート顔認証入退室管理システム)**](https://github.com/DongFengPo1412/All-in-One-Smart-Access-Control-System)  
  *顔認証・指紋・RFIDマルチファクタ認証を統合したエッジコンピューティング組込みゲートシステム。*
* 💡 [**Intelligent-Lighting-Control-System-Basic (オフライン音声照明・音響視覚対話システム・初級)**](https://github.com/DongFengPo1412/Intelligent-Lighting-Control-System-Basic)  
  *ASRPRO AI音声SoCと 16×16 WS2812B RGB マトリクスによる無垢材フレーム音響照明システム。*
* 💡 [**Intelligent-Lighting-Control-System-Pro (具現化マルチモーダル知能光影対話システム・高級)**](https://github.com/DongFengPo1412/Intelligent-Lighting-Control-System-Pro)  
  *ESP32-S3 端雲協調、音声対話、音楽リズム同期およびマルチモーダルアテンション光影ハードウェア。*
* 🎛️ [**Design-of-Simple-Calculator-Based-on-FPGA (FPGA多機能ハードウェア電卓)**](https://github.com/DongFengPo1412/Design-of-Simple-Calculator-Based-on-FPGA)  
  *Verilog HDLによる浮動小数点・固定小数点演算コプロセッサおよびFSM状態遷移制御回路。*
* 🎽 [**Fabric-Electronics-Based-Wearable-Posture-Sensing-System (ファブリック電子姿勢検知)**](https://github.com/DongFengPo1412/Fabric-Electronics-Based-Wearable-Posture-Sensing-System)  
  *柔軟布地センサに基づくウェアラブル人体姿勢計測・組込みコンピューティングシステム。*
* 🎮 [**Vampire-Survivors-like-roguelite-casual-game (Unityゲーム《ROGue Survivor》)**](https://github.com/DongFengPo1412/Vampire-Survivors-like-roguelite-casual-game)  
  *UnityおよびC#で開発された見下ろし型Rogue-liteアクションサバイバーゲーム。*
* ✍️ [**Multi-class-Handwritten-Character-Recognition-System-Based-on-CNN (CNN手書き文字認識)**](https://github.com/DongFengPo1412/Multi-class-Handwritten-Character-Recognition-System-Based-on-CNN)  
  *62種類の文字（英数字）に対応したエンドツーエンドCNN手書き認識および信頼度補正。*
* 🖱️ [**Virtual-Mouse-and-Gesture-Control-System (ジェスチャ認識バーチャルマウス)**](https://github.com/DongFengPo1412/Virtual-Mouse-and-Gesture-Control-System)  
  *単眼カメラ手部キーポイント追跡に基づく非接触バーチャルカーソル操作システム。*

---

## 6. ライセンス (License)

本リポジトリは [MIT License](LICENSE) のもとで公開されています。
