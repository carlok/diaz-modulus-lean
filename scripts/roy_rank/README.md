# Scripts for `tex/diaz-roy-rank-three.tex`

These are the computations cited by the research note *Roy's rank bound at low rank over monomial spaces and hulls at a Diaz
candidate*. None of them is a formal proof. The note says, step by step, which claims rest on them.

`math/` and `search/` are the original derivations. `hull/` is the rank-three argument for the hull. `referee_a/`, `referee_b/`
and `referee_c/` were written separately by three independent referee agents (A read Sections 2-4 of the note, B read Sections 5-6,
C read Section 7).

## Tools

Runtimes below were measured on an Apple M3 Pro, one job at a time.

| Tool | Version used | Needed by |
|---|---|---|
| Python | 3.14.7 | everything |
| sympy | 1.14.0 | `hull/` (except the scans and `budget_in0.py`), `referee_c/c1_m0.py`, `c4_m1.py` |
| numpy | 2.5.3 | `referee_a/`, `referee_c/c2_scan.py`, `c6_arc.py` |
| kissat, cadical | 4.0.4, 3.0.1, on `PATH` | `search/` |
| clang | 21.0.0 | `referee_c/c5_direct.c` |

All folders except `search/` write nothing but stdout (and Python's `__pycache__`, unless disabled). They import from their own
folder, so run them from there, under any Python that has the packages above:

```bash
export PYTHONDONTWRITEBYTECODE=1
cd scripts/roy_rank/hull
uv run --with sympy --with numpy python hand_check.py    # add --offline once uv has the packages in its cache
```

Plain `python3` is enough for scripts that need neither sympy nor numpy.

`search/` writes JSONL logs and a `models/` folder in the current directory, so run it from a scratch directory, with the
folder on `PYTHONPATH`. From the repository root:

```bash
export ROY=$PWD/scripts/roy_rank PYTHONPATH=$PWD/scripts/roy_rank/search PYTHONDONTWRITEBYTECODE=1
cd "$(mktemp -d)"
python3 $ROY/search/d_slot.py S4 117 2 300 kissat log.jsonl 4,5
```

Commands in the `search/` table below are written without the `$ROY/search/` prefix.

## `math/`

| Script | What it does | Expected output | Time |
|---|---|---|---|
| `sanity.py` | (P) for the named sets; the 5 x 8 example of Section 5.1; random colour models at rank two | `\|Sigma\| = 20  (P) holds: True`; `(star) holds on all W: True`; `trials=300000  models satisfying (star)=85628  of those with (P)=0`. Part 4 only prints a remark | 4 s |
| `finite_checks.py` | c(delta), B_k, Bfree_k, every inequality of Theorems 3 and 4, the (5,8) weight check, for S, S1 and in0 | S: B_4..B_7 = 12, 18, 26, 35, `all hold: True`, `row tuples tested = 304, weight assignments = 0`. S1: Bfree_4..7 = 8, 13, 19, 25, `all hold: True`. in0: B_5 = 20, B_6 = 29, `all hold: False`, as expected: the count for S does not close over in0 | 2 s |

## `hull/` (Section 7)

| Script | What it does | Expected output | Time |
|---|---|---|---|
| `liftlib.py` | Library: the matrix M0 and the order-by-order lift | | |
| `first_order.py` | M0, kernels, the tangent table by grade | `dim T_{M0} X_0 (all grades)= 88`; grade 1 `cokernel dim 0` | 2 s |
| `hand_check.py` | The 4 x 4 certificate with all coefficients free | `a*(T^4) - (T^5) - a^2*(T^3) = -2*a**3` | 1 s |
| `schur_check.py` | Gauge-free elimination on three pivots | leftover at grade 2: 0; at grade 3: constants times `a**3` | 3 s |
| `m0_lift.py` | Order-by-order lift, symbolic a, b, with robustness runs | grade 3 obstructions `2*a**3`, `-4*a**3`; none through grade 6 at a = 0 | 2 s |
| `quadrics.py` | dim I_2 for V(c,c'), in0, S | 2, 3, 2 | 1 s |
| `budget_in0.py` | c(delta), B_k and the count for in0 | `all excluded for 7<=d<=30: True`. Two lines at d = 6 read `excluded False`, as expected: d = 6 rests on the scan | 1 s |
| `scan_in0.py NAME d` | Exhaustive graded scan, NAME in `in0 S inf S1 I2 I3` | `in0 5`: 3773 tuples, 1 hit, lines {0,2,3}, {1,3,4}, l = 8. `in0 6`: 28812 tuples, 0 hits | 1 s, 15 s |
| `scan_controls.py` | Cross-checks of the scan | the 5 x 8 configuration passes with l = 8 and not with a line removed; in_inf: 1 hit at d = 5, 0 at d = 6 | 16 s |
| `vpp_control.py` | M1 over V''_b, b = 1, -3 | `entries in V'': True`, rank 3, `nonzero 4x4 minors: 0`, `min (l-c)/f = 8/5` (sampled) | 4 s |
| `controls.py` | Lift controls: spaces where M0 must lift, rank-one spaces | no obstruction where a lift exists; obstruction `k1 + 3*k2*k3 + 2*k3**3` for the general rank-one tail | 5 s |

## `referee_a/` (Section 8.3)

`lib_a.py`, `sample_nongraded_lib.py` and `gmax.py` are libraries. The first argument of the three samplers is a seed and the second a
time budget in seconds. The seeds and budgets of the runs quoted in the note were not recorded, so a rerun gives other counts of the
same kind. Only the absence of violations is reproducible.

| Script | What it does | Note's figures, original run | Rerun | Time |
|---|---|---|---|---|
| `sample_nongraded.py SEED SECONDS` | Non-graded matrices of rank at most 2 against the exhaustive graded maximum | 2963 with theta > 0, on 9 sets Sigma, 2612 with equality, `violations 0` | `1 20`: 281 samples, `violations 0` | SECONDS |
| `rank3_search.py SEED SECONDS` | Search for the promised graded matrix at rank 3 | 290 of 290 found, on 7 sets Sigma | `1 20`: `not found: 0` | SECONDS |
| `sample_hull.py SEED SECONDS` | Rank at most 2 over V(c,c), c in 1, 2, -1, 3 | 4341 matrices, `violations 0 failures 0` | `1 20`: `violations 0 failures 0` | SECONDS |
| `thm2_exhaust.py` | Theorem 2, exhaustive over graded configurations, weights in [0,14], d at most 6, and over subsets of [0,9] | S, in0, in_inf, S1: 548590 configurations each, `fails 0`; S2: 336 fails; subsets with (P): 196, 0 failures; without: 176, all with a rank-2 failure | reproduced: `subsets P 196 with failure 0 \| nonP 176 with rank-2 failure found (d<=4) 176` | 2 min |

## `referee_b/` (Sections 5-6 and 8.2)

| Script | What it does | Expected output | Time |
|---|---|---|---|
| `exact.py` | Exact test for a concrete graded matrix; the 5 x 8 example | rank 3, theta 8/5, 304 tuples, 288 + 16, pair multiplicities sum to 16 | 3 s |
| `in0_hit.py` | M0 over in0, exactly | `rank 3`, `theta 8/5`, `fails True`, `stable: True` | 1 s |
| `finite_b.py` | c(delta), B_k, Bfree_k, the (5,8) check | as in `math/finite_checks.py`, plus B_8 = 44 and a scan with no +-D assumption: `with 8 distinct column weights:0` | 31 s |
| `ineq.py` | Every inequality of Sections 5-6, to d = 2000 | `all True`; min cost at d = 5, l = 8: 24, 20, 16 | 1 s |
| `attack.py control` | Controls of the enumeration | 1 hit on the Sigma of Section 5.1; 2223, 482, 34, 0 hits on the intervals | 1 s |
| `attack.py SET d LIMIT [MINL]` | Enumeration, SET in `S In0 S1`. S and S1 are taken modulo reflection, In0 is not. MINL skips tuples whose upper bound for l is below it | `S 4`: 396 configurations, 1428 states. `S 5`: 3232, 23688. `S 6`: 27040, 218131. `S 7`: 231168, 1911442. `S 8 LIMIT 8`: 1969920, 17401711; without MINL: 21052569 states. All 0 hits. `In0 5`: 3773, 29628, 1 hit. `In0 4`, `6`, `7`: 490, 1686; 28812, 239876; 218491, 1839016; 0 hits. `S1 4`-`7`: 15, 0; 34, 113; 70, 295; 156, 558; 0 hits | under 1 s up to d = 5; 3 s at d = 6; 30 s at d = 7; about 6 min at d = 8 |
| `crosscheck.py N` | The abstract test against exact linear algebra | `disagree 0` | 4 s at N = 20 |
| `randgen.py LIMIT` | Random exact trials with no structural assumption (sampling) | no hit | LIMIT seconds |
| `freeattack.py LIMIT NAME` | Free entries by sampling, NAME in `S S1 S2` | no hit for S and S1; hits for S2 | LIMIT seconds |

## `referee_c/` (Sections 7 and 8)

| Script | What it does | Expected output | Time |
|---|---|---|---|
| `c1_m0.py` | M0 from the row geometry, tangent against gauge by grade, stability, End, the certificate | `total tangent 88 total gauge 88`, `all grades tangent == gauge: True`, `End dim = 1`, `a*E4-E5-a^2*E3 = a**3/4` (this script's frame scales columns differently) | 1 s |
| `c2_scan.py d [S]` | Own exhaustive scan | d = 5: 1 hit. d = 6: 0. d = 7: 218491 tuples, 8389 spaces, 0 hits | 1 s, 1 s, 55 s |
| `c3_budget.py` | Budgets and the count for in0 and S | B_4..B_9 = 12, 20, 29, 38, 48, 58 for in0; d = 6 not all excluded; d = 7 onwards all excluded | 40 s |
| `c4_m1.py` | M1 for b = 1, -3, 5/7, blow-up test modulo a prime; dim I_2 | rank 3, blow-up rank (40, 40); dim I_2 = 2 on V(c,c'), 3 on in0 and V'' | 2 s |
| `c6_arc.py` | Arc test with all 200 coordinates free, modulo a prime | operator rank 112 at every order; order 3 inconsistent for a != 0; consistent through order 4 for a = 0 | 23 s |
| `c5_direct.c` | Direct search over V(c,c'), modulo 2^31 - 1. `clang -O2 -o c5 c5_direct.c`, then `./c5 ALPHA BETA CP [NGRID] [SECONDS] [GSTOP]`, for v3 = ALPHA T^4 + BETA T^3 and v4 = T^-4 + CP T^-3, so c = BETA/ALPHA. Limited scope: see Section 8.3 | see the table below | see below |

The arguments of the `c5_direct.c` runs in Section 8.3. The original output files did not record them; these were found by matching the
pairs tested per initial choice, and every line below was reproduced exactly with these arguments. NGRID is the number of coefficients tried, from the list 1, -1, 2, a or 3, b or 5. GSTOP
stops after that many initial choices; it was added to reproduce runs that the original stopped by a time limit of 300 s.

| Space | Arguments | Initial choices | Pairs tested | `semistable` |
|---|---|---|---|---|
| in0 | `0 1 0 1` | 512 of 512 | 1193984 | 120 |
| in0 | `0 1 0 2` | 512 of 512 | 4325376 | 409 |
| in0 | `0 1 0 3` | 512 of 512 | 9394176 | 874 |
| V''_3 | `0 1 3 3 3000 2031` | 2031 of 2589 | 208563390 | 8580 |
| V(1,0) | `1 1 0 3 3000` | 2362 of 2362 | 214890036 | 0 |
| V(1/2,1) | `2 1 1 3 3000 960` | 960 of 5441 | 214859520 | 0 |
| V(2,3) | `1 2 3 3 3000 971` | 971 of 5429 | 216919458 | 0 |

## `search/` (Section 8.1)

`encode.py` is the CNF encoder and `solve.py` runs one instance. `verify_exact.py` and `realise.py` turn a SAT model into an
exact matrix and test it. The verifier shares no code with the encoder.

| Command | What it does | Expected output | Time |
|---|---|---|---|
| `test_counters.py` | Cardinality counters, exhaustively | `counter checks 14336 bad 0` | 1 s |
| `test_verifier.py` | The verifier on hand cases, V1 against V2 | `no V1/V2 inconsistency` | 14 s |
| `rank1_brute.py` | Rank one over S, exhaustive | `rank-one failures over S4 (A,B): []` | under 1 s |
| `d_slot.py S4 117 W 1800 SOLVER LOG 4,5,6,7,8,9,10,11,12,13,14,15` | The main rank-three run. Use SOLVER = `kissat` and `cadical` | all UNSAT. In one run: d = 4 about 1.5 s, d = 5 about 5 s. All 12 values of d took 717 s (kissat) and 798 s (cadical) of CPU under load | see left |
| `d_slot.py S4 77 W 1800 SOLVER LOG 3,4,5,6,7,8,9,10 10 2` | The rank-two run. See also `more_runs.py` | all UNSAT | seconds |
| `d_pos.py`, `families.py`, `families2.py` | Position layout; which subspaces the refutation needs | all UNSAT except the removals noted in the code | minutes |
| `more_runs.py 7` | Growth table, rank two at the full window, no-WLOG runs, sets near S | sets near S: `S4p2`, `S4p3`, `S2x3`, 9 of 9 SAT and confirmed; no-WLOG runs UNSAT. From the original log; not rerun for this note | about an hour |
| `controls.py 6` | Positive and negative controls | S2, rank 3: 6 SAT, all confirmed, 1 UNSAT at d = 4; S1 UNSAT; S4 at small windows UNSAT | seconds |
| `s2_models.py 2` | S2, rank 3: d = 4-15, 8 solver seeds, 2 layouts | 128 SAT, all confirmed. With the 6 above: the note's 134. 64 UNSAT | minutes |
| `test_inject.py 300 W` | Encoder against hand-built matrices | `('fail', 'SAT'): 47, ('holds', 'UNSAT'): 103`; reproduced | 2 min |
| `test_inject2.py 500 W` | Same, normalised, scaled, two layouts | `('slot', 'SAT'): 101, ('pos', 'SAT'): 58`; reproduced | 1 min |
| `test_brute_r2.py 120 1` | Rank two against an exhaustive search | `agree 550 disagree 0 positives 223`; reproduced | 1 min |
| `control_x.py`, `test_inject_x.py 300 1` | The machinery for free entries (needs sympy) | models confirmed; hand-built failures SAT | minutes |
| `check_rup.py FILE.cnf FILE.drat SECONDS` | Forward RUP checker | see below | 1 min |

The structural probe needs sympy. The counts in the note come from the logs of the original runs, not from a rerun, and two of the
scripts were stopped by hand, so their full argument ranges go beyond what was run:

| Command | Part that was run | UNSAT |
|---|---|---|
| `probe_c.py 8 4 20 300 7` | S1, rank 2, windows 2-8, d = 3-20; rank 3, windows 2-4, d = 4-20 | 126, 51 |
| `probe_c2.py 2 900` (stopped) | S1, rank 3, windows 5, 6, d = 4-24; window 7, d = 4-14 | 42, 11 |
| `probe_c4.py 4` | S1, rank 2, windows 10, 12, d = 3-24 | 44 |
| `probe_c3.py 3 600` (stopped) | S1 with larger masses, rank 2 and rank 3 | 15, 8 |
| same | S with free entries: rank 2, windows 4, 6, 8, d = 3-12; rank 3, windows 3, 4, d = 4-18; window 5, d = 4-13 | 30, 30, 10 |

The total for S1 is 297 and for S is 70. One further S record, window 5, d = 15, is `timeout` at 74 s, because the run was stopped there.


To regenerate and check the one DRAT proof the note mentions (no proof files are stored here), with the environment set up as above:

```bash
python3 -c 'from encode import Enc; Enc([-4,-1,0,1,4],3,4,w=117,layout="slot",Nr=4,Nc=15).c.write("s4.cnf")'
cadical -q --check s4.cnf s4.drat
python3 $ROY/search/check_rup.py s4.cnf s4.drat 1500
```

Expected: `verified: empty clause derived after 173877 of 520597 additions`. This reproduces the original proof byte for byte (same CNF,
same DRAT file, cadical 3.0.1). Without `--check`, cadical writes a different proof, and the checker reports 173841 of 520525. `cadical`
exits with code 20 on UNSAT.

## Not here

- Logs, models, proof files, `.out` files.
- Scripts the note does not rely on: exploratory or numerical ones, table generators that need the logs, and referee A's calibration
  and lacunary tests.
