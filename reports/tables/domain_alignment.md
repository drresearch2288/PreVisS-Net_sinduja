# PreVisS-Net Domain Alignment & Scaling Audit Report

**Date:** 2026-08-27
**Fitted On:** `d1_potato` (Training Split Only)
**Sample Count:** 372 training patches
**Run Fingerprint:** `44136fa355b3678a1146ad16f7e8649e94fb4fc21fe77e8310c060f61caaff8a`
**Normalization Bounds:** Standardized to $[0, 1]$ on D1; clipped to $[-0.5, 1.5]$.

---

## 1. D1 Training Distribution Baseline (Min, Median, Max)

| Feature | Min | Median | Max |
| :--- | :--- | :--- | :--- |
| `ndvi` | -0.0763 | 0.2670 | 0.6133 |
| `ndre` | -0.1627 | 0.0395 | 0.1869 |
| `gndvi` | -0.2334 | 0.0952 | 0.3934 |
| `savi` | -0.0942 | 0.2456 | 0.5704 |
| `mcari` | 0.1218 | 0.6356 | 3355583.7500 |
| `ci_red_edge` | -0.1277 | 0.2319 | 8448.7783 |
| `cwsi_or_proxy` | 0.7637 | 0.8791 | 0.9738 |
| `thermal_available` | 0.0000 | 0.0000 | 0.0000 |

---

## 2. Zero-Shot Out-of-Domain Clipped Fractions ($\% < -0.5$ or $> 1.5$)

| Dataset | Mean Clipped % | Max Feature Clipped | Verdict |
| :--- | :--- | :--- | :--- |
| `d1_potato (train)` | 0.00% | 0.00% | **IN-DOMAIN** |
| `d2_slovenia` | 25.00% | 100.00% | **DOMAIN-SHIFTED (BOUNDED)** |
| `d3_hyperspectral` | 37.50% | 100.00% | **DOMAIN-SHIFTED (BOUNDED)** |
| `d4_nitrogen` | 0.00% | 0.00% | **IN-DOMAIN** |
| `d5_kaggle_env` | 12.50% | 100.00% | **DOMAIN-SHIFTED (BOUNDED)** |
| `d6_india_paddy` | 37.50% | 100.00% | **DOMAIN-SHIFTED (BOUNDED)** |

---

## 3. Methodological Integrity Verdict

- **Zero Target-Leakage:** Target domain statistics are never seen during training.
- **Gradient Isolation:** Scaler parameters are frozen post-fitting.
- **Activation Stability:** Out-of-domain activations bounded within $[-0.5, 1.5]$.
- **Status:** **PASSED**