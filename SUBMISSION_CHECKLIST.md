# PreVisS-Net Manuscript Submission Checklist

Comprehensive pre-submission audit checklist ensuring full compliance with SCI-indexed journal guidelines (*Computers and Electronics in Agriculture* / *IEEE TGRS* / *Remote Sensing of Environment*).

---

## 1. Figures & Visual Assets (600 DPI Publication Standards)

- [x] **DPI Standards:** All 14 figures generated at **600 DPI** raster (`.png`) and vector (`.pdf`) format in [`reports/figures/`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/reports/figures/).
- [x] **Editable Font Encoding:** Matplotlib configured with `pdf.fonttype = 42` and `ps.fonttype = 42` (TrueType font embeddings) so reviewers and publishers can edit figure labels without font substitution artifacts.
- [x] **Sidecar Provenance:** Every figure has an identical-name JSON sidecar (e.g., `fig04_same_domain.json`) containing all plot numerical coordinates, raw series arrays, confidence interval bounds, and metric timestamps.
- [x] **Figure Manifest:** Master figure audit manifest verified with SHA-256 digests in [`reports/figures/figure_manifest.json`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/reports/figures/figure_manifest.json) (14/14 SUCCESS).

| Figure | Description | Vector PDF | High-Res PNG | Data Sidecar |
| :--- | :--- | :--- | :--- | :--- |
| **Fig 1** | End-to-End System Architecture | `reports/figures/fig01_pipeline.pdf` | `fig01_pipeline.png` | `fig01_pipeline.json` |
| **Fig 2** | AFAM Spatial Fusion Mechanism | `reports/figures/fig02_fusion.pdf` | `fig02_fusion.png` | `fig02_fusion.json` |
| **Fig 3** | Temporal ViT Self-Attention Trajectories | `reports/figures/fig03_temporal.pdf` | `fig03_temporal.png` | `fig03_temporal.json` |
| **Fig 4** | Same-Domain Multi-Metric Comparison | `reports/figures/fig04_same_domain.pdf` | `fig04_same_domain.png` | `fig04_same_domain.json` |
| **Fig 5** | Zero-Shot Transfer & Generalization Gap | `reports/figures/fig05_zeroshot.pdf` | `fig05_zeroshot.png` | `fig05_zeroshot.json` |
| **Fig 6** | Pre-Visual Lead-Time vs CWSI | `reports/figures/fig06_leadtime.pdf` | `fig06_leadtime.png` | `fig06_leadtime.json` |
| **Fig 7** | GRL Domain Discriminator Alignment | `reports/figures/fig07_discriminator.pdf` | `fig07_discriminator.png` | `fig07_discriminator.json` |
| **Fig 8** | Edge Hardware Latency & Energy Pareto | `reports/figures/fig08_edge.pdf` | `fig08_edge.png` | `fig08_edge.json` |
| **Fig 9** | Multi-Band SHAP Physiological Attributions | `reports/figures/fig09_shap.pdf` | `fig09_shap.png` | `fig09_shap.json` |
| **Fig 10**| Spatio-Temporal Grad-CAM Foliar Heatmaps| `reports/figures/fig10_gradcam.pdf` | `fig10_gradcam.png` | `fig10_gradcam.json` |
| **Fig 11**| Agronomic Prescription Advisory Card | `reports/figures/fig11_advisory.pdf` | `fig11_advisory.png` | `fig11_advisory.json` |
| **Fig 12**| Ablation Performance Waterfall | `reports/figures/fig12_waterfall.pdf` | `fig12_waterfall.png` | `fig12_waterfall.json` |
| **Fig 13**| Multi-Task Synergy vs Interference | `reports/figures/fig13_multitask.pdf` | `fig13_multitask.png` | `fig13_multitask.json` |
| **Fig 14**| Multi-Dimensional Radar Benchmark | `reports/figures/fig14_radar.pdf` | `fig14_radar.png` | `fig14_radar.json` |

---

## 2. Tables & Cross-References

- [x] **LaTeX & PNG Renderings:** All 4 tables compiled in publication LaTeX format (`booktabs`, no vertical rules) and 300 DPI visual `.png` table cards in [`paper/tables/`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/paper/tables/):
  - `table1_same_domain.[tex|png]`: Same-domain accuracy ($95.1\%$), macro-$F_1$ ($94.2\%$), $R^2$ ($0.865$), RMSE ($0.054$).
  - `table2_zero_shot.[tex|png]`: Zero-shot macro-$F_1$ across D3 ($88.4\%$), D4 ($86.2\%$), D5 ($84.5\%$), and Generalization Gap ($7.8\text{ pts}$).
  - `table3_leadtime.[tex|png]`: Early-warning lead time ($18.5\text{ d}$), FEWR ($4.8\%$), Day-10 Detection ($94.2\%$), Operating threshold ($0.58$).
  - `table4_hyperparams.[tex|png]`: 50-trial Optuna Bayesian search space and optimal configuration.
- [x] **Textual Cross-References:** Every table is cited in `paper/main.tex` and discussed in experimental sections.

---

## 3. Abstract & Numerical Traceability Audit

- [x] **Numerical Consistency Check:** Every numerical value in the Abstract matches the canonical JSON metrics files and manuscript tables:
  - Same-Domain Accuracy: **$95.1 \pm 0.5\%$** (matches `evaluation_results.json`)
  - Same-Domain Macro-$F_1$: **$94.2 \pm 0.5\%$** (matches `evaluation_results.json`)
  - Continuous CWSI $R^2$: **$0.865 \pm 0.007$** (matches `evaluation_results.json`)
  - Continuous CWSI RMSE: **$0.054 \pm 0.003$** (matches `evaluation_results.json`)
  - Early-Warning Lead Time: **$18.5 \pm 2.1\text{ days}$** (matches `leadtime.json`)
  - False Early-Warning Rate (FEWR): **$4.8\%$** (matches `leadtime.json`)
  - Zero-Shot Cross-Domain Generalization Gap: **$7.8\text{ percentage points}$** (matches `evaluation_results.json`)
  - Edge Inference Latency: **$9.8\text{ ms}$** (matches `edge_benchmark.json`)

---

## 4. Statements & Administrative Requirements

- [x] **Data and Code Availability Statement:** Included in [`paper/sections/10_data_availability.tex`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/paper/sections/10_data_availability.tex) with live GitHub and Zenodo DOI links.
- [x] **Licensing Disclosures:** MIT for code with explicit dataset attribution for all 6 benchmarks in [`LICENSE`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/LICENSE).
- [x] **Citation Metadata:** Standard CFF file provided in [`CITATION.cff`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/CITATION.cff).
- [x] **Author Contributions (CRediT):** Conceptualization, Methodology, Software, Validation, Formal Analysis, Investigation, Writing - Original Draft, Writing - Review & Editing.
- [x] **Funding & Ethics Statement:** No animal or human participants involved. Data collected under standard field research permits.
- [x] **Conflict of Interest Declaration:** Stated in cover letter and manuscript.
- [x] **Word Count & Page Limits:** Manuscript text structured within standard 8,000-word journal limits.
- [x] **Supplementary Material:** Reproducibility pipeline script [`scripts/reproduce_all.py`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/scripts/reproduce_all.py), environment specifications [`environment.yml`](file:///Users/prabanandsc/C_Work/Sinduja/PreVisS-Net/environment.yml), and test suite (202 tests) ready.
