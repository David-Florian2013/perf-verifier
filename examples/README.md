# Examples

`slow.py` rebuilds the list on every iteration (`s = s + [i]`).
`fast.py` appends in place. Same printed output. Different cost.

```bash
python3 ../scripts/pf.py compare \
  --a 'python3 slow.py 8000' \
  --b 'python3 fast.py 8000' \
  --expect faster
```
