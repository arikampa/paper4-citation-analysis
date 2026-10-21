# Public release checklist

- [ ] Confirm final article title, author list, publication information, journal and DOI in README (or add CITATION.cff).
- [ ] Revoke and replace all tokens previously committed to or stored in notebooks; also check original upstream Git histories if applicable.
- [ ] Review all 39 entries in `docs/ORIGINAL_INPUT_INVENTORY.csv` for the final public release.
- [ ] Select a code license and separately review dataset/figure licensing and required attribution.
- [ ] Double-check that raw third-party texts, downloaded PDFs, Colab credentials, checkpoints, private data and any internal unpublished drafts are absent from the Git index.
- [ ] Decide whether and how to release original train/validation/test splits without leaking protected full-text or copyrighted material.
- [ ] Pin Python and ML dependencies in a tested environment (CUDA/torch/transformers/peft especially) and note GPU hardware and random seeds.
- [ ] Document model checkpoint IDs, original prompt templates, dataset label mapping and OpenAlex query dates.
- [ ] Cross-check retained results against manuscript figures/tables and review errors/CI for all four milestones.
- [ ] Run notebooks in a clean runtime or mark clearly which stages require missing private assets.
- [ ] Run `python scripts/check_repository.py` before uploading to GitHub.
