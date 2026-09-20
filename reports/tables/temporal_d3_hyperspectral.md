# PreVisS-Net Temporal Sequence Audit Report: `d3_hyperspectral`

**Date:** 2026-08-27
**Dataset:** `d3_hyperspectral`
**Sequence Mode:** `Sliding Window (k=3)`
**Total Sequences:** 70
**Padded Frame Fraction:** 4.29%
**Mean Delta Days:** 27.4 days
**Max Delta Days:** 60.0 days
**Pre-Visual Sample Count:** 4
**Pre-Visual Fraction:** 50.00%

---

## 1. Sequence Length Distribution ($k$-Histogram)

| Window Length ($k$) | Sequence Count |
| :--- | :--- |
| 3 | 70 |

---

## 2. Pre-Visual Stress Verification

- **Causal Front-Padding:** Padding repeated earliest frames; target frame is never padded.
- **Evaluation Honesty:** Un-staged datasets restricted to `['classification']` metrics.
- **Temporal Integrity:** **PASSED**