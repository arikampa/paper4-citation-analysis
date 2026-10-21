# Paper 4 — Citation Analysis and Scientometric Inference

**Research code and selected aggregate outputs — draft repository (not a completed reproducibility release).**

This repository draft organizes the supplied research notebooks for acquiring OpenAlex records, downloading scholarly PDFs, constructing citation datasets, training sentiment and citation-function classifiers, extracting citation information, and performing paper-level analyses with **LFCR** (less-frequent citation ratio) and **LFC**, including milestone-based early-impact and delayed-recognition analyses.

> **Status:** The original notebooks were built around Google Colab and the author's Google Drive. They are **not plug-and-play** from a fresh clone: paths, model checkpoints and external datasets must be provided. Results are pre-existing outputs supplied by the author and have **not** been independently rerun or numerically validated in this draft.

## Repository layout

- `notebooks/pipeline/`: numbered pipeline 01–07 for source retrieval, PDF processing, sampling, factorized inference, and paper-level analysis.
- `notebooks/datasets/`: citation sentiment/function dataset preparation and OpenAlex citation extraction.
- `notebooks/training/`: sentiment and factorized citation-function model training.
- `data/metadata/` and `data/derived/`: small metadata, LFCR summaries and coverage sampling artifacts.
- `results/milestones/`: selected aggregate inferential/predictive outputs across coverage milestones (30%, 50%, 70%, 100%).
- `results/sentiment_training/`: selected supplied evaluation reports and learning logs.
- `results/factorized_cfa/`: supplied model reports, training logs and PDF plots extracted from the factorized archive; per-example predictions/splits are excluded.
- `figures/`: supplied PDF figures; rights and publication alignment require owner review.
- `docs/`: workflow, data availability, file map, and release checklist.

## Main workflow

1. Run `notebooks/pipeline/01_openalex_journal_dataset_builder.ipynb` to acquire OpenAlex metadata and build `clean_dataset.csv`.
2. Run `02_pdf_downloader.ipynb` to retrieve accessible PDFs into a local/Drive directory named `oa_pdf/` (the PDFs are **not** distributed here).
3. Run `03_coverage_sampling_plan.ipynb` and `04_copy_milestone_pdfs.ipynb` to prepare incremental and cumulative PDF samples.
4. Build citation corpora with the scripts in `notebooks/datasets/`; train the sentiment and citation-function models in `notebooks/training/`. These workflows require further third-party datasets and/or model assets.
5. Run `05_factorized_cfa_pdf_inference_rare_citation_summary_with_function_confidence.ipynb` using the models and PDFs to produce `rare_citations_summary.csv`.
6. Run `06_article_impact_modeling_LFCR_LFC.ipynb` and `07_delayed_recognition_analysis_LFCR_LFC.ipynb` for milestone-specific and subsequent-outcome analyses.

This is a **logical overview**, not yet a single tested automated execution sequence. More detailed prerequisites and missing inputs are in [Reproducibility](docs/REPRODUCIBILITY.md).

## Prerequisites

- Python and Jupyter, or preferably **Google Colab**, as used in the supplied notebooks.
- An environment compatible with the selected PyTorch/Transformers models and appropriate GPU resources for LLaMA3/transformer training.
- External datasets and model checkpoints as described in [`data/README.md`](data/README.md).
- Secure authentication for Hugging Face, Weights & Biases, and OpenAlex where applicable. Never commit tokens.

A provisional dependency list is in `requirements.txt`; exact package versions and environment hashes were **not** supplied and cannot be asserted.

## Data, models and security

`oa_pdf/` and model weights were intentionally not supplied by the author. The public draft also excludes raw third-party citation corpora, full-text extracts, the 914 TEI-XML archive, and paper-level predictions pending redistribution/licensing review. See [Data availability](docs/DATA_AVAILABILITY.md).

In the provided notebooks, embedded Hugging Face / Weights & Biases credentials were replaced with environment/secret-based instructions and saved cell outputs were removed. **Any previously exposed active keys should be rotated or revoked** before publishing.

## Research citation and licensing

Update this section with the final publication title, complete author list, journal, year and DOI. See `LICENSE-TO-DECIDE.md` before releasing a public repository. No scientific result should be described as reproduced solely because its previously generated CSV/plot was included.

## Publishing on GitHub

Start with a **private** repository. See [Publish to GitHub](docs/PUBLISH_TO_GITHUB.md) for the optional `publish_to_github.ps1` script, Windows PowerShell and Git instructions.
