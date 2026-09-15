import torch
import torch.nn as nn
from torchvision import transforms
from PIL import Image
import os
import sys

# Define model structure matching scratch_train_classifier.py
class ConstellationCNN(nn.Module):
    def __init__(self, num_classes=6):
        super(ConstellationCNN, self).__init__()
        self.features = nn.Sequential(
            nn.Conv2d(1, 16, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),
            nn.Conv2d(16, 32, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),
            nn.Conv2d(32, 64, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2)
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

def predict(image_path):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    current_dir = os.path.dirname(os.path.abspath(__file__))
    model_path = os.path.join(current_dir, "modulation_model.pth")
    
    classes = ['8PSK', 'BPSK', 'PAM4', 'QAM16', 'QAM64', 'QPSK']
    
    if not os.path.exists(model_path):
        print(f"Model file not found: {model_path}")
        return None, 0.0
        
    model = ConstellationCNN(num_classes=len(classes)).to(device)
    model.load_state_dict(torch.load(model_path, map_location=device))
    model.eval()
    
    transform = transforms.Compose([
        transforms.Grayscale(num_output_channels=1),
        transforms.Resize((64, 64)),
        transforms.ToTensor(),
        transforms.Normalize((0.5,), (0.5,))
    ])
    
    if not os.path.exists(image_path):
        print(f"Image not found: {image_path}")
        return None, 0.0
        
    image = Image.open(image_path)
    image_tensor = transform(image).unsqueeze(0).to(device)
    
    with torch.no_grad():
        output = model(image_tensor)
        probabilities = torch.softmax(output, dim=1)
        confidence, predicted_idx = torch.max(probabilities, 1)
        
    pred_class = classes[predicted_idx.item()]
    conf = confidence.item() * 100.0
    print(f"Image: {os.path.basename(image_path)} | Predicted: {pred_class} | Confidence: {conf:.2f}%")
    return pred_class, conf

if __name__ == "__main__":
    if len(sys.argv) > 1:
        predict(sys.argv[1])
    else:
        # Default test predictions for verification (pick a few representative files from original dataset)
        test_base = r"C:\Users\Liu\Desktop\大三下学期文件\机器学习\分类作业\dataset"
        test_cases = [
            ("BPSK", "10dB_10.png"),
            ("QPSK", "14dB_25.png"),
            ("QAM16", "18dB_5.png")
        ]
        
        print("Running default prediction cases for verification...")
        results = []
        for class_name, img_name in test_cases:
            img_path = os.path.join(test_base, class_name, img_name)
            if os.path.exists(img_path):
                pred, conf = predict(img_path)
                results.append({
                    "class": class_name,
                    "file": img_name,
                    "predicted": pred,
                    "confidence": conf
                })
            else:
                print(f"Test case file not found: {img_path}")
                
        # Write results to verification_results.json for the report script to consume
        with open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "verification_results.json"), 'w', encoding='utf-8') as f:
            import json
            json.dump(results, f, indent=4, ensure_ascii=False)
