# CLAUDE.md — PreVisS-Net Project Brief

## Project Context & Metadata
- **Project Name:** PreVisS-Net — Multimodal, Domain-Generalizable Pre-Visual Stress Sensing Network for UAV-Based Early Detection of Water Stress, Nutritional Deficiency, and Heat Stress in Crops.
- **Target Publication:** SCI-indexed journal publication.
- **Repository Root:** `~/research/previssnet` (Symlinked to `/Users/prabanandsc/C_Work/Sinduja/PreVisS-Net`)
- **Python Package Root:** `src/previssnet`
- **Environment & Stack:** 
  - Conda Environment: `previssnet` (Python 3.11)
  - PyTorch 2.x, Torchvision, Timm, Rasterio/GDAL, Fiona, Shapely, Pyproj, Rioxarray, Xarray, Scikit-learn, SHAP, Captum, Optuna, Loguru, Hydra-core/Omegaconf, Pytest, Ruff, Black.
  - Environment flags: `export KMP_DUPLICATE_LIB_OK=TRUE`, `export PYTORCH_ENABLE_MPS_FALLBACK=1` (configured in conda activate hooks).
- **Code Style & Engineering Standards:**
  - Type hints on every function signature.
  - Google-style docstrings on all modules, classes, and functions.
  - Logging strictly via `loguru` (no standard `print()` or built-in `logging` calls in library code).
  - Every executable script must use `argparse` and have a `main()` function guarded by `if __name__ == "__main__":`.
  - PEP8 compliance enforced via `ruff` and `black`.
  - **Zero Tolerance Policy:** Absolutely NO Jupyter notebooks anywhere in the repository.

---

## 1. PROJECT
PreVisS-Net is a multimodal deep-learning framework engineered to detect water stress, nutritional deficiency, and heat stress in agricultural crops from UAV imagery **BEFORE** visible symptoms appear to the human eye or standard RGB cameras.

The pre-visual stress signal resides primarily in:
1. **Canopy temperature changes** (caused by early stomatal closure to prevent transpiration water loss).
2. **Red-edge and Near-Infrared (NIR) reflectance shifts** (caused by early cellular breakdown and chlorophyll/nitrogen kinetics).
3. **Not plain RGB** (visible yellowing/wilting occurs too late for non-destructive intervention).

---

## 2. FOUR CORE CONTRIBUTIONS
The codebase must implement the following four novel architectural and algorithmic components:

### (a) Multimodal Fusion Encoder
- **Architecture:** RGB CNN + Engineered-Index MLP + Thermal/CWSI CNN.
- **Fusion Mechanism:** Cross-attention mechanism over modality feature tokens:
  $$\mathbf{z}_{\text{fused}} = \text{CrossAttention}(\mathbf{z}_{\text{RGB}}, \mathbf{z}_{\text{indices}}, \mathbf{z}_{\text{thermal}})$$

### (b) Temporal Trend Transformer
- **Architecture:** 4 transformer layers, 8 attention heads.
- **Input:** Sliding window over the last $k = 4$ UAV flights.
- **Positional Encoding:** Encodes the **ACTUAL inter-flight time gap in days** (accounting for irregular UAV flight cadence and adverse weather delays), rather than an artificial uniform step index.

### (c) Multi-Task Stress Head
- **Backbone:** Shared multimodal-temporal representation backbone.
- **Specialized Task Heads:**
  1. *Water Head:* Binary classification (stressed vs. healthy) + Crop Water Stress Index (CWSI) regression.
  2. *Nutrient Head:* Multi-class classification ($N$, $P$, $K$ deficiency vs. normal).
  3. *Heat Head:* Binary classification (heat-stressed vs. normal).
- **Task Loss Function:**
  $$\mathcal{L}_{\text{task}} = \mathcal{L}_{\text{water}} + \alpha \cdot \mathcal{L}_{\text{nutrient}} + \beta \cdot \mathcal{L}_{\text{heat}}, \quad \alpha, \beta \in [0.1, 0.5]$$

### (d) Domain Generalization
- **Mechanism:** Gradient Reversal Layer (GRL) coupled with a Domain Discriminator acting on the fused embedding.
- **Total Objective:**
  $$\mathcal{L}_{\text{total}} = \mathcal{L}_{\text{task}} + \lambda(t) \cdot \mathcal{L}_{\text{domain}}$$
- **Ganin Schedule:**
  $$\lambda(t) = \frac{2}{1 + \exp(-10 \cdot t)} - 1, \quad \text{where } t = \frac{\text{epoch}}{\text{total\_epochs}} \quad (\text{ramps up to max } 1.0)$$

---

## 3. DATASET ROLES — THE MOST IMPORTANT RULE IN THIS PROJECT
Strict data isolation must be enforced **in code** (via dataset loaders and loss wrappers), not merely by convention:

