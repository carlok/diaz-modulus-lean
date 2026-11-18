# Transcendence theory in Lean 4

This library proves classical theorems of transcendental number theory in Lean 4 with Mathlib, and
applies them to one open problem: Diaz's conjecture that a non-zero logarithm of an algebraic number never
has algebraic modulus.

It began as a study of that conjecture. Most of it is now the theory itself: the auxiliary-function
method of Gel'fond and Schneider, Siegel's lemma and Liouville's inequality, a Schwarz lemma for Cartesian products, zero counts for
exponential polynomials, and the theorems they prove. All 718 results build in CI and depend only on Lean's three
standard axioms (`propext`, `Classical.choice`, `Quot.sound`).

The proofs are engineered as well as checked: cut into small results that later proofs import, with
shared tools stated for general use, and with the size of every proof kept down. See [Proof engineering](docs/proof-engineering.md).

No new transcendence theorem is claimed. The library does have results of its own:
[chapter 14 of the blueprint](https://carlok.github.io/diaz-modulus-lean/chap-14-not-found-in-the-sources.html)
lists those not found in the sources read and ranks the ones that are not routine. Not found is not a claim
that they are new. The classical results are attributed below, and so are the Lean proofs written by others. The results about Diaz's conjecture are mostly negative: they show which methods
cannot settle it.

## Contents

The documentation is in [`docs/`](docs/); it was split from this README on 18 November 2026, unchanged.

- [The classical theorems](docs/classical-theorems.md): the table of classical results, with their sources and Lean names.
- [Proof engineering](docs/proof-engineering.md): the size rule, imports, shared tools, and the size waves.
- [Diaz's conjecture](docs/diaz-conjecture.md): the conjecture and the observation this library started from.
- [Dependency graph](docs/dependency-graph.md): generated from the sources.
- [What is proved](docs/what-is-proved.md), [what is assumed](docs/what-is-assumed.md) and [what is *not* proved](docs/what-is-not-proved.md).
- Results, round by round:
  - [classical developments](docs/results-classical.md): four exponentials in transcendence degree one, Waldschmidt 1973, Baker, Roy's theorem, five exponentials;
  - [Roy's rank bounds and DALAG §11–12](docs/results-roy-rank.md): *Variations*, *Further variations*, the linear algebra of DALAG §12.1, Fischler 2001;
  - [results on Diaz's conjecture](docs/results-diaz.md): configurations, hulls, barriers and dichotomies.
- [The companion note](docs/companion-note.md) and [the backup of the Prove2Me nodes](docs/prove2me-backup.md).
- [Design notes](docs/design-notes.md): why this model, and how it is realised in `ℂ`.
- [Method](docs/method.md): who wrote what, and what Lean does and does not check.

## Build

```bash
lake exe cache get && lake build Diaz
```

Lean 4.35.0, Mathlib v4.35.0.

## Where everything is

- `docs/` — the documentation, linked from "Contents" above.
- `Diaz/` — the Lean library. Everything here builds in CI.
- `archive/prove2me/` — every accepted Prove2Me proof for this mission, verbatim, not built.
- `archive/local/` — proofs written for the mission and never published on the platform, not built.
- `MIRROR_CHECKLIST.md` — which Prove2Me results are already in `Diaz/`. The goal is all of them, and it is met: the count is at the top of this README. It includes the four `Schanuel.*` results
  proved for the mission (six exponentials, Hermite–Lindemann, Lindemann–Weierstrass,
  Gelfond–Schneider) and `e_pi_transcendence`, another contributor's node closed with
  Gelfond–Schneider.
- `scripts/refresh_prove2me_archive.py` — refreshes the archive and regenerates the checklist.
- `tex/` — the companion notes. The note selects from the library; the library does not select.

## Palomar submission surface

This repository also carries the files the [Palomar
registry](https://palomar-registry.org/) requires. The Lean project is at the
repository root, so the project path is `.`.

| File | Purpose |
| --- | --- |
| `Challenge.lean` | The advertised statement surface, one deliberate `sorry` per theorem |
| `Solution.lean` | The proved counterparts, delegating to `Diaz` |
| `comparator.json` | The declarations Comparator compares |
| `formalization.yaml` | Project metadata to the mathlib-initiative standard |
| `tex/diaz-modulus.tex` | The earlier note, on the model and the negative result: the informal account of exactly these statements |
| `LICENSE` | Apache-2.0 |

The compared surface is the **axiom-free core**: `conj_eq_rho_div`,
`eqOn_hull`, `conj_comm`, `exists_algHom_of_transcendental`,
`no_vanishing_coeff_matrix`, `coeff_indistinguishable`, with the definitions
`hull` and `Hmat`. `#print axioms` on each lists only `propext`,
`Classical.choice` and `Quot.sound`.

Two differences from the development described above, both deliberate:

- The existence theorem is proved on `K⟮u⟯`, **not** on all of `ℂ`. Mathlib's
  `RatFunc.algEquivOfTranscendental` gives it without the Steinitz axiom, and
  nothing in the compared surface evaluates the map outside the hull.
- `hermite_lindemann` and `exists_ringHom_of_transcendental`, once imported as
  axioms, are now proved in `Diaz/Axioms.lean` and used elsewhere in the development. **No
  compared declaration depends on either.**

Submissions to Palomar go to <https://submit.palomar-registry.org/> and are made
by a responsible author or maintainer. Local verification:

```bash
lake build                                          # Diaz, Challenge, Solution
ruby scripts/validate-formalization.rb formalization.yaml
./scripts/verify-comparator.sh                      # Linux only: Landrun uses Landlock
```
