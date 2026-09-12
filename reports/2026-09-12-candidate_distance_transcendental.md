# Run report — distance to an algebraic point

- **Date** — 2026-09-12
- **Mission** — Diaz's modulus conjecture, `3045e100-83a7-4863-9c02-21f90105f182`
- **Statement** — **(A)** Distance to a non-zero algebraic point
- **theorem_name** — `DiazModulus.candidate_distance_transcendental`
- **theorem_id** — `2ccd6ba0-97b2-4e09-8a47-2102927ddcf9`
- **submission** — `ecfd43ca-2ed4-4ae9-acb0-78448568fd01`, **ACCEPTED**
- **Platform** — <https://prove2.me/theorems/2ccd6ba0-97b2-4e09-8a47-2102927ddcf9>

## What was proved

For a Diaz candidate `u` and every non-zero algebraic `a`, the distance
`|u - a|` is transcendental over `ℚ`. Equivalently: a candidate lies on no
circle of algebraic radius about a non-zero algebraic centre.

## How

Polarization: if `|u-a|` were algebraic then so would be
`2 Re(conj(a)·u) = |u|² + |a|² - |u-a|²`, an affine real-algebraic line
`A x + B y = C` with `(A,B) ≠ (0,0)`. That contradicts the cheap line
exclusion `DiazModulus.candidate_no_real_algebraic_line` (B,
`e561bb83-10d1-42d0-b2aa-1d5fb8d4a1d9`), which the proof imports. The
exclusion of `a = 0` is essential (`|u|` is algebraic by hypothesis).

## Duplicate, vacuity, composition

Duplicate `q=` scans for `candidate_distance_transcendental`,
`candidate_distance`, `distance_to_algebraic`, and related fragments returned
no prior node.

Vacuity: without `a ≠ 0`, `|u-0| = |u|` can be algebraic; without
`IsCandidate`, the witness `u = 2`, `a = 1` has algebraic distance `1`.

**Composition / one-step implication.** Statement (A) is a one-step corollary
of (B) via polarization: any algebraic `|u-a|` would produce a forbidden
real-algebraic line through the candidate. Publishing (A) remains appropriate
as a named corollary with a distinct geometric reading (circles about algebraic
centres); the hypothesis profile is not lighter than (B), it simply specialises
it. The stronger Baker line exclusion
`DiazModulus.no_algebraic_generalized_line` would also block the same line for
logarithms off the axes, but (B) is the clean candidate-only input.

## Mirror

- Lean: `Diaz/Distance.lean` → `Diaz.candidate_distance_transcendental`
- `#print axioms`: `propext`, `Classical.choice`, `Quot.sound` (no `sorryAx`)
- Companion note: body of Cor.~\ref{cor:distance} and Rem.~\ref{rem:line-cheap}
  say only "machine-checked" (platform identifiers confined to Appendix A);
  Cor.~\ref{cor:distance} marked Proved in the appendix; not-formalised count
  wording dropped; `\nolinkurl` statuses re-checked against the live board
  (all Proved/Open rows match; conjecture and Hermite–Lindemann rows as before).

## Frontier

Open leaves unchanged and untouched: `norm_transcendental_of_generic_conj_pair`,
`recip_pi_not_log_real_gamma`, `four_exponentials_trdeg_one`,
`recip_pi_not_log_imag_gamma`. No further node started.

## Stop

One node only, as briefed.
