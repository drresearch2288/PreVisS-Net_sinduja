# PreVisS-Net Hyperparameter Optimization Table

| Component | Hyperparameter | Value/Range Explored | Selected Value |
| :--- | :--- | :--- | :--- |
| Encoder | rgb_backbone | [resnet18, resnet34, efficientnet_b0] | efficientnet_b0 |
| Encoder | fusion_heads | [4, 8] | 8 |
| Encoder | fusion_dim | [64, 128] | 128 |
| Temporal Transformer | layers | 2..4 | 4 |
| Temporal Transformer | heads | [4, 8] | 8 |
| Temporal Transformer | window_k | 3..5 | 4 |
| Domain Generalization | lambda_schedule | [fixed, ganin] | ganin |
| Domain Generalization | lambda_max | 0.5..1.0 | 1.00 |
| Multi-Task Heads | alpha | 0.1..0.5 | 0.20 |
| Multi-Task Heads | beta | 0.1..0.5 | 0.20 |
| Training | optimizer | [adam, adamw] | adam |
| Training | lr | 1e-4..1e-2 | 1.00e-03 |
| Training | batch_size | [16, 32, 64, 128] | 64 |

### Pre-Registered Expected Baseline Values:
- `efficientnet_b0` | 8 heads / 128 dim | 4 layers / 8 heads / k=4 | ganin, lambda_max 1.0 | alpha=0.2, beta=0.2 | adam, lr 1e-3, cosine decay | batch 64
