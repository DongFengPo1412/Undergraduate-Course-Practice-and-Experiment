# camera_undistort.py
"""
Computer Vision Course Practice 2: Camera Calibration & Lens Undistortion
Author: 刘超然 (Student ID: 2023060904025)
Description:
    Demonstrates camera lens distortion modeling and correction.
    Simulates checkerboard grid lens distortion (barrel distortion) and applies
    OpenCV's camera calibration model to undistort it, showing a clear visual comparison.
"""

import cv2
import numpy as np
import os
import sys

def draw_checkerboard(width=600, height=600, square_size=60):
    """Generates a perfect black-and-white checkerboard image."""
    img = np.zeros((height, width), dtype=np.uint8)
    for y in range(0, height, square_size):
        for x in range(0, width, square_size):
            if (x // square_size + y // square_size) % 2 == 0:
                img[y:y+square_size, x:x+square_size] = 255
    return cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)

def distort_image(img, k1=-0.2, k2=0.05, p1=0.0, p2=0.0):
    """Artificially distorts an image using radial and tangential coefficients."""
    h, w = img.shape[:2]
    # Camera matrix
    f = max(h, w) * 0.8
    cx, cy = w / 2, h / 2
    camera_matrix = np.array([[f, 0, cx], [0, f, cy], [0, 0, 1]], dtype=np.float32)
    dist_coeffs = np.array([k1, k2, p1, p2, 0.0], dtype=np.float32)
    
    # Map coordinates
    mapx, mapy = cv2.initUndistortRectifyMap(camera_matrix, dist_coeffs, None, camera_matrix, (w, h), cv2.CV_32FC1)
    
    # Remap is the reverse mapping, so to DISTORT an image we need to warp it.
    # Note: OpenCV initUndistortRectifyMap maps from undistorted to distorted (which is what we want for backward mapping).
    distorted = cv2.remap(img, mapx, mapy, cv2.INTER_LINEAR)
    return distorted, camera_matrix, dist_coeffs

def run_undistort_demo():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    assets_dir = os.path.join(script_dir, "Assets")
    
    # 1. Simulate on a checkerboard grid
    grid = draw_checkerboard(600, 600, 60)
    
    # Apply barrel distortion (k1 < 0) typical of mobile phones
    k1, k2 = -0.25, 0.05
    distorted_grid, camera_matrix, dist_coeffs = distort_image(grid, k1, k2)
    
    # Correct (undistort) using OpenCV
    undistorted_grid = cv2.undistort(distorted_grid, camera_matrix, dist_coeffs)
    
    # Save simulated grid results
    _, buf = cv2.imencode(".jpg", distorted_grid)
    buf.tofile(os.path.join(assets_dir, "distorted_grid.jpg"))
    _, buf = cv2.imencode(".jpg", undistorted_grid)
    buf.tofile(os.path.join(assets_dir, "undistorted_grid.jpg"))
    
    print("Simulated checkerboard distortion and correction completed!")

    # 2. Perform lens undistortion on real image 1.jpg
    real_path = os.path.join(assets_dir, "1.jpg")
    if os.path.exists(real_path):
        real_img = cv2.imdecode(np.fromfile(real_path, dtype=np.uint8), cv2.IMREAD_COLOR)
        if real_img is not None:
            h, w = real_img.shape[:2]
            # Use typical smartphone lens parameters
            f = max(h, w) * 0.95
            cx, cy = w / 2, h / 2
            K = np.array([[f, 0, cx], [0, f, cy], [0, 0, 1]], dtype=np.float32)
            # Simulated minor barrel distortion correction
            D = np.array([-0.05, 0.01, 0.0, 0.0, 0.0], dtype=np.float32)
            
            undistorted_real = cv2.undistort(real_img, K, D)
            
            # Save real image comparison
            _, buf = cv2.imencode(".jpg", undistorted_real)
            buf.tofile(os.path.join(assets_dir, "undistorted_real.jpg"))
            print("Real image camera undistortion completed!")
        else:
            print("Failed to read 1.jpg for real undistortion.")
    else:
        print("1.jpg not found for real undistortion.")

if __name__ == "__main__":
    run_undistort_demo()
