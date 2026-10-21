# Data and model availability

**Deliberately not distributed in this draft:**

- `oa_pdf/` and other downloaded full-text PDFs: recover using the download notebook wherever lawfully accessible; successful retrieval can vary by time and publisher.
- Hugging Face model weights, local saved models, LLaMA checkpoints, LoRA adapters, and training artifacts.
- ACT2 TSV, Athar citation-sentiment corpus, MultiCite JSON, clinical-citation dataset and associated pickles: check the original authors' licenses and source attribution.
- Full OpenAlex-derived paper abstracts/contexts and journal citation-level datasets: examine source article access licenses and eligibility for republication of extracted text.
- Synthetic datasets and merged unified corpus: owner to confirm release policy, exact provenance and license compatibility before moving them into a public repository.
- `factorized_cfa.rar`: split/prediction archives were excluded because they may contain per-example text; the supplied reports, logs and PDF plots were extracted and included in `results/factorized_cfa/`.
- 914 TEI/XML full-text-derived records from the journal citation OpenAlex archive.

**Included on a reviewable basis:** small OpenAlex journal-source metadata, supplied LFCR ratio summary, coverage sampling plan files, selected aggregate statistical outputs and vector/PDF plots, and training evaluation reports. The repository owner should still inspect figures, IDs and publication permissions before making the repository public.

The initial private research collection comprised **39 uploaded top-level files** (14 notebooks, 11 ZIP, 10 CSV, 1 TSV, 1 JSON, 1 RAR and 1 DOCX). This repository draft is a *curated subset*, not a complete copy of those materials.
