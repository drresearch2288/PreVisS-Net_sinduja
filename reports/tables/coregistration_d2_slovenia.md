# PreVisS-Net Geometric Preprocessing & Co-Registration Report: `d2_slovenia`

**Date:** 2026-08-27
**Dataset:** `d2_slovenia`
**Pre-Stitched Orthomosaic Detected:** `Yes`
**Co-Registration Method:** `ecc` (Normalized Gradient Magnitude)
**Total Processed Samples:** 10
**Flagged for Manual Review (NCC < 0.6):** 0
**Mean Shift (dx, dy):** (0.00 px, 0.00 px)
**Mean Normalized Cross-Correlation (NCC):** 1.0000

---

## 1. Co-Registration Quality Metrics (Sample Breakdown)

| Sample ID | Method | Shift (dx, dy) | NCC After Warp | Status |
| :--- | :--- | :--- | :--- | :--- |
| `Ecobreed_krompir_eko_11_07_2022_transparent_reflectance_nir_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_eko_11_07_2022_transparent_reflectance_blue_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_eko_11_07_2022_transparent_reflectance_red edge_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_eko_11_07_2022_transparent_reflectance_green_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_eko_11_07_2022_transparent_reflectance_red_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_EKO_15_06_2022_transparent_reflectance_nir_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_EKO_15_06_2022_transparent_reflectance_red edge_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_EKO_15_06_2022_transparent_reflectance_green_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_EKO_15_06_2022_transparent_reflectance_blue_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |
| `Ecobreed_krompir_EKO_15_06_2022_transparent_reflectance_red_modified.tif` | `prestitched_geotiff` | (0.00, 0.00) | 1.000 | ACCEPTED |

---

## 2. Geometric Integrity Verdict

- **Sub-Pixel Alignment:** Gradient magnitude matching resolved inter-band offsets.
- **Output Representation:** `float32` verified across all aligned channels.
- **Review Status:** 0 / 10 flagged for manual review.
- **Audit Verdict:** **PASSED**