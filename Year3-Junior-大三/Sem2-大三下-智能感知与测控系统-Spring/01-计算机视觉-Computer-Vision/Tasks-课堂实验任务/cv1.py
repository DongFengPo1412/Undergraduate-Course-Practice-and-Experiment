import cv2
import numpy as np
import mediapipe as mp


def create_half_half_blend(original_path, style_path, output_path):
    # 1. 读取两张图片
    img_orig = cv2.imread("C:\\Users\\Administrator\\Desktop\\cv\\1\\origin.png")
    img_style = cv2.imread("C:\\Users\\Administrator\\Desktop\\cv\\1\\style.png")

    if img_orig is None or img_style is None:
        print("错误：无法读取图片，请检查路径。")
        return

    # 确保两张图片尺寸完全一致
    if img_orig.shape != img_style.shape:
        print("提示：两张图片尺寸不一致，将强制缩放风格图以匹配原图。")
        img_style = cv2.resize(img_style, (img_orig.shape[1], img_orig.shape[0]))

    h, w, channels = img_orig.shape

    # 2. 使用 MediaPipe 进行人脸检测，寻找人脸中轴线
    mp_face_detection = mp.solutions.face_detection
    center_x = w // 2  # 默认中位线（万一检测不到人脸时的备用方案）

    # 开启 MediaPipe 人脸检测
    with mp_face_detection.FaceDetection(model_selection=1, min_detection_confidence=0.5) as face_detection:
        # 转换 BGR 到 RGB (MediaPipe 需要 RGB)
        results = face_detection.process(cv2.cvtColor(img_orig, cv2.COLOR_BGR2RGB))

        if results.detections:
            # 提取第一个检测到的人脸
            detection = results.detections[0]
            bboxC = detection.location_data.relative_bounding_box

            # 计算人脸边界框的中心点 X 坐标
            # bboxC.xmin 是相对坐标 (0~1)，需要乘以宽度 w
            face_center_x = int((bboxC.xmin + bboxC.width / 2) * w)
            center_x = face_center_x
            print(f"成功检测到人脸，中位线 X 坐标: {center_x}")
        else:
            print("未检测到人脸，将使用图片几何中心作为分割线。")

    # 3. 创建掩膜 (Mask)
    # 创建一个全黑的掩膜（单通道）
    mask = np.zeros((h, w), dtype=np.float32)

    # 将左半边（或者人脸左半边）设置为 1（白色）
    # 如果你想左边是动漫/机械，右边是真人，可以调整这里
    mask[:, :center_x] = 1.0

    # 4. 羽化边缘（平滑过渡）
    # 使用高斯模糊让中轴线不要太生硬，产生渐变融合的效果
    # blur_size 越大，渐变区域越宽。必须是奇数。
    blur_size = int(w * 0.05)
    if blur_size % 2 == 0: blur_size += 1
    mask = cv2.GaussianBlur(mask, (blur_size, blur_size), 0)

    # 将单通道 Mask 扩展为 3 通道，以便与原图进行矩阵乘法
    mask_3d = np.stack([mask, mask, mask], axis=2)

    # 5. 图像融合 (Alpha Blending)
    # 公式: Result = Original * Mask + Style * (1 - Mask)
    # 注意数据类型转换为 float 进行运算，防止溢出，算完再转回 uint8
    img_orig_f = img_orig.astype(np.float32)
    img_style_f = img_style.astype(np.float32)

    # 假设：左半部分保留原图 (mask=1)，右半部分使用风格图 (mask=0)
    # 如果你想反过来，改成 img_style_f * mask_3d + img_orig_f * (1.0 - mask_3d)
    blended_f = img_orig_f * mask_3d + img_style_f * (1.0 - mask_3d)

    # 将结果限制在 0-255 并转回图片格式
    result = np.clip(blended_f, 0, 255).astype(np.uint8)

    # 6. 保存并展示结果
    cv2.imwrite(output_path, result)
    print(f"处理完成！合成图片已保存至: {output_path}")

    # (可选) 弹出窗口预览，按任意键关闭
    cv2.imshow("Result", result)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


# ================= 运行测试 =================
if __name__ == "__main__":
    # 请在这里替换为你的图片路径
    ORIGINAL_IMG = "original.jpg"  # 原图
    STYLE_IMG = "style.jpg"  # 风格图（如动漫或机械风）
    OUTPUT_IMG = "final_result.jpg"  # 输出合成图的名称

    create_half_half_blend(ORIGINAL_IMG, STYLE_IMG, OUTPUT_IMG)