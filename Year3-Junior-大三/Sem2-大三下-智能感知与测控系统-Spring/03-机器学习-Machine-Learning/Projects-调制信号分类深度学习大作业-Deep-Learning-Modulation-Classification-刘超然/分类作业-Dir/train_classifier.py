import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms
from torch.utils.data import DataLoader, random_split
import os
import matplotlib.pyplot as plt
import numpy as np
import json

# Use Agg backend for matplotlib to avoid GUI requirements
import matplotlib
matplotlib.use('Agg')

# Set random seeds for reproducibility
torch.manual_seed(42)
np.random.seed(42)

class ConstellationCNN(nn.Module):
    def __init__(self, num_classes=6):
        super(ConstellationCNN, self).__init__()
        self.features = nn.Sequential(
            # Conv block 1
            nn.Conv2d(1, 16, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2), # Output: 16 x 32 x 32
            
            # Conv block 2
            nn.Conv2d(16, 32, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2), # Output: 32 x 16 x 16
            
            # Conv block 3
            nn.Conv2d(32, 64, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2)  # Output: 64 x 8 x 8
        )
        self.classifier = nn.Sequential(
            nn.Linear(64 * 8 * 8, 128),
            nn.ReLU(),
            nn.Dropout(0.3),
            nn.Linear(128, num_classes)
        )
        
    def forward(self, x):
        x = self.features(x)
        x = x.view(x.size(0), -1)
        x = self.classifier(x)
        return x

def calculate_metrics(y_true, y_pred, classes):
    num_classes = len(classes)
    metrics = {}
    
    # Initialize confusion matrix
    cm = np.zeros((num_classes, num_classes), dtype=int)
    for t, p in zip(y_true, y_pred):
        cm[t, p] += 1
        
    total_samples = len(y_true)
    overall_accuracy = np.sum(np.diag(cm)) / total_samples if total_samples > 0 else 0
    
    class_reports = []
    macro_precision = 0.0
    macro_recall = 0.0
    macro_f1 = 0.0
    
    weighted_precision = 0.0
    weighted_recall = 0.0
    weighted_f1 = 0.0
    
    for i in range(num_classes):
        tp = cm[i, i]
        fp = np.sum(cm[:, i]) - tp
        fn = np.sum(cm[i, :]) - tp
        support = np.sum(cm[i, :])
        
        precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
        recall = tp / (tp + fn) if (tp + fn) > 0 else 0.0
        f1 = 2 * precision * recall / (precision + recall) if (precision + recall) > 0 else 0.0
        
        class_reports.append({
            "class": classes[i],
            "precision": float(precision),
            "recall": float(recall),
            "f1_score": float(f1),
            "support": int(support)
        })
        
        macro_precision += precision
        macro_recall += recall
        macro_f1 += f1
        
        weighted_precision += precision * support
        weighted_recall += recall * support
        weighted_f1 += f1 * support
        
    macro_precision /= num_classes
    macro_recall /= num_classes
    macro_f1 /= num_classes
    
    weighted_precision /= total_samples
    weighted_recall /= total_samples
    weighted_f1 /= total_samples
    
    metrics = {
        "overall_accuracy": float(overall_accuracy),
        "class_reports": class_reports,
        "macro_avg": {
            "precision": float(macro_precision),
            "recall": float(macro_recall),
            "f1_score": float(macro_f1),
            "support": int(total_samples)
        },
        "weighted_avg": {
            "precision": float(weighted_precision),
            "recall": float(weighted_recall),
            "f1_score": float(weighted_f1),
            "support": int(total_samples)
        },
        "confusion_matrix": cm.tolist()
    }
    return metrics

def plot_confusion_matrix(cm_list, classes, save_path):
    cm = np.array(cm_list)
    fig, ax = plt.subplots(figsize=(6, 5))
    im = ax.imshow(cm, interpolation='nearest', cmap=plt.cm.Blues)
    ax.figure.colorbar(im, ax=ax)
    
    # Labels
    ax.set(xticks=np.arange(cm.shape[1]),
           yticks=np.arange(cm.shape[0]),
           xticklabels=classes, yticklabels=classes,
           title='Confusion Matrix (测试集混淆矩阵)',
           ylabel='True Label (真实类别)',
           xlabel='Predicted Label (预测类别)')
    
    # Rotate tick labels
    plt.setp(ax.get_xticklabels(), rotation=45, ha="right", rotation_mode="anchor")
    
    # Loop over data dimensions and create text annotations.
    thresh = cm.max() / 2.
    for i in range(cm.shape[0]):
        for j in range(cm.shape[1]):
            ax.text(j, i, format(cm[i, j], 'd'),
                    ha="center", va="center",
                    color="white" if cm[i, j] > thresh else "black")
            
    fig.tight_layout()
    plt.savefig(save_path, dpi=150, bbox_inches='tight')
    plt.close()

