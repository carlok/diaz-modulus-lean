[← README](../README.md)

## What is assumed

Nothing beyond Lean's own three axioms: `propext`, `Classical.choice`,
`Quot.sound`. Every theorem in the library depends on those alone, and no
`sorry` appears anywhere; one would show up as `sorryAx`.

It used to be two more. `Axioms.lean` imported two classical transcendence
results as `axiom`, with citations, so that `#print axioms` made the boundary
between proved and assumed machine-checkable. Both are now proved, under the
same names and with the same statements, so nothing that used them changed.

- `hermite_lindemann` — if `u ≠ 0` and `exp u` is algebraic, then `u` is
  transcendental: the contrapositive of the usual statement. Proved from the
  Lindemann–Weierstrass development in `LindemannWeierstrass.lean`, which comes
  from mathlib PR #28013 by way of a Prove2Me submission. That module depends
  on Mathlib alone, which is what lets `Axioms.lean` import it without an
  import cycle through the rest of the library.
- `exists_ringHom_of_transcendental` — Steinitz: if `u` and `t` are both
  transcendental over a subfield `K` of `ℂ`, some ring endomorphism of `ℂ`
  fixes `K` pointwise and sends `u` to `t`. Proved from Mathlib's transcendence
  bases; the proof was accepted on Prove2Me before it was brought here.

The file keeps its name so the import graph and older references stay stable.
It no longer declares anything as an axiom.

A hypothesis is not an axiom. `MultiplicityEstimateElem` (`Diaz/MultiplicityEstimate.lean`), like the conjectures
above, is a `def` of a proposition; the results that need it take it as the argument `hME`, so `#print axioms` lists
only the three axioms for them too. Unlike the conjectures, it is proved: `Diaz.multiplicityEstimateElem`. The same
holds for `UnmixedHeight` (`Diaz/HilbertBox.lean`), the argument `hU` of the Hilbert side of `hME`, which
`DiazModulus.unmixedHeight_mvPolynomial` proves for polynomial rings over an algebraically closed field. So neither is
assumed by Roy's strong six exponentials theorem, `Diaz.strongSixExponentials`.

Gelfond–Schneider is proved too: `GelfondSchneider.gelfond_schneider` in
`Diaz/Mirror/gelfond_schneider.lean`. For a non-zero
logarithm `l` of an algebraic number and an algebraic irrational `b`, `exp (b * l)` is
transcendental. Since 24 September 2026 the proof is a tree of eleven modules, each a Prove2Me
node. It restructures the formalization of M. Karatarakis and F. Wiedijk
(arXiv:2603.24823; Apache 2.0), which the library first carried as a single 5,388-line module.

Two general tools:
- `Transcendence.liouville_house`: Liouville's inequality in house form, with an integer
  denominator;
- `Transcendence.expSum_first_nonvanishing`: the first non-vanishing derivative of an
  exponential sum at 1, …, m.

Eight steps of Gelfond's method, in `GelfondSchneider.`:
- `common_field`;
- `system_entry_house_le`;
- `aux_coeffs`, the Siegel step, through Mathlib's Siegel lemma over rings of integers;
- `deriv_identity`;
- `rho_denominator`;
- `rho_house_le`;
- `deriv_upper`, through the four exponentials subtree's grid estimate
  `Transcendence.expPoly_grid_estimate`;
- `main_estimate`.

The final theorem assembles the last of these with `common_field`. All together, 1,409 lines.
`scripts/gelfond_schneider_port/` still rebuilds the earlier single-file submission from
Karatarakis and Wiedijk's sources and lists every change.
Its first consumer is `salem_quartic_relations_of_logs`, the unconditional form of
`salem_quartic_relations` for a real and a purely imaginary logarithm of algebraic numbers. The
older statement keeps Gelfond–Schneider as its explicit hypothesis `hGS`. The others:
`recip_pi_log_rational_line` and `recip_pi_log_on_axis` (the exceptions to (S) form at most one
rational line, lying on an axis), `recip_pi_not_log_real_or_imag` (the two halves of (S) cannot both
fail), and `pi_log_two_or_pi_log_three_transcendental`. The first three are Diaz's Théorèmes 4
and 5 (J. Théor. Nombres Bordeaux 16, 2004) at `v = −1/π`. The six exponentials theorem gives
`two_three_five_pow_pi_transcendental`: at least one of `2^π`, `3^π`, `5^π` is transcendental.
The five exponentials theorem gives one of `2^π`, `3^π` (Waldschmidt,
*New Advances in Transcendence Theory*, 1988, (2.2.3)): `two_pow_pi_or_three_pow_pi_transcendental`
("The five exponentials theorem").

