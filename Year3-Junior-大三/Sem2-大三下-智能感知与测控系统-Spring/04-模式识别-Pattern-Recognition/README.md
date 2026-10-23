# Pattern Recognition (模式识别) - Academic Portfolio

This repository contains the academic portfolio for the **Pattern Recognition (模式识别)** course completed by **Chaoran Liu (刘超然)**. The portfolio is organized into three major projects, showcasing foundational classification theory, parametric/non-parametric density estimation, and advanced kernel-based support vector machine classifiers.

---

## Portfolio Navigation

- 📁 **[Project 1: 2D Gaussian Bayesian Decision Surface Visualization](Project1-%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%86%B3%E7%AD%96%E9%9D%A2-Bayesian-Decision-Boundary)**
  - 📄 [Simulation Source Code](Project1-%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%86%B3%E7%AD%96%E9%9D%A2-Bayesian-Decision-Boundary/Source-%E7%AE%97%E6%B3%95%E6%BA%90%E7%A0%81-src/Bayesian_Decision_Boundary.m)
  - 📄 [Project Presentation Report (PDF)](Project1-%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%86%B3%E7%AD%96%E9%9D%A2-Bayesian-Decision-Boundary/Docs-%E8%AE%B2%E4%B9%89%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Project_1_Bayesian_Decision_Boundary_Report.pdf)
- 📁 **[Project 2: Nemo Image Segmentation via Bayesian Decision & Density Estimation](Project2-%E5%88%86%E7%BA%A7%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%88%86%E5%89%B2-Bayesian-Segmentation)**
  - 📄 [Parametric Gaussian Classifier Code](Projects-%E6%A8%A1%E5%BC%8F%E8%AF%86%E5%88%AB%E5%A4%A7%E4%BD%9C%E4%B8%9A2/Gaussian.m)
  - 📄 [Non-Parametric Parzen/k-NN Classifier Code](Projects-%E6%A8%A1%E5%BC%8F%E8%AF%86%E5%88%AB%E5%A4%A7%E4%BD%9C%E4%B8%9A2/ParzenkNN.m)
  - 📄 [Ultimate Non-Parametric Area Filter Code](Project2-%E5%88%86%E7%BA%A7%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%88%86%E5%89%B2-Bayesian-Segmentation/Source-%E7%AE%97%E6%B3%95%E6%BA%90%E7%A0%81-src/NonParametric_Nemo.m)
  - 📄 [Project Presentation Report (PDF)](Project2-%E5%88%86%E7%BA%A7%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%88%86%E5%89%B2-Bayesian-Segmentation/Docs-%E8%AE%B2%E4%B9%89%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Bayesian_Image_Segmentation_Report.pdf)
