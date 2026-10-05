#!/bin/sh
# Recreate the Claude skill archive from this repo.
set -eu
cd "$(dirname "$0")"
rm -f perf-verifier.skill
mkdir -p .pack/perf-verifier/scripts
cp SKILL.md .pack/perf-verifier/SKILL.md
cp scripts/pf.py .pack/perf-verifier/scripts/pf.py
(cd .pack && zip -r ../perf-verifier.skill perf-verifier)
rm -rf .pack
echo "wrote perf-verifier.skill"
