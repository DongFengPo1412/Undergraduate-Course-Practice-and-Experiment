# scratch_train_regressor.py
import os
import openpyxl
import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
import matplotlib.pyplot as plt

# Configure matplotlib for headless environment
import matplotlib
matplotlib.use('Agg')

def load_battery_data(file_path):
    print(f"Loading battery data from {os.path.basename(file_path)}...")
    wb = openpyxl.load_workbook(file_path, read_only=True)
    sheet = wb.active
    
    # Read headers
    headers = [cell.value for cell in next(sheet.iter_rows(max_row=1))]
    # Map headers to indices
    cc_idx = headers.index('cc_duration')
    cv_idx = headers.index('cv_duration')
    time_idx = headers.index('timeInterval')
    ica_idx = headers.index('ica_max')
    soh_idx = headers.index('SOH')
    
    X = []
    y = []
    for row in sheet.iter_rows(min_row=2):
        vals = [cell.value for cell in row]
        if any(v is None for v in [vals[cc_idx], vals[cv_idx], vals[time_idx], vals[ica_idx], vals[soh_idx]]):
            continue
        X.append([vals[cc_idx], vals[cv_idx], vals[time_idx], vals[ica_idx]])
        y.append(vals[soh_idx])
        
    wb.close()
    return np.array(X, dtype=np.float32), np.array(y, dtype=np.float32)

def main():
    data_dir = os.path.join(current_dir, "CLACEdata")
    
    train_files = [
        "CS2_33.xlsx", "CS2_34.xlsx", "CS2_35.xlsx", 
        "CS2_36.xlsx", "CS2_37.xlsx", "CS2_38.xlsx",
        "CX2_34.xlsx"
    ]
    test_file = "CX2_36.xlsx"
    
    # 1. Load data
    X_train_list = []
    y_train_list = []
    
    for f in train_files:
        fp = os.path.join(data_dir, f)
        if os.path.exists(fp):
            X_f, y_f = load_battery_data(fp)
            X_train_list.append(X_f)
            y_train_list.append(y_f)
            
    X_train = np.vstack(X_train_list)
    y_train = np.concatenate(y_train_list)
    
    test_fp = os.path.join(data_dir, test_file)
    X_test, y_test = load_battery_data(test_fp)
    
    print(f"Train set size: {X_train.shape[0]} samples")
    print(f"Test set size: {X_test.shape[0]} samples")
    
    # 2. Normalize features (MinMax scaling)
    X_min = X_train.min(axis=0)
    X_max = X_train.max(axis=0)
    # Avoid division by zero
    X_range = X_max - X_min
    X_range[X_range == 0] = 1.0
    
    X_train_norm = (X_train - X_min) / X_range
    X_test_norm = (X_test - X_min) / X_range
    
    # 3. Create PyTorch datasets & dataloaders
    X_train_t = torch.tensor(X_train_norm, dtype=torch.float32)
    y_train_t = torch.tensor(y_train, dtype=torch.float32).unsqueeze(1)
    X_test_t = torch.tensor(X_test_norm, dtype=torch.float32)
    
    # 4. Define MLP architecture
    class BatteryMLP(nn.Module):
        def __init__(self):
            super(BatteryMLP, self).__init__()
            self.net = nn.Sequential(
                nn.Linear(4, 64),
                nn.ReLU(),
                nn.Linear(64, 32),
                nn.ReLU(),
                nn.Linear(32, 16),
                nn.ReLU(),
                nn.Linear(16, 1)
            )
        def forward(self, x):
            return self.net(x)
            
    model = BatteryMLP()
    criterion = nn.MSELoss()
    optimizer = optim.Adam(model.parameters(), lr=0.005)
    
    # 5. Training loop
    epochs = 2000
    print("Training SOH Regressor Neural Network...")
    for epoch in range(epochs):
        model.train()
        optimizer.zero_grad()
        predictions = model(X_train_t)
        loss = criterion(predictions, y_train_t)
        loss.backward()
        optimizer.step()
        
        if (epoch + 1) % 200 == 0:
            print(f"Epoch {epoch+1}/{epochs} | Training MSE Loss: {loss.item():.6f}")
            
    print("Training completed!")
    
    # Save model weights and scaling parameters
    torch.save({
        'model_state_dict': model.state_dict(),
        'X_min': X_min,
        'X_max': X_max
    }, "battery_model.pth")
    print("Model saved to battery_model.pth")
    
    # 6. Evaluation on test battery (unseen CX2_36)
    model.eval()
    with torch.no_grad():
        y_pred_t = model(X_test_t)
        y_pred = y_pred_t.squeeze().numpy()
        
    mse = np.mean((y_test - y_pred) ** 2)
    mae = np.mean(np.abs(y_test - y_pred))
    
    # R-squared calculation
    y_test_mean = np.mean(y_test)
    ss_res = np.sum((y_test - y_pred) ** 2)
    ss_tot = np.sum((y_test - y_test_mean) ** 2)
    r2 = 1.0 - (ss_res / ss_tot)
    
    print("\n" + "="*40)
    print("Test Evaluation on Battery CX2_36:")
    print(f"  Mean Squared Error (MSE): {mse:.6f}")
    print(f"  Mean Absolute Error (MAE): {mae:.6f}")
    print(f"  R-squared (R2) Score: {r2:.4f}")
    print("="*40)
    
    # 7. Plot actual vs predicted SOH decay curve
    plt.figure(figsize=(8, 5))
    cycles = np.arange(1, len(y_test) + 1)
    plt.plot(cycles, y_test, 'k-', label='Actual SOH', linewidth=2)
    plt.plot(cycles, y_pred, 'r--', label='Predicted SOH (MLP)', linewidth=2)
    plt.xlabel('Battery Cycle')
    plt.ylabel('SOH (State of Health)')
    plt.title('SOH Estimation Results on Test Battery (CX2\_36)', fontsize=12, fontweight='bold')
    plt.grid(True, linestyle=':', alpha=0.6)
    plt.legend(fontsize=10)
    plt.tight_layout()
    plt.savefig("soh_prediction_fit.png", dpi=150)
    plt.close()
    print("Plot saved to soh_prediction_fit.png")

if __name__ == "__main__":
    main()
