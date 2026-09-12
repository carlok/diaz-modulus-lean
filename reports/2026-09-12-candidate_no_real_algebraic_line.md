# Run report — cheap line exclusion

- **Date** — 2026-09-12
- **Mission** — Diaz's modulus conjecture, `3045e100-83a7-4863-9c02-21f90105f182`
- **Statement** — **(B)** Cheap line exclusion
- **theorem_name** — `DiazModulus.candidate_no_real_algebraic_line`
- **theorem_id** — `e561bb83-10d1-42d0-b2aa-1d5fb8d4a1d9`
- **submission** — `02f87c60-27d0-4c05-ab14-a06fa9c7201a`, **ACCEPTED**
- **Platform** — <https://prove2.me/theorems/e561bb83-10d1-42d0-b2aa-1d5fb8d4a1d9>

## What was proved

For a Diaz candidate `u = x + iy`, no relation `A x + B y = C` holds with
`A, B, C` real algebraic and `(A, B) ≠ (0, 0)`. Hermite–Lindemann is imported as
the platform theorem `DiazModulus.hermite_lindemann_holds`, not left as an open
hypothesis.

## How

A real algebraic line meets the algebraic circle `X² + Y² = |u|²` only in
algebraic points. If `A ≠ 0`, substitute `x = (C − B y)/A` into the circle; the
quadratic in `y` has leading coefficient `A² + B² ≠ 0` (real, not both zero).
Completing the square puts `(2α y + β)²` in `Q̄`, so `IsAlgebraic.of_pow` makes
`2α y + β` algebraic and then so is `y`, hence `x`. If `A = 0` then `B ≠ 0` and
`y = C/B` is algebraic, so `x² = |u|² − y²` forces `x` algebraic the same way.
Either way `u` is algebraic, contradicting Hermite–Lindemann against algebraic
`eᵘ`.

## Duplicate and vacuity

Duplicate `q=` scans for `candidate_no_real_algebraic_line`, `cheap_line`,
`no_real_algebraic_line`, `distance_to_algebraic`, and related fragments returned
no prior node; the only related hit was the stronger Baker statement
`DiazModulus.no_algebraic_generalized_line` (already Proved). Vacuity: without
`IsCandidate` the exclusion fails on the witness `u = 1`, line `X = 1`;
`IsCandidate` is the expected three-clause conjunction.

## Mirror

- Lean: `Diaz/CheapLine.lean` → `Diaz.candidate_no_real_algebraic_line`
- `#print axioms`: `propext`, `Classical.choice`, `Quot.sound`
- Companion note: Remark `rem:line-cheap` marked Proved; not-formalised count
  reduced from three to two; appendix `\nolinkurl` statuses re-checked against
  the live board (no mismatches). Corollary `cor:distance` (statement A) left
  Not formalised.

## Frontier

Open leaves unchanged and untouched: `norm_transcendental_of_generic_conj_pair`,
`recip_pi_not_log_real_gamma`, `four_exponentials_trdeg_one`,
`recip_pi_not_log_imag_gamma`. Statement **(A)** was not started.

## Stop

One node only, as briefed.
