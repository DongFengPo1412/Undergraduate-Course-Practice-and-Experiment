# Course archive — Technical notes

[简体中文](technical-notes.zh-CN.md) · [English](technical-notes.en.md) · [日本語](technical-notes.ja.md) · [Overview](../README.md)

## 版本、来源与权利

原始课程文件不自动等于最终完成系统；同名副本和后补整理目录可能并存。独立项目的 2026 年修复不自动回写课程归档，也不证明历史演示使用过修复版。

## 明确的维护范围

296 个文件按签名与路径确认属于 .vs 索引、预编译头、日志、COFF 对象、调试数据库和增量链接产物；仅从索引移除，本地实物逐个 SHA-256 核对。仿真模型、HDL、编译配置、报告、权重、图片和演示文件保留。SOH 整理版曾在入口使用未定义的 current_dir，本轮修正；原始 train_regressor.py 作为另一历史版本保留。

## 数学参考与剩余限制

课程图像拼接调用 OpenCV Stitcher，并非全部自行实现 SIFT/ORB 或相机优化；增量 PID 不天然抗积分饱和。机器学习历史曲线和数值不作为本轮复现结果。SVM 脚本依赖匹配的 LIBSVM MATLAB 接口和数据；缺失的玩具分类脚本不再列为已确认实现。

[Reference formulas](reference-formulas.zh-CN.md)
