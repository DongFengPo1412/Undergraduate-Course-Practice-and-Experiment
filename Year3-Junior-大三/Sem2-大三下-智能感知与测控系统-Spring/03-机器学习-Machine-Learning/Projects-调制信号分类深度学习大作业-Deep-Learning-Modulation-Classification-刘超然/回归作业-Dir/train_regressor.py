import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
import os
import matplotlib.pyplot as plt
import json

# Configure matplotlib for headless environment
import matplotlib
matplotlib.use('Agg')

# Set font family to Times New Roman for clean look
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.serif'] = ['Times New Roman', 'DejaVu Serif', 'Liberation Serif']
plt.rcParams['font.size'] = 10

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

def main():
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")
    
    current_dir = os.path.dirname(os.path.abspath(__file__))
    npz_path = os.path.join(current_dir, "battery_data.npz")
    
    if not os.path.exists(npz_path):
        print(f"NPZ data file not found: {npz_path}")
        return
        
    data = np.load(npz_path)
    X_train = data['X_train']
    y_train = data['y_train']
    X_test = data['X_test']
    y_test = data['y_test']
    
    print(f"Train set size: {X_train.shape[0]} samples")
    print(f"Test set size: {X_test.shape[0]} samples")
    
    # 1. Normalize features (MinMax scaling based on training set)
    X_min = X_train.min(axis=0)
    X_max = X_train.max(axis=0)
    X_range = X_max - X_min
    X_range[X_range == 0] = 1.0 # Prevent division by zero
    
    X_train_norm = (X_train - X_min) / X_range
    X_test_norm = (X_test - X_min) / X_range
    
    # Convert to tensors
    X_train_t = torch.tensor(X_train_norm, dtype=torch.float32).to(device)
    y_train_t = torch.tensor(y_train, dtype=torch.float32).unsqueeze(1).to(device)
    X_test_t = torch.tensor(X_test_norm, dtype=torch.float32).to(device)
    
    model = BatteryMLP().to(device)
    criterion = nn.MSELoss()
    optimizer = optim.Adam(model.parameters(), lr=0.005)
    
    # 2. Training loop
    epochs = 2000
    print("Training SOH Regressor MLP...")
    for epoch in range(epochs):
        model.train()
        optimizer.zero_grad()
        predictions = model(X_train_t)
        loss = criterion(predictions, y_train_t)
        loss.backward()
        optimizer.step()
        
        if (epoch + 1) % 200 == 0:
            print(f"Epoch {epoch+1}/{epochs} | Train MSE Loss: {loss.item():.6f}")
            
    print("Training completed!")
    
    # Save model weights and scaling parameters
    model_path = os.path.join(current_dir, "battery_model.pth")
    torch.save({
        'model_state_dict': model.state_dict(),
        'X_min': X_min.tolist(),
        'X_max': X_max.tolist()
    }, model_path)
    print(f"Model saved to {model_path}")
    
    # 3. Evaluation on test battery (unseen CX2_36)
    model.eval()
    with torch.no_grad():
        y_pred_t = model(X_test_t)
        y_pred = y_pred_t.squeeze().cpu().numpy()
        
    mse = float(np.mean((y_test - y_pred) ** 2))
    mae = float(np.mean(np.abs(y_test - y_pred)))
    
    # R-squared calculation
    y_test_mean = np.mean(y_test)
    ss_res = np.sum((y_test - y_pred) ** 2)
    ss_tot = np.sum((y_test - y_test_mean) ** 2)
    r2 = float(1.0 - (ss_res / ss_tot))
    
    print("\n" + "="*40)
    print("Test Evaluation on Battery CX2_36:")
    print(f"  MSE: {mse:.6f}")
    print(f"  MAE: {mae:.6f}")
    print(f"  R2 Score: {r2:.4f}")
    print("="*40)
    
    # Store metrics in JSON
    metrics = {
        "mse": mse,
        "mae": mae,
        "r2_score": r2,
        "test_sample_count": len(y_test)
    }
    
    # We will pick a few specific cycle indexes for verification in the report
    # e.g., cycle 100, cycle 500, cycle 1000
    verification_cycles = [100, 500, 1000]
    verifications = []
    for cycle in verification_cycles:
        if cycle < len(y_test):
            verifications.append({
                "cycle": cycle,
                "actual_soh": float(y_test[cycle]),
                "predicted_soh": float(y_pred[cycle]),
                "error": float(abs(y_test[cycle] - y_pred[cycle]))
            })
            
    metrics["verifications"] = verifications
    
    metrics_path = os.path.join(current_dir, "regression_metrics.json")
    with open(metrics_path, 'w', encoding='utf-8') as f:
        json.dump(metrics, f, indent=4, ensure_ascii=False)
    print(f"Metrics saved to {metrics_path}")
    
    # 4. Plot actual vs predicted SOH curve
    plt.figure(figsize=(7, 4.5))
    cycles = np.arange(1, len(y_test) + 1)
    plt.plot(cycles, y_test, 'k-', label='Actual SOH', linewidth=2)
    plt.plot(cycles, y_pred, 'r--', label='Predicted SOH (MLP)', linewidth=2)
    plt.xlabel('Battery Cycle')
    plt.ylabel('SOH (State of Health)')
    plt.title('SOH Estimation Results on Test Battery (CX2_36)', fontsize=11, fontweight='bold')
    plt.grid(True, linestyle=':', alpha=0.6)
    plt.legend(fontsize=9)
    plt.tight_layout()
    
    plot_path = os.path.join(current_dir, "soh_prediction_fit.png")
    plt.savefig(plot_path, dpi=150)
    plt.close()
    print(f"SOH Prediction fit plot saved to {plot_path}")

if __name__ == "__main__":
    main()
