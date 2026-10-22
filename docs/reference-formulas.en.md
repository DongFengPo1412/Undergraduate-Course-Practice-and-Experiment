# Reference formulas

[Overview](../README_EN.md)

The collection includes personal assignments, team experiments, instructor examples, and third-party libraries. It is not uniformly original personal work. A directory is not a reproduction result; report figures, images, and model checkpoints were not remeasured in this maintenance.

## 4. Core Mathematical Formulations & Theoretical Derivations

To demonstrate theoretical rigor across multidisciplinary domains, five representative mathematical formulations implemented throughout the curriculum are documented below:

### 4.1 Continuous & Discrete Convolution Integrals for LTI Systems

For a Linear Time-Invariant (LTI) system excited by input signal $x(t)$ with unit impulse response $h(t)$, the continuous-time output $y(t)$ is evaluated via the convolution integral:

$$
y(t) = x(t) * h(t) = \int_{-\infty}^{\infty} x(\tau) h(t - \tau) \, d\tau
$$

In sampled discrete-time systems with sequences $x[n]$ and $h[n]$, the discrete convolution sum is given by:

$$
y[n] = x[n] * h[n] = \sum_{k=-\infty}^{\infty} x[k] h[n - k]
$$

### 4.2 State-Space Representation & Kalman Controllability Criterion

A continuous-time multi-input multi-output (MIMO) linear time-invariant dynamical system is represented in state-space form:

$$
\dot{\mathbf{x}}(t) = \mathbf{A}\mathbf{x}(t) + \mathbf{B}\mathbf{u}(t)
$$

$$
\mathbf{y}(t) = \mathbf{C}\mathbf{x}(t) + \mathbf{D}\mathbf{u}(t)
$$

The necessary and sufficient condition for complete state controllability is that the controllability matrix $\mathcal{C}$ satisfies full rank:

$$
\text{rank}(\mathcal{C}) = \text{rank}\left( \left[ \mathbf{B} \quad \mathbf{A}\mathbf{B} \quad \mathbf{A}^2\mathbf{B} \quad \cdots \quad \mathbf{A}^{n-1}\mathbf{B} \right] \right) = n
$$

### 4.3 Discrete Fourier Transform (DFT) Frequency-Domain Representation

For a finite-length discrete sequence $x[n]$ of length $N$, the discrete frequency spectrum $X[k]$ is evaluated via the DFT:

$$
X[k] = \sum_{n=0}^{N-1} x[n] \cdot W_N^{kn}, \quad W_N = e^{-j\frac{2\pi}{N}}
$$

The original discrete-time sequence is reconstructed orthogonally through the Inverse Discrete Fourier Transform (IDFT):

$$
x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] \cdot W_N^{-kn}
$$

### 4.4 Continuous & Discrete Incremental PID Control Formulation

The continuous-time ideal PID controller generates actuation output $u(t)$ based on error signal $e(t)$:

$$
u(t) = K_p e(t) + K_i \int_0^t e(\tau) \, d\tau + K_d \frac{de(t)}{dt}
$$

The incremental PID formula is a reference; saturation and anti-windup require separate design.

$$
\Delta u[k] = K_p \left( e[k] - e[k-1] \right) + K_i e[k] + K_d \left( e[k] - 2e[k-1] + e[k-2] \right)
$$

### 4.5 Empirical Risk Minimization & Regularized Optimization

In supervised machine learning, given training dataset $(\mathbf{x}_i, y_i)$ for $i=1,\dots,M$ and parameter vector $\mathbf{w}$, the objective loss combines empirical risk with an $L_2$ regularization penalty:

$$
\min_{\mathbf{w}} \mathcal{L}(\mathbf{w}) = \frac{1}{M} \sum_{i=1}^M \ell(f(\mathbf{x}_i; \mathbf{w}), y_i) + \frac{\lambda}{2} \|\mathbf{w}\|_2^2
$$

---
