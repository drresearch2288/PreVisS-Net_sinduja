# PreVisS-Net Radiometric Calibration Audit Report: `d1_potato`

**Date:** 2026-08-27
**Dataset:** `d1_potato`
**Requested Strategy:** `auto`
**Total Processed Files:** 520
**Fallback to 'none' Count:** 0
**Average Raw DN Mean:** 110.87
**Average Calibrated Surface Reflectance Mean:** 0.4348
**Average Clipped-Pixel Fraction:** 0.0000%

---

## 1. Sample Calibration Metrics (First 20 Files)

| File ID | Method | Raw Mean $\pm$ Std | Calibrated Mean $\pm$ Std | Clipped % |
| :--- | :--- | :--- | :--- | :--- |
| `train_Image_004_p0` | `coefficients` | 113.7 $\pm$ 55.3 | 0.446 $\pm$ 0.217 | 0.00% |
| `train_Image_004_p1` | `coefficients` | 106.2 $\pm$ 49.3 | 0.417 $\pm$ 0.193 | 0.00% |
| `train_Image_004_p2` | `coefficients` | 126.5 $\pm$ 51.6 | 0.496 $\pm$ 0.202 | 0.00% |
| `train_Image_004_p3` | `coefficients` | 126.0 $\pm$ 49.8 | 0.494 $\pm$ 0.195 | 0.00% |
| `train_Image_009_p0` | `coefficients` | 102.9 $\pm$ 59.4 | 0.404 $\pm$ 0.233 | 0.00% |
| `train_Image_009_p1` | `coefficients` | 100.9 $\pm$ 50.4 | 0.396 $\pm$ 0.198 | 0.00% |
| `train_Image_009_p2` | `coefficients` | 114.1 $\pm$ 50.7 | 0.447 $\pm$ 0.199 | 0.00% |
| `train_Image_009_p3` | `coefficients` | 111.4 $\pm$ 49.8 | 0.437 $\pm$ 0.195 | 0.00% |
| `train_Image_012_p0` | `coefficients` | 118.0 $\pm$ 51.5 | 0.463 $\pm$ 0.202 | 0.00% |
| `train_Image_012_p1` | `coefficients` | 114.7 $\pm$ 51.3 | 0.450 $\pm$ 0.201 | 0.00% |
| `train_Image_012_p2` | `coefficients` | 132.6 $\pm$ 52.0 | 0.520 $\pm$ 0.204 | 0.00% |
| `train_Image_012_p3` | `coefficients` | 117.7 $\pm$ 55.3 | 0.462 $\pm$ 0.217 | 0.00% |
| `train_Image_013_p0` | `coefficients` | 95.9 $\pm$ 51.8 | 0.376 $\pm$ 0.203 | 0.00% |
| `train_Image_013_p1` | `coefficients` | 95.2 $\pm$ 45.2 | 0.373 $\pm$ 0.177 | 0.00% |
| `train_Image_013_p2` | `coefficients` | 99.8 $\pm$ 50.5 | 0.392 $\pm$ 0.198 | 0.00% |
| `train_Image_013_p3` | `coefficients` | 107.1 $\pm$ 49.7 | 0.420 $\pm$ 0.195 | 0.00% |
| `train_Image_014_p0` | `coefficients` | 97.2 $\pm$ 52.4 | 0.381 $\pm$ 0.205 | 0.00% |
| `train_Image_014_p1` | `coefficients` | 98.9 $\pm$ 44.7 | 0.388 $\pm$ 0.175 | 0.00% |
| `train_Image_014_p2` | `coefficients` | 106.1 $\pm$ 46.9 | 0.416 $\pm$ 0.184 | 0.00% |
| `train_Image_014_p3` | `coefficients` | 114.7 $\pm$ 50.5 | 0.450 $\pm$ 0.198 | 0.00% |

---

## 2. Integrity Verdict

- **Output Data Type:** `float32` verified (Apple Silicon MPS compatible).
- **Reflectance Bound:** Strictly clipped to $[0.0, 1.2]$.
- **Calibration Status:** **PASSED**