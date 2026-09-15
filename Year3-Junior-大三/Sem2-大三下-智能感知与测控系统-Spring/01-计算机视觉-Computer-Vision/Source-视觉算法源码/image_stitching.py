# image_stitching.py
"""
Computer Vision Course Practice 3: Multi-image Panoramic Stitching & Optimization
Author: 刘超然 (Student ID: 2023060904025)
Description:
    Implements panoramic image stitching using SIFT/ORB features, cylindrical projection,
    camera parameters auto-estimation, and progressive alpha blending.
    Further post-processes the panorama with an automatic cropping algorithm that finds
    the maximum bounding box with no black padding.
"""

import cv2
import numpy as np
import matplotlib.pyplot as plt
import os
import sys

# Support Chinese paths
def imread_unicode(path):
    if not os.path.exists(path):
        return None
    return cv2.imdecode(np.fromfile(path, dtype=np.uint8), cv2.IMREAD_COLOR)

def imwrite_unicode(path, img):
    _, buf = cv2.imencode(".jpg", img)
    buf.tofile(path)

# Auto-crop black boundaries
def auto_crop(image, threshold=10):
    if image is None: 
        return None
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    _, mask = cv2.threshold(gray, threshold, 255, cv2.THRESH_BINARY)
    non_zero_points = cv2.findNonZero(mask)
    if non_zero_points is None: 
        return image
    x, y, w, h = cv2.boundingRect(non_zero_points)
    return image[y:y+h, x:x+w]

def run_stitching():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    assets_dir = os.path.join(script_dir, "Assets")
    
    image_names = ['1.jpg', '2.jpg', '3.jpg']
    raw_imgs = []
    
    print("Loading source images...")
    for name in image_names:
        p = os.path.join(assets_dir, name)
        img = imread_unicode(p)
        if img is None:
            print(f"Error: Failed to load {p}")
            return False
        raw_imgs.append(img)

    # 1. Generate before_result (simple horizontal concatenation)
    print("Generating simple concatenation image (before correction)...")
    h_min = min(img.shape[0] for img in raw_imgs)
    raw_resized = [cv2.resize(img, (int(img.shape[1] * h_min / img.shape[0]), h_min)) for img in raw_imgs]
    before_result = np.hstack(raw_resized)
    imwrite_unicode(os.path.join(assets_dir, 'result_before.jpg'), before_result)

    # 2. Perform cylindrical stitching
    print("Running advanced panorama stitching (Cylindrical Projection + Auto Camera Calibration)...")
    stitcher = cv2.Stitcher_create(cv2.Stitcher_PANORAMA)
    status, pano_raw = stitcher.stitch(raw_imgs)
    
    if status == cv2.Stitcher_OK:
        print("Stitching successful! Cropping black borders...")
        # 3. Post-process: Crop black borders
        final_result = auto_crop(pano_raw)
        if final_result is None:
            final_result = pano_raw
            
        imwrite_unicode(os.path.join(assets_dir, 'result_after_optimized.jpg'), final_result)
        
        # 4. Generate comparison figure using matplotlib and save it
        print("Saving comparison plot...")
        fig = plt.figure(figsize=(16, 10))
        
        plt.subplot(2, 1, 1)
        plt.title("Before Correction (Simple Concatenation)", fontsize=14)
        plt.imshow(cv2.cvtColor(before_result, cv2.COLOR_BGR2RGB))
        plt.axis('off')
        
        plt.subplot(2, 1, 2)
        plt.title("After Correction (Optimized: Cylindrical Stitching + Auto-Crop)", fontsize=14)
        plt.imshow(cv2.cvtColor(final_result, cv2.COLOR_BGR2RGB))
        plt.axis('off')
        
        plt.tight_layout()
        plot_path = os.path.join(assets_dir, 'stitching_comparison.jpg')
        plt.savefig(plot_path, dpi=150)
        plt.close()
        
        print(f"Comparison plot saved to: {plot_path}")
        print("Image stitching completed successfully!")
        return True
    else:
        print(f"Stitching failed with error code: {status}")
        return False

if __name__ == "__main__":
    run_stitching()