- 📁 **[Project 3: SVM Face Detection based on LIBSVM](Project3-SVM%E4%BA%BA%E8%84%B8%E6%A3%80%E6%B5%8B-SVM-Face-Detection)**
  - 📄 SVM Toy Classification Visualizer [not archived](#unavailable-references)
  - 📄 [SVM Face Detection Classifier Code](Project3-SVM%E4%BA%BA%E8%84%B8%E6%A3%80%E6%B5%8B-SVM-Face-Detection/src/SVM_Face_Classification.m)
  - 📁 LIBSVM MATLAB Binaries & C Source [not archived](#unavailable-references)
  - 📄 [Project Presentation Report (PDF)](Project3-SVM%E4%BA%BA%E8%84%B8%E6%A3%80%E6%B5%8B-SVM-Face-Detection/docs/SVM_Face_Detection_Report.pdf)

---

## Detailed Project Descriptions

### Project 1: 2D Gaussian Bayesian Decision Surface Visualization

This project explores the geometry of Bayesian decision boundaries between two classes under multivariate normal (Gaussian) distributions with equal prior probabilities $P(\omega_1) = P(\omega_2) = 0.5$.

#### 1. Mathematical Modeling
A 2D multivariate normal distribution is defined by:
$$p(\mathbf{x}|\omega_i) = \frac{1}{2\pi |\mathbf{\Sigma}_i|^{1/2}} \exp \left( -\frac{1}{2} (\mathbf{x} - \boldsymbol{\mu}_i)^T \mathbf{\Sigma}_i^{-1} (\mathbf{x} - \boldsymbol{\mu}_i) \right)$$

Under minimum error rate classification, the decision rule simplifies to comparing the log posterior probabilities. The decision boundary is the locus where:
$$\ln p(\mathbf{x}|\omega_1) - \ln p(\mathbf{x}|\omega_2) = 0$$

#### 2. Experimental Cases
The simulation script `Bayesian_Decision_Boundary.m` implements three classical configurations:
*   **Case 1a: Equal Spherical Covariances ($\mathbf{\Sigma}_1 = \mathbf{\Sigma}_2 = \sigma^2 \mathbf{I}$)**
    *   *Parameters*: $\boldsymbol{\mu}_1 = [1, 1]^T$, $\boldsymbol{\mu}_2 = [4, 4]^T$, $\mathbf{\Sigma}_1 = \mathbf{\Sigma}_2 = \begin{bmatrix} 1.5 & 0 \\ 0 & 1.5 \end{bmatrix}$.
    *   *Result*: The quadratic terms cancel out. The decision boundary is linear and represents the perpendicular bisector of the line segment connecting the class means $\boldsymbol{\mu}_1$ and $\boldsymbol{\mu}_2$.
*   **Case 1b: Equal Non-Spherical Covariances ($\mathbf{\Sigma}_1 = \mathbf{\Sigma}_2 \neq \sigma^2 \mathbf{I}$)**
    *   *Parameters*: $\boldsymbol{\mu}_1 = [1, 1]^T$, $\boldsymbol{\mu}_2 = [4, 4]^T$, $\mathbf{\Sigma}_1 = \mathbf{\Sigma}_2 = \begin{bmatrix} 2.0 & 0.8 \\ 0.8 & 1.5 \end{bmatrix}$.
    *   *Result*: The boundary is linear but skewed. It is no longer perpendicular to the vector connecting the means, owing to the covariance-induced coordinate rotation and scaling.
*   **Case 2: Unequal Covariances ($\mathbf{\Sigma}_1 \neq \mathbf{\Sigma}_2$)**
    *   *Parameters*: $\boldsymbol{\mu}_1 = [1, 1]^T$, $\boldsymbol{\mu}_2 = [3.5, 3.5]^T$, $\mathbf{\Sigma}_1 = \begin{bmatrix} 1.0 & 0 \\ 0 & 1.0 \end{bmatrix}$, $\mathbf{\Sigma}_2 = \begin{bmatrix} 3.0 & 1.2 \\ 1.2 & 2.0 \end{bmatrix}$.
    *   *Result*: The quadratic terms do not cancel out. The resulting decision boundary is quadratic (non-linear), taking the shape of a hyperbola or parabola partitioning the feature space.

---

### Project 2: Nemo Image Segmentation via Bayesian Decision & Density Estimation

This project performs pixel-level semantic segmentation to identify "Nemo fish" body pixels (orange/white stripes) against complex underwater backgrounds. It contrasts parametric and non-parametric density estimation methods.

#### 1. Parametric Approach (Gaussian Density Estimation)
Assuming class-conditional densities follow multivariate Gaussian distributions, we fit parametric models:
*   **Orange vs. White Classification**: Distinguishes the two colors on the fish body.
*   **Fish vs. Background Classification**: Classifies pixels as fish or background using Gray/RGB distributions.
*   Parameters $(\boldsymbol{\mu}_i, \mathbf{\Sigma}_i)$ are estimated using Maximum Likelihood Estimation (MLE) from normalized sample data (`array_sample.mat`).

#### 2. Non-Parametric Approach (Parzen Window & k-NN)
When the underlying distributions are highly non-Gaussian, non-parametric approaches are employed:
*   **Parzen Window Estimation**: Uses hypercubic or Gaussian kernel functions to accumulate probability densities locally:
    $$p(\mathbf{x}) = \frac{1}{N V_N} \sum_{i=1}^{N} \varphi\left(\frac{\mathbf{x} - \mathbf{x}_i}{h_N}\right)$$
    The checked ParzenkNN.m sets a fixed bandwidth $h = 0.08$; there is no automatic bandwidth search.
*   **k-Nearest Neighbor (k-NN) Density Estimation**: Varies the volume of the local neighborhood to include exactly $k$ nearest training samples (e.g., $k = 15$):
    $$p(\mathbf{x}) = \frac{k}{N V(\mathbf{x})}$$

#### 3. Post-Processing (Connected Area Filtering)
To suppress isolated pixel noise in the segmented image, a morphological post-processing technique is implemented in `NonParametric_Nemo.m`. By using connected component analysis, tiny scattered noise segments are filtered out based on area thresholds, leaving only the primary Nemo fish body.

---

### Project 3: SVM Face Detection based on LIBSVM

This project builds a binary face detector (Face vs. Non-Face) using Support Vector Machines (SVM) via the compiled MATLAB interfaces of the `LIBSVM` library.

#### 1. Formulations & Kernel Functions
Support Vector Machines compute a separating hyperplane that maximizes the margin between classes. The following kernel formulas are theoretical references; the named toy script is missing. The available face-classification script uses RBF C-SVC with grid search and five-fold cross-validation:
*   **Linear SVM**: Suitable for linearly separable datasets, defining the boundary as:
    $$\mathbf{w}^T \mathbf{x} + b = 0$$
*   **Radial Basis Function (RBF) Kernel SVM**: Maps the inputs into an infinite-dimensional Hilbert space to handle complex non-linear structures:
    $$K(\mathbf{x}_i, \mathbf{x}_j) = \exp(-\gamma \|\mathbf{x}_i - \mathbf{x}_j\|^2)$$
    Hyperparameters $C$ (penalty factor) and $\gamma$ (gamma) are optimized to avoid underfitting and overfitting.

#### 2. Face Detection & Feature Scaling
The file `SVM_Face_Classification.m` trains a classifier on high-dimensional gray pixel vectors (size $N \times 361$).
*   **Feature Scaling**: Because SVM is highly sensitive to the scale of input features, pixel intensities are normalized from $[0, 255]$ to the range $[-1, 1]$. Normalization prevents features with large numeric ranges from dominating the optimization process, ensuring fast gradient convergence and avoiding numerical instability during solver execution.
*   **Results**: The resulting model classifies target face matrices, writing image IDs and predicted labels to `task3_result.txt`; that file is not an accuracy report.

<a id="unavailable-references"></a>

## Unavailable references

Items marked **not archived** are names from earlier course documentation that were not located in this repository. They are not runnable entry points or evidence of a completed experiment. Use the existing source links and files; reports, models or data still need their original version before reproduction.
