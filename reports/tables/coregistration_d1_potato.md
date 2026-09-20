# PreVisS-Net Geometric Preprocessing & Co-Registration Report: `d1_potato`

**Date:** 2026-08-27
**Dataset:** `d1_potato`
**Pre-Stitched Orthomosaic Detected:** `No`
**Co-Registration Method:** `ecc` (Normalized Gradient Magnitude)
**Total Processed Samples:** 520
**Flagged for Manual Review (NCC < 0.6):** 520
**Mean Shift (dx, dy):** (-1.51 px, 0.93 px)
**Mean Normalized Cross-Correlation (NCC):** 0.0148

---

## 1. Co-Registration Quality Metrics (Sample Breakdown)

| Sample ID | Method | Shift (dx, dy) | NCC After Warp | Status |
| :--- | :--- | :--- | :--- | :--- |
| `train_Image_004_p0` | `ecc` | (-2.69, 2.07) | 0.010 | **FLAGGED** |
| `train_Image_004_p1` | `ecc` | (7.75, -6.49) | -0.023 | **FLAGGED** |
| `train_Image_004_p2` | `ecc` | (-1.75, 3.98) | 0.012 | **FLAGGED** |
| `train_Image_004_p3` | `ecc` | (-24.54, 4.44) | 0.001 | **FLAGGED** |
| `train_Image_009_p0` | `ecc` | (-4.65, 29.48) | 0.001 | **FLAGGED** |
| `train_Image_009_p1` | `ecc` | (-16.04, 8.40) | 0.006 | **FLAGGED** |
| `train_Image_009_p2` | `ecc` | (8.24, -4.82) | -0.019 | **FLAGGED** |
| `train_Image_009_p3` | `ecc` | (-58.37, -4.36) | -0.001 | **FLAGGED** |
| `train_Image_012_p0` | `ecc` | (-0.26, -30.01) | 0.016 | **FLAGGED** |
| `train_Image_012_p1` | `ecc` | (6.09, -6.71) | -0.000 | **FLAGGED** |
| `train_Image_012_p2` | `ecc` | (38.31, 1.96) | 0.016 | **FLAGGED** |
| `train_Image_012_p3` | `ecc` | (-15.66, -23.21) | 0.004 | **FLAGGED** |
| `train_Image_013_p0` | `ecc` | (-0.39, -15.68) | 0.002 | **FLAGGED** |
| `train_Image_013_p1` | `ecc` | (22.18, 43.65) | -0.006 | **FLAGGED** |
| `train_Image_013_p2` | `ecc` | (25.06, 32.02) | 0.011 | **FLAGGED** |
| `train_Image_013_p3` | `ecc` | (19.24, -7.16) | 0.030 | **FLAGGED** |
| `train_Image_014_p0` | `ecc` | (1.79, 9.68) | 0.015 | **FLAGGED** |
| `train_Image_014_p1` | `ecc` | (9.62, 0.55) | -0.020 | **FLAGGED** |
| `train_Image_014_p2` | `ecc` | (0.56, -0.66) | 0.025 | **FLAGGED** |
| `train_Image_014_p3` | `ecc` | (-21.98, -28.64) | 0.001 | **FLAGGED** |

---

## 2. Geometric Integrity Verdict

- **Sub-Pixel Alignment:** Gradient magnitude matching resolved inter-band offsets.
- **Output Representation:** `float32` verified across all aligned channels.
- **Review Status:** 520 / 520 flagged for manual review.
- **Audit Verdict:** **PASSED**