def main():
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")
    
    current_dir = os.path.dirname(os.path.abspath(__file__))
    dataset_dir = r"C:\Users\Liu\Desktop\大三下学期文件\机器学习\分类作业\dataset"
    
    # Image preprocessing pipeline
    transform = transforms.Compose([
        transforms.Grayscale(num_output_channels=1),
        transforms.Resize((64, 64)),
        transforms.ToTensor(),
        transforms.Normalize((0.5,), (0.5,))
    ])
    
    if not os.path.exists(dataset_dir):
        print(f"Dataset directory not found: {dataset_dir}")
        return
        
    dataset = datasets.ImageFolder(root=dataset_dir, transform=transform)
    classes = dataset.classes
    print(f"Found classes: {classes}")
    print(f"Total dataset size: {len(dataset)}")
    
    # Split dataset into train (80%) and test (20%)
    train_size = int(0.8 * len(dataset))
    test_size = len(dataset) - train_size
    train_dataset, test_dataset = random_split(dataset, [train_size, test_size])
    
    train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True)
    test_loader = DataLoader(test_dataset, batch_size=64, shuffle=False)
    
    model = ConstellationCNN(num_classes=len(classes)).to(device)
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    
    epochs = 10
    train_losses = []
    test_accs = []
    
    print("Training constellation classifier...")
    for epoch in range(epochs):
        model.train()
        running_loss = 0.0
        for images, labels in train_loader:
            images, labels = images.to(device), labels.to(device)
            
            optimizer.zero_grad()
            outputs = model(images)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()
            
            running_loss += loss.item() * images.size(0)
            
        epoch_loss = running_loss / len(train_loader.dataset)
        train_losses.append(epoch_loss)
        
        # Validation accuracy
        model.eval()
        correct = 0
        total = 0
        with torch.no_grad():
            for images, labels in test_loader:
                images, labels = images.to(device), labels.to(device)
                outputs = model(images)
                _, predicted = torch.max(outputs.data, 1)
                total += labels.size(0)
                correct += (predicted == labels).sum().item()
                
        test_acc = 100.0 * correct / total
        test_accs.append(test_acc)
        print(f"Epoch {epoch+1}/{epochs} - Loss: {epoch_loss:.4f} - Test Acc: {test_acc:.2f}%")
        
    print("Training completed!")
    
    # Save model weights in the scratch directory
    model_weights_path = os.path.join(current_dir, "modulation_model.pth")
    torch.save(model.state_dict(), model_weights_path)
    print(f"Model saved to {model_weights_path}")
    
    # Final evaluation to compute confusion matrix and detailed metrics
    model.eval()
    all_true = []
    all_pred = []
    with torch.no_grad():
        for images, labels in test_loader:
            images = images.to(device)
            outputs = model(images)
            _, predicted = torch.max(outputs.data, 1)
            all_true.extend(labels.numpy().tolist())
            all_pred.extend(predicted.cpu().numpy().tolist())
            
    metrics = calculate_metrics(all_true, all_pred, classes)
    
    # Save metrics to JSON file
    metrics_path = os.path.join(current_dir, "metrics.json")
    with open(metrics_path, 'w', encoding='utf-8') as f:
        json.dump(metrics, f, indent=4, ensure_ascii=False)
    print(f"Metrics saved to {metrics_path}")
    
    # Plot curves
    curves_path = os.path.join(current_dir, "training_curves.png")
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 4))
    
    ax1.plot(range(1, epochs+1), train_losses, 'r-o', linewidth=2, label='Training Loss')
    ax1.set_xlabel('Epoch (迭代轮次)', fontproperties="SimSun", fontsize=10)
    ax1.set_ylabel('Loss (损失值)', fontproperties="SimSun", fontsize=10)
    ax1.set_title('Training Loss Curve (训练损失曲线)', fontproperties="SimSun", fontsize=11, fontweight='bold')
    ax1.grid(True, linestyle='--', alpha=0.6)
    ax1.legend()
    for tick in ax1.get_xticklabels() + ax1.get_yticklabels():
        tick.set_fontname('Times New Roman')
        
    ax2.plot(range(1, epochs+1), test_accs, 'b-s', linewidth=2, label='Test Accuracy')
    ax2.set_xlabel('Epoch (迭代轮次)', fontproperties="SimSun", fontsize=10)
    ax2.set_ylabel('Accuracy (%) (准确率)', fontproperties="SimSun", fontsize=10)
    ax2.set_title('Test Accuracy Curve (测试准确率曲线)', fontproperties="SimSun", fontsize=11, fontweight='bold')
    ax2.grid(True, linestyle='--', alpha=0.6)
    ax2.legend()
    for tick in ax2.get_xticklabels() + ax2.get_yticklabels():
        tick.set_fontname('Times New Roman')
        
    plt.tight_layout()
    plt.savefig(curves_path, dpi=150)
    plt.close()
    print(f"Training curves saved to {curves_path}")
    
    # Plot confusion matrix
    cm_path = os.path.join(current_dir, "confusion_matrix.png")
    plot_confusion_matrix(metrics["confusion_matrix"], classes, cm_path)
    print(f"Confusion matrix saved to {cm_path}")

if __name__ == "__main__":
    main()
