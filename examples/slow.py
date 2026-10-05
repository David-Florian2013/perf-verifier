#!/usr/bin/env python3
"""Quadratic accumulator: copies the whole list every iteration."""
import sys

n = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
s = []
for i in range(n):
    s = s + [i]
print(len(s))