| Dataset ID | Dataset Name / Citation | Modality & Description | Strict Role & Gradient Rules |
| :--- | :--- | :--- | :--- |
| **D1** | **Potato Crop Stress**<br>*(Butte et al. 2021)* | RGB + Parrot Sequoia 4-band MS | **TRAIN ONLY.** The **ONLY** dataset that ever receives a task-gradient update.<br>Split: 70/15/15, with 5-fold cross-validation inside the 70% training set. |
| **D2** | **Slovenia UAV Multispectral Potato**<br>*(Zenodo 10934163)* | Multi-flight GeoTIFF surveys | **Domain-Adaptation VALIDATION.**<br>Used **ONLY** for domain-discriminator loss and early stopping. **NEVER** for task loss. |
| **D3** | **Hyperspectral Potato Water-Deficit / Nematode**<br>*(Zenodo 14267877)* | Staged Days 10 / 40 / 70 | **ZERO-SHOT Test (Modality Shift).**<br>Primary source of truth for the early-detection lead-time metric. |
| **D4** | **Global UAV Nitrogen Traits**<br>*(Castilho et al. 2024, Figshare 22938797)* | Tabular vegetation indices & traits | **ZERO-SHOT Test (Crop Shift).**<br>Evaluates the nutrient head on unseen crop distributions. |
| **D5** | **Kaggle Crop Health & Environmental Stress**<br>*(212,019 records)* | Tabular / Environmental features | **ZERO-SHOT Test (Sensor + Geography Shift).**<br>Evaluates the heat head under covariate shift. |
| **D6** | **Indian UAV Paddy**<br>*(IIT Tirupati / DroneHub, arXiv 2601.01084)* | High-resolution UAV paddy imagery | **ZERO-SHOT QUALITATIVE ONLY.**<br>Not stress-labelled: representation-transfer check only; no quantitative accuracy reported. |

> **CRITICAL ARCHITECTURAL CONSTRAINT:**
> **D2 through D6 must NEVER contribute to a task-loss gradient under any circumstance.**
> This must be enforced assertively in the PyTorch training loop (e.g., detached tensors or explicit optimizer parameter masking).

---

## 4. BASELINES & ABLATIONS
PreVisS-Net must be evaluated against all standard baselines using the exact **SAME** training harness, identical folds, seeds, and preprocessing pipelines:

### External Baselines:
- **B1:** CWSI threshold classifier (*Idso et al. 1981*).
- **B2:** Random Forest / Support Vector Machine trained on vegetation indices alone.
- **B3:** StressNet-style spatial-spectral-temporal deformable attention + BiLSTM (*Frontiers in Plant Science 2023*).

### Ablation Studies:
- **A1:** RGB-only modality.
- **A2:** Multispectral (MS)-only modality.
- **A3:** Thermal-only modality.
- **A4:** No Temporal Trend Transformer (static / single-timepoint model).
- **A5:** No Domain Generalization (without Gradient Reversal Layer / domain discriminator).
- **A6:** No Multi-Task Learning (single-task water head only).

---

## 5. TARGET METRICS
The pipeline and models must be engineered to meet or exceed the following target publication criteria:

- **Same-Domain Water Stress (on D1 test):**
  - Accuracy $\ge 93\%$
  - $F_1\text{-score} \ge 0.92$
  - $R^2 (\text{CWSI}) \ge 0.85$
  - $\text{RMSE} \le 0.06$
- **Zero-Shot Transfer:**
  - D3 (Hyperspectral): Accuracy $\ge 80\%$
  - D4 (Nitrogen): Accuracy $\ge 75\%$
  - D5 (Heat / Environmental): Accuracy $\ge 78\%$
  - Generalization Gap $\le 15$ percentage points
- **Early Warning & Temporal Reliability:**
  - Lead Time $\ge 15\text{--}20$ days before visible symptoms emerge
  - False Early-Warning Rate $\le 15\%$
  - Agronomic Explainability: SHAP-agronomist agreement Cohen's $\kappa \ge 0.75$
- **Statistical Significance:**
  - 5-fold cross-validation reported as $\text{mean} \pm \text{std}$.
  - Paired Wilcoxon signed-rank test with $p < 0.05$ against **EVERY** baseline and ablation model.

---

## 6. HARDWARE POLICY (Apple M5 Pro, MPS Backend)
- **Device Management:**
  - PyTorch device must **ALWAYS** be resolved via `previssnet.utils.device.get_device()`.
  - **NEVER** hardcode `"cuda"`, `"mps"`, or `"cpu"`.
  - **NEVER** call `.cuda()`.
  - **NEVER** import `pynvml`, `apex`, or `tensorrt`.
- **MPS Precision Requirements:**
  - Apple Silicon Metal (MPS) does not support `float64` (double precision).
  - Explicitly cast all NumPy arrays to `float32` before invoking `torch.from_numpy()` or `torch.tensor()`.
  - Ensure `PYTORCH_ENABLE_MPS_FALLBACK=1` and `KMP_DUPLICATE_LIB_OK=TRUE` are present in runtime environment.
