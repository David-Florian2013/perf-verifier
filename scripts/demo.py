#!/usr/bin/env python3
"""Scan the two examples. No model, no network, no timer."""
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PF = ROOT / "scripts" / "pf.py"


def main():
    proc = subprocess.run(
        [sys.executable, str(PF), "scan", "examples/slow.py", "examples/fast.py"],
        cwd=ROOT,
        text=True,
        capture_output=True,
        check=False,
    )
    body = proc.stdout.rstrip("\n")
    lines = [
        "perf-verifier",
        "command: python3 scripts/pf.py scan examples/slow.py examples/fast.py",
        "model: none    network: none",
        "",
        body,
        "",
    ]
    sys.stdout.write("\n".join(lines).rstrip() + "\n")
    if proc.returncode != 0 or "PY-LIST-CONCAT-LOOP" not in body or "1 slow-pattern" not in body:
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
