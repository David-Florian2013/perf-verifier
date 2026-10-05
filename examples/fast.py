#!/usr/bin/env python3
"""Linear accumulator: append in place."""
import sys

n = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
s = []
for i in range(n):
    s.append(i)
print(len(s))
