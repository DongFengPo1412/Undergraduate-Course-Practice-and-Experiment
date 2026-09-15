# Machine Learning (机器学习) - Academic Portfolio

This repository contains the academic portfolio for the **Machine Learning (机器学习)** course completed by **Chaoran Liu (刘超然)**. The portfolio is structured into two main machine learning projects implemented from scratch using the **PyTorch** framework: one image classification task utilizing a Convolutional Neural Network (CNN), and one tabular regression task utilizing a Multi-Layer Perceptron (MLP).

---

## Portfolio Navigation

- 📁 **[Project 1: Constellation Classification for Modulation Recognition](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification)**
  - 📄 [CNN Model Training Script](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification/src/train_classifier.py)
  - 📄 [Constellation Inference Predictor](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification/src/predict_classifier.py)
  - 📄 [Trained CNN Model Weights](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification/src/modulation_model.pth)
  - 📁 [Constellation Image Dataset](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification/src/dataset)
  - 📄 [Chinese Academic Report (PDF)](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification/docs/Modulation_Classification_Report.pdf)
  - 🖼️ [Training Loss & Accuracy Curves](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project1-Modulation-Classification/docs/training_curves.png)
- 📁 **[Project 2: Data-Driven Battery SOH Estimation via MLP Regression](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project2-Battery-SOH-Regression)**
  - 📄 [MLP Regressor Training Script](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project2-Battery-SOH-Regression/src/battery_soh_regressor.py)
  - 📄 [Trained Regressor Model Weights](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project2-Battery-SOH-Regression/src/battery_model.pth)
  - 📁 [Battery Aging Excel Datasets](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project2-Battery-SOH-Regression/src/CLACEdata)
  - 📄 [Chinese Academic Report (PDF)](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project2-Battery-SOH-Regression/docs/Lithium_Battery_SOH_Estimation_Report.pdf)
  - 🖼️ [Battery SOH Prediction vs. Ground Truth Decay Plot](file:///C:/Users/Liu/Desktop/大学文件/academic-portfolio/Machine-Learning/Project2-Battery-SOH-Regression/docs/soh_prediction_fit.png)

---

## Detailed Project Descriptions

### Project 1: Constellation Classification for Modulation Recognition

This project implements a Convolutional Neural Network (CNN) in PyTorch to identify signal modulation modes ('QPSK', 'PAM4', 'QAM64', 'QAM16', '8PSK', 'BPSK') from distorted constellation diagrams under different signal-to-noise ratio (SNR) conditions.

#### 1. Data Preprocessing
- **Dimension Reduction**: Raw 640x480 RGBA constellation images are converted to single-channel Grayscale images to retain only spatial distributions of the constellation points.
- **Resizing & Normalization**: Resized to $64 \times 64$ pixels and normalized to a range of $[-1.0, 1.0]$ to optimize gradient updates.

#### 2. CNN Architecture
The model `ConstellationCNN` is constructed with three feature-extraction conv-pooling blocks followed by a fully-connected classifier:
- **Block 1**: Conv2D (1 $\to$ 16 channels, kernel $3 \times 3$, pad 1), ReLU, MaxPool2D ($2 \times 2$) $\to$ $32 \times 32$ shape.
- **Block 2**: Conv2D (16 $\to$ 32 channels, kernel $3 \times 3$, pad 1), ReLU, MaxPool2D ($2 \times 2$) $\to$ $16 \times 16$ shape.
- **Block 3**: Conv2D (32 $\to$ 64 channels, kernel $3 \times 3$, pad 1), ReLU, MaxPool2D ($2 \times 2$) $\to$ $8 \times 8$ shape.
- **Classifier**: Flatten, Linear (4096 $\to$ 128 nodes), ReLU, Dropout ($p=0.3$ to prevent overfitting), Linear (128 $\to$ 6 class logits).

#### 3. Training and Results
- **Splits & Parameters**: Randomly partitioned 3000 images into 80% train (2400) and 20% test (600). Trained using Adam optimizer ($lr=0.001$), Cross-Entropy Loss, Batch Size = 64, for 8 epochs.
- **Performance**: The classifier starts at 58.33% accuracy in epoch 1 and reaches a final test accuracy of **80.83%** by epoch 8, demonstrating robust classification capabilities even under severe phase and frequency distortion.

---

### Project 2: Data-Driven Battery SOH Estimation via MLP Regression

This project builds a regression framework using a Multi-Layer Perceptron (MLP) in PyTorch to estimate the State of Health (SOH) of Lithium-ion batteries.

#### 1. Health Factors (Features)
Four indirect health features are extracted from Excel cycling datasets:
1. `cc_duration`: Constant current charging duration (declines as cell internal resistance increases).
2. `cv_duration`: Constant voltage charging duration.
3. `timeInterval`: Total duration of the charging cycle.
4. `ica_max`: Differential capacity peak value ($dQ/dV_{max}$), indicating loss of active electrode materials.
Features are normalized using Min-Max scaling to range $[0.0, 1.0]$.

#### 2. MLP Architecture
The regressor `BatteryMLP` consists of an input layer, three hidden layers, and an output layer:
- **Input**: 4 feature nodes.
- **Hidden Layer 1**: Linear (4 $\to$ 64 nodes), ReLU.
- **Hidden Layer 2**: Linear (64 $\to$ 32 nodes), ReLU.
- **Hidden Layer 3**: Linear (32 $\to$ 16 nodes), ReLU.
- **Output**: Linear (16 $\to$ 1 SOH prediction logit).

#### 3. Training & Rigorous Evaluation
- **Cross-Battery Validation**: To evaluate real-world generalization, the model was trained on all cycles from CS2 (33-38) and CX2_34 batteries (7117 samples) and validated on an entirely unseen test battery **CX2_36** (1913 samples) over its entire lifespan.
- **Hyperparameters**: Trained using Adam ($lr=0.005$) and MSE Loss for 2000 epochs.
- **Evaluation Metrics on CX2_36**:
  - **Mean Squared Error (MSE)**: $0.000453$ (0.045% error variance)
  - **Mean Absolute Error (MAE)**: $0.009470$ (<1.0% absolute average error)
  - **R-squared ($R^2$) Score**: $0.9768$ (indicates the model explains 97.68% of the degradation variance)
- **Discussion**: The SOH predicted trajectory tightly tracks the actual SOH decay curve, showing exceptional capability in capture of non-linear degradation accelerations at end-of-life cycles.
