# Reference formulas

[Overview](../README_JA.md)

個人課題、チーム実験、教員のサンプル、第三者ライブラリが混在しており、全体を個人の独自成果とは扱いません。ディレクトリの存在は再現の証拠ではなく、レポートの図・画像・重みの結果は今回再測定していません。

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

増分形 PID は参考式であり、飽和・アンチワインドアップは別途設計する必要があります。

$$
\Delta u[k] = K_p \left( e[k] - e[k-1] \right) + K_i e[k] + K_d \left( e[k] - 2e[k-1] + e[k-2] \right)
$$

### 4.5 教師あり学習における正則化付き経験リスク最小化規範

機械学習の最適化問題において、訓練データセット $(\mathbf{x}_i, y_i)$（$i=1,\dots,M$）および重みパラメータ $\mathbf{w}$ に対する目的関数は、$L_2$ 正則化ペナルティ項を付加した経験リスク最小化として定式化されます：

$$
\min_{\mathbf{w}} \mathcal{L}(\mathbf{w}) = \frac{1}{M} \sum_{i=1}^M \ell(f(\mathbf{x}_i; \mathbf{w}), y_i) + \frac{\lambda}{2} \|\mathbf{w}\|_2^2
$$

---
