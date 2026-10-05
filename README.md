# Perf Verifier

## Stop trusting "I made it faster."

AI coding agents love to say they optimized your code. Most of the time they
speeded up the wrong thing, stopped at the first patch that passed, or quietly
changed the output.

**Perf Verifier makes Claude prove it.**

Install it once, and every time you say "make this faster", Claude will:

- **Profile first**: find the real bottleneck, and tell you the maximum speedup possible
- **Measure before and after**: alternating runs and a statistical test, not a single lucky timing
- **Check the output didn't change**: and run your tests
- **Show how it scales**: so a quadratic that became linear is real, not a fluke
- **Refuse to claim a speedup it can't show**

### What you get

One small Python script, zero dependencies, runs 100% locally.

Read the whole thing in five minutes, then decide.

### Install (30 seconds)

1. Download [`perf-verifier.skill`](./perf-verifier.skill) (or run `sh pack.sh` after cloning)
2. Upload it in Claude's Skills settings
3. Ask Claude to optimize something

Free, MIT licensed. If it saves you from one fake optimization, it paid for itself.

---

## Use it without Claude

Needs only Python 3 (Linux or macOS).

```bash
python3 scripts/pf.py bench --cmd 'python3 examples/slow.py 8000'
python3 scripts/pf.py profile -- python3 examples/slow.py 8000
python3 scripts/pf.py scan examples/
python3 scripts/pf.py scale --sizes 2000,4000,8000,16000 --cmd 'python3 examples/slow.py {N}'
python3 scripts/pf.py compare --a 'python3 examples/slow.py 8000' --b 'python3 examples/fast.py 8000' --expect faster
python3 scripts/pf.py check --cmd 'python3 examples/fast.py 8000' --expect faster
```

`PF` in the skill means `python3 scripts/pf.py`. `--cmd` takes the command as one quoted string; everything after a bare `--` is also read as the command.

### Reading the verdict

- `FASTER` / `SLOWER`: the difference passed the test (p < 0.05) and exceeded the measured noise. Only `FASTER` supports saying "faster".
- `NO MEASURABLE DIFFERENCE`: the change did nothing you can show.
- `OUTPUT DIFFERENT`: the two versions print different results. This is a failure, not a speedup.
- `NOT PROVEN` and `UNMEASURED` mean no claim of speedup is allowed.

Full workflow: [`SKILL.md`](./SKILL.md).

## Why this exists

Language models write code that is slower than expert code, and coding agents
optimising real repositories fail in three documented ways: they optimise
something that is not the bottleneck, they stop after the first patch that
passes, and they do not test enough, so results change. In a 30-run study with
a Mann-Whitney test, only about 6% of solutions labelled "faster" were
measurably faster.

This repo gives you numbers instead of a feeling.
