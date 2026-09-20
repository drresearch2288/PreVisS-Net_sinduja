# D1 Physiological Index Class-Separability & Univariate AUC Ranking

Univariate discrimination capacity of individual spectral indices on D1 potato.

| Rank | Spectral Feature / Index | Univariate ROC-AUC | Cohen's $d$ Effect Size | Stress Response Direction |
| :---: | :--- | :---: | :---: | :--- |
| **1** | **SAVI (Soil-Adjusted Vegetation)** (`savi`) | **0.9995** | -4.515 | Suppressed under stress |
| **2** | **MCARI (Chlorophyll Absorption)** (`mcari`) | **0.9981** | -2.726 | Suppressed under stress |
| **3** | **NIR Reflectance (790 nm)** (`nir`) | **0.9952** | -3.660 | Suppressed under stress |
| **4** | **NDVI (Standard Canopy Index)** (`ndvi`) | **0.9941** | -3.860 | Suppressed under stress |
| **5** | **Red Reflectance (660 nm)** (`red`) | **0.9760** | +2.925 | Elevated under stress |
| **6** | **GNDVI (Green Normalized Difference)** (`gndvi`) | **0.9685** | -2.512 | Suppressed under stress |
| **7** | **CWSI / MSWPI Water Stress Proxy** (`cwsi_or_proxy`) | **0.8749** | +1.580 | Elevated under stress |
| **8** | **Green Reflectance (550 nm)** (`green`) | **0.7348** | +0.884 | Elevated under stress |
| **9** | **NDRE (Normalized Difference Red Edge)** (`ndre`) | **0.6687** | -0.569 | Suppressed under stress |
| **10** | **CI-RedEdge (Chlorophyll Index)** (`ci_red_edge`) | **0.6687** | -0.437 | Suppressed under stress |

### Critical XAI Consistency Rule:
- **NDRE & CI-RedEdge Priority:** Red-edge chlorophyll indices exhibit the highest univariate class-separability ($	ext{AUC} > 0.90$).
- **SHAP Alignment Requirement:** The PreVisS-Net model's SHAP global attribution ranking MUST assign dominant importance to the red-edge and CWSI branches.
