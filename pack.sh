#!/bin/sh
# Recreate the Claude skill archive from this repo.
set -eu
cd "$(dirname "$0")"
python3 - << 'PY'
import zipfile
from pathlib import Path
root = Path('.')
out = root / 'perf-verifier.skill'
with zipfile.ZipFile(out, 'w', compression=zipfile.ZIP_DEFLATED) as z:
    z.write(root / 'SKILL.md', 'perf-verifier/SKILL.md')
    z.write(root / 'scripts' / 'pf.py', 'perf-verifier/scripts/pf.py')
print('wrote', out)
PY
