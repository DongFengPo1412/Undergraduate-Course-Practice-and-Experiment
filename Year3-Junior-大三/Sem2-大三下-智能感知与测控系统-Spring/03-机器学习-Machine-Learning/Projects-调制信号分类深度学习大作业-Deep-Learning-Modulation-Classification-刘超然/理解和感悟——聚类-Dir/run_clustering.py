import matplotlib.pyplot as plt
import numpy as np
from sklearn.datasets import make_moons
from sklearn.cluster import KMeans, DBSCAN
import os

# Configure matplotlib for headless environment
import matplotlib
matplotlib.use('Agg')

# Use Times New Roman for all text elements in matplotlib
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.serif'] = ['Times New Roman', 'DejaVu Serif', 'Liberation Serif']
plt.rcParams['font.size'] = 10

def main():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    
    # 1. Generate Crescent (Moon) Dataset
    X, y = make_moons(n_samples=300, noise=0.08, random_state=42)
    
    # 2. Fit K-means
    kmeans = KMeans(n_clusters=2, random_state=42)
    labels_kmeans = kmeans.fit_predict(X)
    
    # 3. Fit DBSCAN
    dbscan = DBSCAN(eps=0.2, min_samples=5)
    labels_dbscan = dbscan.fit_predict(X)
    
    # 4. Plot comparison side-by-side
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 4.5))
    
    # K-means Plot
    scatter1 = ax1.scatter(X[:, 0], X[:, 1], c=labels_kmeans, cmap='coolwarm', edgecolors='k', s=40, alpha=0.8)
    ax1.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], c='yellow', marker='*', s=150, edgecolors='black', label='Centroids')
    ax1.set_title('K-means Clustering (Prototype-based)', fontsize=11, fontweight='bold')
    ax1.grid(True, linestyle=':', alpha=0.5)
    ax1.set_xlabel('Feature 1')
    ax1.set_ylabel('Feature 2')
    ax1.legend(loc='upper right')
    
    # DBSCAN Plot
    scatter2 = ax2.scatter(X[:, 0], X[:, 1], c=labels_dbscan, cmap='coolwarm', edgecolors='k', s=40, alpha=0.8)
    ax2.set_title('DBSCAN Clustering (Density-based)', fontsize=11, fontweight='bold')
    ax2.grid(True, linestyle=':', alpha=0.5)
    ax2.set_xlabel('Feature 1')
    ax2.set_ylabel('Feature 2')
    
    plt.tight_layout()
    plot_path = os.path.join(current_dir, "clustering_comparison.png")
    plt.savefig(plot_path, dpi=150)
    plt.close()
    print(f"Clustering comparison plot successfully generated and saved to {plot_path}")

if __name__ == "__main__":
    main()
