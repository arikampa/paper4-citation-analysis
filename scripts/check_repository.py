#!/usr/bin/env python3
"""Static basic checks: notebook validity, output clearance, and obvious embedded keys.
Not a full credential scanner or a substitute for a clean run.
"""
from pathlib import Path
import json, re, sys
root = Path(__file__).resolve().parents[1]
errors = []
for nb_path in sorted((root/'notebooks').rglob('*.ipynb')):
    data = json.loads(nb_path.read_text(encoding='utf-8'))
    for i, cell in enumerate(data['cells']):
        source = ''.join(cell.get('source', []))
        if cell.get('cell_type') == 'code':
            if cell.get('outputs'):
                errors.append(f'{nb_path.name}: saved outputs in cell {i}')
            if re.search(r'os\.environ\[[\"\'](?:HF_TOKEN|WANDB_API_KEY)[\"\']\]\s*=\s*[\"\'][^\"\'\n]{20,}', source):
                errors.append(f'{nb_path.name}: suspicious embedded credential in cell {i}')
        if re.search(r'\bhf_[A-Za-z0-9]{15,}\b', source):
            errors.append(f'{nb_path.name}: possible HF token in cell {i}')
for forbidden in [root/'oa_pdf', root/'factorized_cfa.rar']:
    if forbidden.exists():
        errors.append(f'Unexpected published asset: {forbidden}')
print(f'Checked {len(list((root/"notebooks").rglob("*.ipynb")))} notebooks')
if errors:
    print('ERRORS:', *errors, sep='\n - ')
    sys.exit(1)
print('Basic security/structure checks passed. Manual review is still essential.')
