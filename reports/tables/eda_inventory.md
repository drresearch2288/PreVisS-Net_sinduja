# PreVisS-Net Multi-Dataset Inventory & Protocol Specifications

Comprehensive summary of all 6 multimodal, hyperspectral, and agronomic datasets
utilized in the PreVisS-Net study for pre-visual crop stress detection.

| Dataset Identifier | Crop & Setting | Sensor Type | Modalities Present | Samples ($N$) | Sequences ($K$) | Flights | Label Scope | Benchmark Role |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **D1 (Potato)** | Potato (Solanum tuberosum) | MicaSense RedEdge + RGB | RGB, MS (4-band), CWSI proxy | 1300 | 13 | 4 | Water Stress (Binary: Healthy / Stressed), CWSI continuous [0, 1] | Source Domain / 5-Fold Cross-Validation Benchmark |
| **D2 (Slovenia)** | Potato (Ecobreed trial) | UAV Multispectral Orthomosaics | MS (Green, Red, RedEdge, NIR), RGB | 450 | 15 | 3 | Unlabelled Target Domain | Unsupervised Domain Adaptation (GRL Discriminator Alignment) |
| **D3 (Hyperspectral)** | Cotton / Potato pot trials | Specim VNIR/SWIR Hyperspectral Camera | Synthesized 4-band MS + 8 VIs | 210 | 70 | 3 | Water Deficit, Nematode, Control, CWSI | Pre-Visual Lead-Time & Temporal Validation (Day 10/40/70) |
| **D4 (Nitrogen)** | 10 Cereal & Grass Crops | Field Spectroradiometer | Engineered VIs (NDVI, NDRE, GNDVI, PNC) | 550 | 550 | 1 | Nutrient Deficiency (N, P, K Deficient, Balanced) | Multi-Task Zero-Shot Generalization: Nutrient Deficiency |
| **D5 (Kaggle Env)** | Mixed Agricultural Field Plots | Thermal Radiometer + Weather Stations | Canopy Temp, Ambient Temp, Thermal Deficit, CWSI | 1000 | 1000 | 1 | Heat Stress Condition (Binary: Normal / Heat Stressed) | Multi-Task Zero-Shot Generalization: Thermal / Heat Stress |
| **D6 (India Paddy)** | Paddy Rice (Oryza sativa) | DJI Phantom 4 Multispectral | RGB (JPG), 4-band MS (Green, Red, RedEdge, NIR TIF) | 2400 | 480 | 5 | 5 Phenological Growth Stages | Cross-Crop & Cross-Geography Domain Generalization Test |

### Key Verification Highlights:
- **Zero Target-Domain Leakage:** D1 alone is used for primary supervised training and 5-fold CV.
- **Domain Adaptation Isolation:** D2 provides completely unlabelled target imagery for GRL.
- **Pre-Visual Lead-Time Grounding:** D3 provides rigorous multi-stage temporal sampling (Days 10, 40, and 70).
- **Multi-Task Zero-Shot Evaluation:** D4 isolates nutrient deficiency and D5 isolates heat stress.
- **Geographic Generalization:** D6 provides out-of-distribution multi-stage tropical paddy UAV imagery.
