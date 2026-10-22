# Course archive — Technical notes

[简体中文](technical-notes.zh-CN.md) · [English](technical-notes.en.md) · [日本語](technical-notes.ja.md) · [Overview](../README_EN.md)

## Versions, provenance, and rights

Original course files do not automatically constitute a completed system. Duplicate and later reorganized versions may coexist. Repairs in standalone projects in 2026 are not automatically backported here or proof of historical deployment.

## Maintenance scope

Signatures and paths identify 296 .vs indexes, precompiled headers, logs, COFF objects, debug databases, and incremental-link artifacts. Only index entries were removed; local bytes were checked with SHA-256. Simulation models, HDL, build configuration, reports, weights, images, and demos remain. The reorganized SOH entry point used undefined current_dir; that defect is repaired. Original train_regressor.py remains a separate historical version.

## Formula reference and remaining limitations

Panorama code calls OpenCV Stitcher rather than independently implementing every SIFT/ORB or camera optimizer. Incremental PID does not inherently prevent windup. Historic ML curves and numbers are not current reproduction results. SVM requires matching LIBSVM MATLAB interfaces and data; a missing toy-classification script is not a confirmed implementation.

[Reference formulas](reference-formulas.en.md)
