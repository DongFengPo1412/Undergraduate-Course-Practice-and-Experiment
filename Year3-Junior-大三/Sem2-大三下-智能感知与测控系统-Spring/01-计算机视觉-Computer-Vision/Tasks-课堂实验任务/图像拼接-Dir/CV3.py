import cv2
import numpy as np
import matplotlib.pyplot as plt


# 自动裁剪黑边的函数
def auto_crop(image, threshold=10):
    """
    找到全景图中的非黑色最大内接矩形进行裁剪
    """
    if image is None: return None

    # 转为灰度
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # 阈值化，将所有非黑色区域（像素值>threshold）设为白(255)，其余黑(0)
    _, mask = cv2.threshold(gray, threshold, 255, cv2.THRESH_BINARY)

    # 找到所有非黑色区域的边界矩形
    non_zero_points = cv2.findNonZero(mask)
    if non_zero_points is None: return image
    x, y, w, h = cv2.boundingRect(non_zero_points)

    # 裁剪
    cropped = image[y:y + h, x:x + w]
    return cropped


# --- 主程序 ---

# 1. 读取原图 (确保 1.jpg 为左, 2.jpg 为中, 3.jpg 为右)
image_names = ['1.jpg', '2.jpg', '3.jpg']
raw_imgs = []
for name in image_names:
    img = cv2.imread(name)
    if img is None:
        print(f"错误：无法读取图片 {name}，请确保其位于脚本同一目录下。")
        exit()
    raw_imgs.append(img)

# 2. 生成“校正前”对比图 (简单的横向排列，保持与之前一致)
h_min = min(img.shape[0] for img in raw_imgs)
raw_resized = [cv2.resize(img, (int(img.shape[1] * h_min / img.shape[0]), h_min)) for img in raw_imgs]
before_result = np.hstack(raw_resized)

# 3. 执行优化后的“校正后”拼接 (使用高级全景模式，内置柱面投影和自动相机参数估算)
print("正在执行高级全景拼接（柱面投影 + 自动相机畸变校正）...")

# 创建 Stitcher 对象，指定为全景模式
# 注意：这需要 opencv-contrib-python 包
stitcher = cv2.Stitcher_create(cv2.Stitcher_PANORAMA)

# 运行拼接
status, pano_raw = stitcher.stitch(raw_imgs)

if status == cv2.Stitcher_OK:
    print("拼接成功！正在进行黑边裁剪...")

    # 4. 优化：自动裁剪黑边 (彻底解决“小”和不规则边缘问题)
    # 这个 final_result 就是我们要展示的“校正后”结果
    final_result = auto_crop(pano_raw)

    if final_result is None:
        final_result = pano_raw  # 裁剪失败则保留原图

    # 5. 结果展示与保存
    # 注意：结果会被拉伸得很宽，可以通过调整matplotlib画布尺寸来适应
    cv2.imwrite('result_before.jpg', before_result)
    cv2.imwrite('result_after_optimized.jpg', final_result)

    # 使用 Matplotlib 显示
    plt.figure(figsize=(16, 10))  # 设置更宽的画布尺寸

    plt.subplot(2, 1, 1)
    plt.title("Before Correction (Simple Concatenation)", fontsize=14)
    plt.imshow(cv2.cvtColor(before_result, cv2.COLOR_BGR2RGB))
    plt.axis('off')

    plt.subplot(2, 1, 2)
    plt.title("After Correction (Optimized: Cylindrical Stitching + Auto-Crop)", fontsize=14)
    # final_result 已经是裁剪后的，图像内容将占据主体
    plt.imshow(cv2.cvtColor(final_result, cv2.COLOR_BGR2RGB))
    plt.axis('off')

    plt.tight_layout()
    print("全部完成。请在打开的窗口中查看结果，或在目录下查看保存的图片。")
    plt.show()

else:
    print(f"拼接失败。错误代码：{status}")
    print("可能原因：图像之间没有足够的重叠（建议重叠度 > 30%），或者角度差过大。")
    exit()
