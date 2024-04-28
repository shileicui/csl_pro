import os
import cv2
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler

def compute_features(image_paths):
    features = []
    for image_path in image_paths:
        img = cv2.imread(image_path)
        img = cv2.resize(img, (100, 100))
        img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        features.append(img.flatten())
    return np.array(features)

def cluster_images(features, num_clusters):
    kmeans = KMeans(n_clusters=num_clusters, random_state=0).fit(features)
    return kmeans.labels_

def move_images_to_folders(image_paths, labels, output_dir):
    for i, label in enumerate(labels):
        image_path = image_paths[i]
        folder_path = os.path.join(output_dir, f"cluster_{label}")
        if not os.path.exists(folder_path):
            os.makedirs(folder_path)
        os.rename(image_path, os.path.join(folder_path, os.path.basename(image_path)))

def classify_images(input_dir, output_dir, num_clusters):
    image_paths = [os.path.join(input_dir, f) for f in os.listdir(input_dir) if f.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.bmp'))]
    features = compute_features(image_paths)
    scaler = StandardScaler()
    scaled_features = scaler.fit_transform(features)
    labels = cluster_images(scaled_features, num_clusters)
    move_images_to_folders(image_paths, labels, output_dir)

if __name__ == "__main__":
    input_dir = "E:/pro/py/images"
    output_dir = "E:/pro/py/folder"
    num_clusters = 5  # 根据需要更改聚类数量
    classify_images(input_dir, output_dir, num_clusters)