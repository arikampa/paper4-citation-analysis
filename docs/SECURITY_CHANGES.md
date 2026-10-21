# Security modifications

This prepared public draft changes only notebook assignments that embed literal Hugging Face/Weights & Biases tokens. W&B hardcoded assignments were replaced with comments instructing use of secret-backed environment variables; the Hugging Face assignment in notebook 05 was replaced with an explicit check for `HF_TOKEN` in the environment. All saved cell outputs and execution counts were cleared to avoid historical leakage. **Model, data processing and statistics calculations were otherwise preserved verbatim** in those notebook code cells.

Original notebooks in the uploaded material still contain the older secrets. Those originals must not be directly uploaded to a public repository. Rotate active keys.
