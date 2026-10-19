#!/usr/bin/env bash
# Copy perf-verifier into ~/.claude/skills (override with CLAUDE_SKILLS_DIR).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
if [ ! -f "$ROOT/SKILL.md" ] || [ ! -f "$ROOT/scripts/pf.py" ]; then
  echo "missing SKILL.md or scripts/pf.py" >&2
  exit 1
fi
mkdir -p "$DEST/perf-verifier/scripts"
rm -rf "$DEST/perf-verifier"
mkdir -p "$DEST/perf-verifier/scripts"
cp "$ROOT/SKILL.md" "$DEST/perf-verifier/SKILL.md"
cp "$ROOT/scripts/pf.py" "$DEST/perf-verifier/scripts/pf.py"
echo "installed perf-verifier -> $DEST/perf-verifier"
