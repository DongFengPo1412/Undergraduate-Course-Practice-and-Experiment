# predict_classifier.py
import torch
import torch.nn as nn
from torchvision import transforms
from PIL import Image
import os
import sys

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
        return
        
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
        return
        
    image = Image.open(image_path)
    image_tensor = transform(image).unsqueeze(0).to(device)
    
    with torch.no_grad():
        output = model(image_tensor)
        probabilities = torch.softmax(output, dim=1)
        confidence, predicted_idx = torch.max(probabilities, 1)
        
    pred_class = classes[predicted_idx.item()]
    print(f"Predicted Modulation: {pred_class} (Confidence: {confidence.item()*100:.2f}%)")
    return pred_class

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python predict_classifier.py <path_to_constellation_image>")
        # Default test prediction if no arg is given
        test_img = os.path.join(os.path.dirname(__file__), "dataset", "BPSK", "0dB_1.png")
        if os.path.exists(test_img):
            print(f"Testing default image: {test_img}")
            predict(test_img)
    else:
        predict(sys.argv[1])
