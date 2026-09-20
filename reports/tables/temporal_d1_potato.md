# PreVisS-Net Temporal Sequence Audit Report: `d1_potato`

**Date:** 2026-08-27
**Dataset:** `d1_potato`
**Sequence Mode:** `Sliding Window (k=4)`
**Total Sequences:** 13
**Padded Frame Fraction:** 50.00%
**Mean Delta Days:** 3.5 days
**Max Delta Days:** 14.0 days
**Pre-Visual Sample Count:** 0
**Pre-Visual Fraction:** 0.00%

---

## 1. Sequence Length Distribution ($k$-Histogram)

| Window Length ($k$) | Sequence Count |
| :--- | :--- |
| 4 | 13 |

---

## 2. Pre-Visual Stress Verification

- **Causal Front-Padding:** Padding repeats earliest frames; target is unpadded.
- **Evaluation Honesty:** Un-staged datasets restricted to `['classification']`.
- **Temporal Integrity:** **PASSED**