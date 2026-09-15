# image_inpainting.py
"""
Computer Vision Course Practice 1: Image Inpainting & Restoration
Author: 刘超然 (Student ID: 2023060904025)
Description:
    Implements digital image restoration. Specifically, detects scratches/noise on a corrupted image
    (represented as bright white pixels) and applies Fast Marching Method (FMM) to reconstruct
    the original pixel values based on neighboring texture.
"""

import cv2
import numpy as np
import os
import sys

def restore_image(corrupted_path, output_path):
    print(f"Reading corrupted image from: {corrupted_path}")
    
    if not os.path.exists(corrupted_path):
        print("Error: Input file does not exist.")
        return False

    # Read image supporting Chinese paths
    img_corrupted = cv2.imdecode(np.fromfile(corrupted_path, dtype=np.uint8), cv2.IMREAD_COLOR)
    if img_corrupted is None:
        print("Error: Failed to read corrupted image.")
        return False

    # Create mask of damaged regions (we know the noise/scratches were drawn in white [255, 255, 255])
    # Let's define pixels close to white as the mask (e.g. threshold > 240 in all channels)
    gray = cv2.cvtColor(img_corrupted, cv2.COLOR_BGR2GRAY)
    _, mask = cv2.threshold(gray, 250, 255, cv2.THRESH_BINARY)

    # Dilate the mask slightly to ensure we cover the edge of the scratches
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    mask = cv2.dilate(mask, kernel, iterations=1)

    # Apply inpainting (Telea's algorithm)
    print("Applying Telea's Image Inpainting algorithm...")
    inpainted = cv2.inpaint(img_corrupted, mask, inpaintRadius=5, flags=cv2.INPAINT_TELEA)

    # Save output supporting Chinese paths
    _, buf = cv2.imencode(".jpg", inpainted)
    buf.tofile(output_path)
    print(f"Restoration complete! Output saved to: {output_path}")
    return True

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    assets_dir = os.path.join(script_dir, "Assets")

    corrupted_img = os.path.join(assets_dir, "damaged_demo.jpg")
    output_img = os.path.join(assets_dir, "inpainting_result.jpg")

    success = restore_image(corrupted_img, output_img)
    if success:
        print("Image restoration executed successfully!")
    else:
        print("Image restoration execution failed.")
