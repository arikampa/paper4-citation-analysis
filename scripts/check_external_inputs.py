#!/usr/bin/env python3
"""Check critical project data files in a Colab/Drive working directory.
Usage: python scripts/check_external_inputs.py /path/to/working/project
"""
from pathlib import Path
import sys
root = Path(sys.argv[1]).expanduser() if len(sys.argv)>1 else Path.cwd()
for rel in ['clean_dataset.csv','rare_citations_summary.csv','coverage_sampling_plan/milestone_sampling_plan.csv','oa_pdf']:
 p=root/rel
 print(('OK      ' if p.exists() else 'MISSING ')+str(p))
