# face_blend.py
"""
Computer Vision Course Practice 1: Terminator Style Face Blending
Author: 刘超然 (Student ID: 2023060904025)
Description:
    Detects the human face centerline using OpenCV Haar Cascade Classifier,
    and blends the original face photo with a robotic cyborg style image
    along the centerline using feathering alpha blending (Schwarzenegger Terminator style).
"""

import cv2
import numpy as np
import os
import sys

def create_half_half_blend(original_path, style_path, output_path):
    print(f"Reading original image from: {original_path}")
    print(f"Reading style image from: {style_path}")

    # Read images supporting Chinese paths on Windows
    if not os.path.exists(original_path) or not os.path.exists(style_path):
        print("Error: Input files do not exist.")
        return False

    img_orig = cv2.imdecode(np.fromfile(original_path, dtype=np.uint8), cv2.IMREAD_COLOR)
    img_style = cv2.imdecode(np.fromfile(style_path, dtype=np.uint8), cv2.IMREAD_COLOR)

    if img_orig is None:
        print("Error: Failed to read original image.")
        return False
    if img_style is None:
        print("Error: Failed to read style image.")
        return False

    # Force style image to match original size
    if img_orig.shape != img_style.shape:
        print("Resizing style image to match original size...")
        img_style = cv2.resize(img_style, (img_orig.shape[1], img_orig.shape[0]))

    h, w, channels = img_orig.shape
    center_x = w // 2  # Default to geometric center

    # Face detection using Haar Cascade
    cascade_path = cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
    face_cascade = cv2.CascadeClassifier(cascade_path)
    gray = cv2.cvtColor(img_orig, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.1, 4)

    if len(faces) > 0:
        # Use the first detected face to find the midline
        x, y, fw, fh = faces[0]
        face_center_x = x + fw // 2
        center_x = face_center_x
        print(f"Successfully detected face. Face center X: {center_x}")
    else:
        print("No face detected by Haar Cascade, defaulting to image geometric center.")

    # Create mask (1.0 for left half, 0.0 for right half)
    mask = np.zeros((h, w), dtype=np.float32)
    mask[:, :center_x] = 1.0

    # Feather edge with Gaussian blur for smooth transition
    blur_size = int(w * 0.1)
    if blur_size % 2 == 0:
        blur_size += 1
    mask = cv2.GaussianBlur(mask, (blur_size, blur_size), 0)

    # Convert mask to 3 channels
    mask_3d = np.stack([mask, mask, mask], axis=2)

    # Perform Alpha Blending
    # Left side (mask close to 1) gets original, right side (mask close to 0) gets style (cyborg)
    img_orig_f = img_orig.astype(np.float32)
    img_style_f = img_style.astype(np.float32)

    blended_f = img_orig_f * mask_3d + img_style_f * (1.0 - mask_3d)
    result = np.clip(blended_f, 0, 255).astype(np.uint8)

    # Save output supporting Chinese paths on Windows
    _, buf = cv2.imencode(".jpg", result)
    buf.tofile(output_path)
    print(f"Blending complete! Output saved to: {output_path}")
    return True

if __name__ == "__main__":
    # Setup relative paths
    script_dir = os.path.dirname(os.path.abspath(__file__))
    assets_dir = os.path.join(script_dir, "Assets")

    original_img = os.path.join(assets_dir, "input.jpg")
    style_img = os.path.join(assets_dir, "style_cyborg.jpg")
    output_img = os.path.join(assets_dir, "face_blend_result.jpg")

    success = create_half_half_blend(original_img, style_img, output_img)
    if success:
        print("Face blending executed successfully!")
    else:
        print("Face blending execution failed.")
