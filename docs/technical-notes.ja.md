# Course archive — Technical notes

[简体中文](technical-notes.zh-CN.md) · [English](technical-notes.en.md) · [日本語](technical-notes.ja.md) · [Overview](../README_JA.md)

## 版・出典・権利

授業ファイルの存在は完成システムを意味せず、複製版と後年整理版が共存する場合があります。独立プロジェクトの 2026 年の修正は自動的には反映せず、当時の導入の証明にもしません。

## 保守範囲

署名とパスから .vs 索引、プリコンパイル済みヘッダー、ログ、COFF オブジェクト、デバッグ DB、増分リンク生成物の 296 件を確認しました。索引だけを解除し、ローカルのバイト列を SHA-256 で照合。モデル、HDL、設定、レポート、重み、画像、デモを保持しました。整理版 SOH の current_dir 未定義を修正し、元の train_regressor.py は別の履歴版として保持しています。

## 参考式と残る制限

パノラマ処理は OpenCV Stitcher を利用し、SIFT/ORB やカメラ最適化を全て独自実装したものではありません。増分 PID に抗ワインドアップが自動で付くわけではありません。過去の ML 曲線・数値は今回の再現結果ではありません。SVM は対応する LIBSVM MATLAB API とデータに依存し、欠落した玩具分類スクリプトを実装済みとはしません。

[Reference formulas](reference-formulas.ja.md)
