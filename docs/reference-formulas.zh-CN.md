# Reference formulas

[Overview](../README.md)

内容包含个人作业、团队实验、教师参考工程及第三方库，不应整体称为个人原创成果。目录存在不等于该实验已经复现；报告、图片和权重的历史结果均没有在本轮重新测量。

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

增量式 PID 公式是参考表达；仍需另行设计饱和与抗积分饱和处理。

$$
\Delta u[k] = K_p \left( e[k] - e[k-1] \right) + K_i e[k] + K_d \left( e[k] - 2e[k-1] + e[k-2] \right)
$$

### 4.5 监督学习经验风险最小化与正则化泛化准则

在机器学习特征映射任务中，设训练集包含 $M$ 个样本对 $(\mathbf{x}_i, y_i)$，模型参数权重为 $\mathbf{w}$。目标优化损失函数采用经验风险最小化结合 $L_2$ 正则化惩罚项：

$$
\min_{\mathbf{w}} \mathcal{L}(\mathbf{w}) = \frac{1}{M} \sum_{i=1}^M \ell(f(\mathbf{x}_i; \mathbf{w}), y_i) + \frac{\lambda}{2} \|\mathbf{w}\|_2^2
$$

---
