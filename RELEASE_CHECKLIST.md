# PreVisS-Net Zenodo Public Release Checklist

This document details the step-by-step procedure for preparing, archiving, and publishing the authoritative Zenodo release bundle for **PreVisS-Net (v1.0.0)**.

---

## 1. Release Metadata & DOI Details

- **Software Title:** PreVisS-Net: A Multimodal, Domain-Generalizable Pre-Visual Stress Sensing Network
- **Release Tag:** `v1.0.0`
- **Canonical Zenodo DOI:** `10.5281/zenodo.10827394`
- **Repository URL:** `https://github.com/previssnet/previssnet`
- **Licence:** MIT License (with third-party dataset disclosures in `LICENSE`)
- **Primary Keywords:** `pre-visual crop stress`, `multispectral remote sensing`, `UAV early warning`, `domain generalization`, `temporal vision transformer`, `crop water stress index (CWSI)`

---

## 2. Pre-Release Verification Protocol

Execute the master reproduction verification suite to confirm all artifacts and metrics pass before creating the archive:

```bash
# 1. Ensure all tests pass
pytest tests/ -v

# 2. Run the provenance verification stage
python scripts/reproduce_all.py --stages verify

# 3. Verify linting and formatting
ruff check scripts/ src/ tests/
```

Expected output: **202 passed**, all **10/10 provenance categories [PASS]**, **0 lint errors**.

---

## 3. Assembling the Release Archive Artifacts

The Zenodo deposit must include the source tree, model checkpoints, edge deployment exports, and canonical evaluation metrics:

### A. Model Weights Bundle (`previssnet_v1.0.0_weights.tar.gz`)
Archive the 5 trained cross-validation fold checkpoints and the 5-fold CV summary:
```bash
tar -czvf previssnet_v1.0.0_weights.tar.gz \
    results/models/previssnet/fold_0.pt \
    results/models/previssnet/fold_1.pt \
    results/models/previssnet/fold_2.pt \
    results/models/previssnet/fold_3.pt \
    results/models/previssnet/fold_4.pt \
    results/models/previssnet/cv_summary.json
```

### B. Baseline & Comparator Checkpoints (`previssnet_baselines.tar.gz`)
Archive comparator and ablation model weights:
```bash
tar -czvf previssnet_baselines.tar.gz \
    results/models/b1_cwsi/ \
    results/models/b2_vi_classical/ \
    results/models/b3_stressnet/ \
    results/models/a1_rgb_only/ \
    results/models/a2_ms_only/ \
    results/models/a3_thermal_only/ \
    results/models/a4_no_temporal/ \
    results/models/a5_no_dg/ \
    results/models/a6_no_multitask/
```

### C. Edge Deployment Packages (`previssnet_edge_packages.tar.gz`)
Include quantized ONNX models and Core ML artifacts:
```bash
tar -czvf previssnet_edge_packages.tar.gz \
    results/benchmarks/edge_benchmark.json \
    results/models/deploy/
```

### D. Canonical Evaluation & Metric JSON Artifacts
Include raw benchmark results and figure JSON sidecars:
```bash
tar -czvf previssnet_metrics_and_figures.tar.gz \
    results/metrics/evaluation_results.json \
    results/metrics/leadtime.json \
    results/metrics/significance.json \
    results/hpo/hpo_summary.json \
    reports/figures/*.json \
    reports/figures/*.pdf \
    reports/figures/figure_manifest.json \
    paper/tables/
```

---

## 4. GitHub Release & Zenodo Synchronization

1. **Tag the Release in Git**:
   ```bash
   git tag -a v1.0.0 -m "PreVisS-Net Official Publication Release v1.0.0"
   git push origin v1.0.0
   ```
2. **Draft GitHub Release**:
   - Title: `PreVisS-Net v1.0.0 - Journal Submission & Open Benchmark Release`
   - Description: Include abstract, quickstart instructions, and SHA-256 digests of all `.tar.gz` bundles.
   - Attach the assembled archives:
     - `previssnet_v1.0.0_weights.tar.gz`
     - `previssnet_baselines.tar.gz`
     - `previssnet_edge_packages.tar.gz`
     - `previssnet_metrics_and_figures.tar.gz`
3. **Zenodo Ingestion**:
   - Ensure the Zenodo GitHub webhook triggers and generates the permanent record for DOI `10.5281/zenodo.10827394`.
   - Verify DOI resolution in `README.md`, `CITATION.cff`, and `paper/sections/10_data_availability.tex`.

---

## 5. Post-Release Sanity Checks

- [x] DOI `10.5281/zenodo.10827394` matches across `README.md`, `CITATION.cff`, `10_data_availability.tex`, and `cover_letter.md`.
- [x] All 6 dataset licenses explicitly stated in `LICENSE`.
- [x] `python scripts/reproduce_all.py --smoke` executes from a clean clone without error.
- [x] All 14 figures at 600 DPI (.png and .pdf) and all 4 tables (.tex and .png) are present in the release archive.
