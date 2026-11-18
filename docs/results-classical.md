[← README](../README.md)

## Four exponentials in transcendence degree one

`Diaz/Mirror/` carries a complete proof of the four exponentials theorem in transcendence
degree one, as `DiazModulus.four_exponentials_trdeg_one`. In the form the node
states it: take a 2×2 matrix of non-zero logarithms of algebraic numbers with
`l₁₁l₂₂ = l₁₂l₂₁`, and suppose the field they generate has transcendence degree
at most one; then its rows or its columns are `ℚ`-dependent. Equivalently, two
`ℚ`-independent pairs `x₁, x₂` and `y₁, y₂` whose four products `xᵢyⱼ` are all
logarithms of algebraic numbers generate a field of transcendence degree at
least two. The theorem is classical, proved independently by Brownawell (1974)
and Waldschmidt (1973); no new mathematics is claimed for it.

The route is Waldschmidt's 1973 proof together with the toolbox of his 1971
paper, so it needs neither a lower bound for linear forms in logarithms nor
Philippon's zero estimate. The printed 1973 proof meets one hypothesis of its
Lemme 2 with Gel'fond's two-logarithm bound, which Baker generalised; the
separation-free zero count of 1971 makes that hypothesis unnecessary:

- `transcendence_criterion` — Gel'fond's criterion in the 1971 form: a number
  approximated well enough by integer polynomials of controlled degree and
  height is algebraic. Under it, `small_irreducible_factor`, `height_dvd_le` and
  the resultant bound.
- `expPoly_zero_count` and its scaled form — Tijdeman's count of the zeros of an
  exponential polynomial in a disc, with no separation hypothesis on the
  frequencies. This is what replaces Baker.
- `cauchy_estimate_with_zeros` and `extrapolation` — the Schwarz step: high-order
  vanishing on a small grid makes the derivatives tiny on a grid fourteen times
  larger.
- `trdeg_one_presentation`, `aux_linear_system`, `siegel_aux` — the arithmetic of
  the auxiliary function: write everything over `ℤ[ω, ω₁]`, turn the vanishing
  conditions into an integer linear system, and solve it by Siegel's lemma.
- `norm_to_polynomial_alg` — the value becomes an integer polynomial in one
  variable, small at `ω`. Instead of taking a norm, it takes the determinant of
  multiplication modulo the minimal relation, which avoids building the field
  extension at all.
- `construction_core_1973`, `auxiliary_construction`,
  `small_polynomials_of_counterexample`, `rank_one_parametrization`,
  `construction_growth`, `construction_count_1973` — the assembly and its
  bookkeeping.

The theorem settles one case of the conjecture's branch structure
(`DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult`).
What still blocks that branch is one statement about `1/π`: the real half of
(S), that `e^{-iγ/π}` is transcendental for real algebraic `γ ≠ 0`. Until
2026-09-23 the imaginary half was carried too. Both branches that reach (S)
produce a real `γ`, and two new reductions record this, so the imaginary half
is no longer needed. By `DiazModulus.recip_pi_not_log_real_or_imag`, the two
halves cannot both fail.

The theorem has consequences beyond that case, all in `Diaz/Mirror/`:

- `log_pair_rigid_of_trdeg_one` — two non-zero logarithms `u, v` with
  `|u|²/|v|²` rational, and `u, ū, v, v̄` of transcendence degree at most one,
  satisfy `v ∈ ℚu ∪ ℚū`. For `K = Q̄` this is an unconditional and stronger form
  of the conditional `quadric_trdeg_two`; `quadric_trdeg_two_alg` (milestone 183)
  states that form, with `quadric_trdeg_two`'s hypothesis `hIU` dropped.
- `candidate_monomial_not_log` — for a candidate `u`, `e^{c u^k}` is
  transcendental when `k ≥ 2` and `|c|²|u|^{2(k−1)}` is rational. One example
  is `e^{u²/|u|}`. It is the unconditional part of the exclusion
  `u² ∉ ℒ̃`, which needs Roy's strong six exponentials theorem.
- `geometric_triple_not_logs` — `w`, `wz`, `wz²` are not all logarithms of
  algebraic numbers when `z ∉ ℚ` and `trdeg ℚ(w, z) ≤ 1`. Hence
  `exp_pi_sq_or_exp_i_pi_cube_transcendental`: at least one of `e^{π²}` and
  `e^{iπ³}` is transcendental. Both are classical: Waldschmidt, *Nombres
  transcendants* (LN 402, 1974), Cor. 7.4.3, and Waldschmidt, J. Number Theory 5
  (1973), Cor. 2, found independently by Brownawell (1974).
- `diaz_number_forces_transcendence` — if `t² + π²` is algebraic for a real
  logarithm `t`, then `e^{it²/π}`, `e^{π²/t}` and `e^{(t²+π²)/(iπ)}` are
  transcendental. Hence `log_two_diaz_or_transcendental`: **at least one of
  `√((log 2)² + π²)` and `2^{i log 2/π}` is transcendental.** The first number is
  the smallest open instance of Diaz's conjecture. The third conclusion says that
  the two remaining open boundary statements cannot fail at the same number.
  Stronger forms of the first two conclusions are classical: they need only `t`
  algebraic over `ℚ(π)` (LN 402, p. 202), so `2^{i log 2/π}` is transcendental
  as soon as `log 2` and `π` are algebraically dependent.
- `recip_pi_or_pi_cube`, `exp_i_div_pi_or_exp_i_pi_cube_transcendental` — each
  instance of (S) has a partner; at least one of `e^{i/π}` and `e^{iπ³}` is
  transcendental. Classical: Waldschmidt 1973, Cor. 4 and the remark after it.
- `candidate_harmonic_not_log` — for a candidate, `|u|²/(pu + qū)` is not a
  logarithm of an algebraic number; in particular neither is the harmonic mean
  of `u` and `ū`.

With the six exponentials theorem, two candidates of commensurable moduli supply
the dimension that one candidate lacks. `log_ratio_multipliers` identifies what
`u/v` multiplies back into ℒ. `candidate_quotient_rigid` and
`candidate_product_relation_trivial` prove that the arguments of the candidates
on a circle of algebraic radius form a Sidon set up to conjugation, which is the
first constraint on algebraically independent families of candidates.
`candidate_neg_one_pow_ratio` makes `(−1)^{u/ū} = e^{iπu/ū}` transcendental for
every candidate. The duality `log_square_duality`, the `ℚ`-linear form of
Diaz 2007, Corollaire 4(3), gives `two_pow_log_three_or_three_pow_log_two`: at
least one of `2^{log₃2}` and `3^{log₂3}` is transcendental.

At rational squared moduli the theorem gives four statements of 29 September 2026. None of them
was found in the sources read, and each follows from the theorem in a few lines.
`nongeneric_rational_modulus_orbit`: logarithms of algebraic numbers that are algebraic over
`ℚ(π)` and have rational squared modulus are rational multiples of one another, up to
conjugation. `torsion_rational_modulus_unique`: at most one pair `±t` with `e^t` algebraic makes
`t² + π²` rational, so `log_two_log_three_not_both_rational`: `(log 2)² + π²` and
`(log 3)² + π²` are not both rational. `recip_pi_log_of_torsion_rational_modulus`: a rational
value of `t² + π²` would make `e^{iγ/π}` transcendental at every rational `γ ≠ 0`, so Diaz's
conjecture at `t + iπ` and the statement (S) cannot both fail at rational data. With
Waldschmidt's 1973 theorem in its algebraic-independence form carried as a hypothesis,
`pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi` specialises it: if `e^{ir/π}` is algebraic for a
rational `r ≠ 0`, then two of `π`, `e`, `e^{π²}` are algebraically independent. The next section
proves the theorem, and `pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi_algebraic` drops the hypothesis.

### Waldschmidt 1973, and Schneider's eighth problem

`DiazModulus.two_algebraically_independent_of_exp_column` is the Théorème of Waldschmidt 1973 in full:
if `x₁, x₂` and `y₁, y₂` are `ℚ`-independent and one column, `e^{x₁y₂}` and `e^{x₂y₂}`, is algebraic,
then two of the eight numbers `xᵢ`, `yⱼ`, `e^{xᵢyⱼ}` are algebraically independent. Brownawell found it
independently (1974). It reuses 33 nodes of the four exponentials development above unchanged. Twelve
new nodes carry the column case, where `e^{x₁y₁}` and `e^{x₂y₁}` are only algebraic over `ℚ(ω)`, so
their powers cost degree. They are sampled along the short side of the interpolation grid, where the
degree budget absorbs them. Three consequences follow:

- `Transcendence.exp_e_or_exp_e_sq_transcendental` — Schneider's eighth problem, which gave the 1973
  paper its title: at least one of `e^e` and `e^{e²}` is transcendental.
- `DiazModulus.algebraicIndependent_e_pi_of_exp_pi_sq_algebraic` — if `e^{π²}` is algebraic, then `e`
  and `π` are algebraically independent (Corollaire 1 at `α = −1`).
- `DiazModulus.pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi_algebraic` — the previous section's
  specialisation, now unconditional.

No new mathematics is claimed for any of them.

### Baker's theorem, by Schneider–Lang in several variables

Twenty-five nodes of 2 October 2026 prove Baker's theorem in its qualitative, inhomogeneous form: if
`l₁, …, lₙ` are logarithms of algebraic numbers, linearly independent over `ℚ`, then
`b₀ + b₁l₁ + ⋯ + bₙlₙ ≠ 0` for algebraic `b₀, …, bₙ` not all zero. On the platform this is
`Schanuel.baker_linear_forms_in_logarithms`, which had been Open; here it is
`Transcendence.baker_linear_forms_in_logarithms`. The route is the one Bertrand and Masser found (1980),
as Waldschmidt writes it in Chapter 4 of *Diophantine Approximation on Linear Algebraic Groups*:

- `Transcendence.schneider_lang_cartesian` — the criterion of Schneider–Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}`
  with `d₀ ≤ 1` (the book's Corollary 4.2), proved directly as in §4.6: Siegel's lemma, Liouville's
  inequality, a Schwarz lemma, and the first derivative that does not vanish. No zero estimate is needed.
- `Transcendence.cartesian_schwarz` — a Schwarz lemma for Cartesian products (the book's Proposition 4.7),
  from one-variable Hermite division, telescoped over the coordinates. Mixed derivatives are lists of
  directions, matched with `iteratedFDeriv` by `Transcendence.partials_eq_iteratedFDeriv`.
- `Transcendence.baker_number_field_basis` — the book's Theorem 4.5: Baker's theorem for a basis of a
  number field, through its trace form.
- `DiazModulus.baker_two_logs` — the two-logarithm form that the nodes below had assumed as `hB`.

Step 5 of §4.6 needed a repair: vanishing to a given order in each coordinate does not survive the change
of variables the proof makes, while vanishing to a given total order does; only the constants change.
M. Karatarakis's Lean formalisation of the same chapter makes the same repair. It is on the branch `baker`
of github.com/mkaratarakis/mathlib4, public since 25 September 2026 and not yet in Mathlib, and formalises
Baker's theorem by the same route, the book's Corollary 4.2 for every d₀ ≤ n, and Proposition 4.7; his
branch `baker-padic` formalises Brumer's p-adic analogue. A survey of the other provers on 4 October 2026
found none of these results elsewhere. The 25 proofs total 3,320 lines; the largest is 261.

No new mathematics is claimed.

### Roy's theorem from a multiplicity estimate

Twenty-six nodes of 29 October 2026 prove Roy's strong six exponentials theorem (Roy 1992, Cor. 2; DALAG Cor. 11.16)
from one explicit hypothesis, `hME : MultiplicityEstimateElem` (`Diaz/MultiplicityEstimate.lean`). The proof follows
DALAG: Roy's map Υ (§11.6.2) and the linear subgroup theorem, Th. 11.21 (§11.7.1). The theorem is classical, and
this is a formalisation of its known proof.

- **The hypothesis.** `MultiplicityEstimateElem` is the case G⁻ = {e}, G⁺ = G of the multiplicity estimate of DALAG
  Th. 8.1 (Philippon 1986), for G = 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}, written in coordinates. It is a `def` of a proposition, not an
  axiom. These 26 nodes take it as the explicit hypothesis `hME`, and the 32 nodes of "The multiplicity side, and
  `hME` itself" below prove it directly (`Diaz.multiplicityEstimateElem`); Th. 8.1 in general is not formalised. So
  Roy's theorem holds here with no hypothesis. On Prove2Me it is the published definition
  `MultiplicityEstimateElem`, archived as `archive/prove2me/Def_MultiplicityEstimateElem.lean`.
- **The headline.** `DiazModulus.strong_six_exponentials` (milestone): under `hME`, for `x₁, x₂` and `y₁, y₂, y₃`
  free over Q̄, some `xᵢyⱼ` is not in `ℒ̃`. `DiazModulus.linear_subgroup_transcendence` (milestone) is DALAG Th. 11.21
  in the case d₀ ≤ n, under `hME`.
- **The interpolation determinant** (Steps 3–5 of the proof of Th. 11.21): `thetaN_ge_mul_sub`,
  `iteratedDeriv_det_eq_sum`, `iteratedDeriv_iteratedFDeriv_line`, `interpolation_det_order` (DALAG Lemma 9.2),
  `schwarz_order_at_zero` (Lemma 2.4), `iteratedFDeriv_expMono_eq_op`, `op_monomial_eval_norm_le`,
  `op_entry_denom_house`, `interp_det_upper`, `interp_det_liouville`, `exists_ne_zero_mulVec_eq_zero_of_minors` and
  `interp_kernel`.
- **The obstruction and the parameters** (Steps 6–7): `exists_coord_complement`, `obstruction_1123` (under `hME`),
  `params_1122_eventually` and `params_exponents`.
- **Roy's argument**: `exists_sse_lifts` (restriction of scalars), `sse_independence_facts`, `intMatrix_ker_facts`,
  `rank_le_of_injOn_lattice`, `sse_setup`, `sse_tangent_count`, `sse_relRank_generic` and `sse_relRank_rational`. The
  case analysis of the obstruction does not use that it is defined over Q̄, and does not use Baker's theorem.
- **The bridge.** `Diaz.strongSixExponentials_of_multiplicityEstimateElem : MultiplicityEstimateElem →
  StrongSixExponentials` (`Diaz/StrongSixExponentials.lean`) restates the headline in the library's name.

So the declarations that carry Roy's theorem as the hypothesis `hSSE` hold with no hypothesis; each is restated
without it in `Diaz/RoyUnconditional.lean` (below). They are `candidate_multiplier_module`,
`algebraic_modulus_log_multiplier_rational`, `candidate_cube_and_axis_multiple_not_mem_logAlgTilde`,
`candidate_div_sq_sub_not_mem_logAlgTilde`, `candidate_laurent_conj_hull_class_not_mem_logAlgTilde`,
`candidate_power_pair_not_both_mem_logAlgTilde`, `candidate_rational_conj_hull_criterion_not_mem_logAlgTilde`,
`candidate_real_pencil_not_both_mem_logAlgTilde`, `candidate_sum_div_sq_sub_not_mem_logAlgTilde`,
`candidate_two_pole_not_both_mem_logAlgTilde`, `diaz_2007_cor1_PQ`, `diaz_2007_cor2_P_consequences`,
`diaz_2007_cor3_Q`, `diaz_2007_cor4`, `diaz_2007_cor5`, `diaz_2007_cor6`, `diaz_2007_cor7`, `diaz_2007_th4`,
`diaz_2007_th5`, `diaz_2007_th6`, `diaz_2007_th7`, `logAlgTilde_adjoin_circle_point_no_two_by_three_configuration` and
`pi_powers_not_both_mem_logAlgTilde`. Two more carry its four-logarithm quotient form, which
`strong_six_exponentials_iff_quotient_form` makes equivalent: `nonreal_two_point_fibre_pi_sq`, and
`diaz_2007_cor2_P1`, stated over any subfield K, of which the case K = Q̄ follows.

Clean room: the agents that designed and wrote these 26 proofs worked under the rule that no agent was to open another
formalisation of Roy's theorem.
The 26 modules have 4,159 lines in `Diaz/Mirror/`; three are over 300: `interp_det_upper` (454),
`interp_det_liouville` (395) and `op_entry_denom_house` (357).

**The Hilbert side of `hME`.** Thirty more nodes of 29 October 2026 prove the Hilbert-function half of `hME`, at
finite level: inequalities between dimensions of boxes of polynomials, with no Hilbert polynomials. They are
finite-level forms of DALAG Ch. 5 and 8 (chapter 8 is by D. Roy), all routine. The vocabulary is
`Diaz/HilbertBox.lean`, the platform's definition `DiazHilbertBox` carried verbatim (archived as
`archive/prove2me/Def_DiazHilbertBox.lean`): the Hilbert function `boxHilb F I T = dim_K image(F_T → S/I)` of a
filtration, the boxes, the torus ideal (YᵢZᵢ − 1)ᵢ, and the proposition `UnmixedHeight`.

- **The hypothesis hU.** `UnmixedHeight S` is Macaulay's unmixedness in the form the chain consumes: for every weakly
  regular sequence of `S`, every associated prime of the quotient has height at most its length. Like `hME`, it is
  a `def` of a proposition, not an axiom. The chain bound and the Hilbert side take it as the explicit argument
  `hU`, and it is proved for polynomial rings over an algebraically closed field (below).
- **The headline.** `DiazModulus.torus_hilbert_side` (milestone): on the boxes of `hME`, in K[X, Y, Z] modulo the
  torus ideal of 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}, λ·2^{r(r−1)/2} ≤ 2^{rd} D₀^{d₀} (2D₁)^{d₁}, under `hU`; with
  `le_hME_constant` (milestone) this is the constant of `hME`. Over ℂ it holds without `hU`:
  `Diaz.torus_hilbert_side_complex` (below).
- **Hilbert functions of filtrations**: `boxHilb_add_finrank_inf` (rank–nullity), `boxHilb_mono`, `boxHilb_anti`,
  `card_le_boxHilb_of_linearIndependent`, `exists_boxHilb_family` (milestone), `boxHilb_map_algEquiv`,
  `sum_boxHilb_le_boxHilb_iInf` (DALAG Ex. 8.5(a)) and `exists_card_mul_boxHilb_le_translates` (milestone).
- **The chain bound** (DALAG Th. 8.4 and 8.8, at finite level): `boxHilb_sup_span_add_le` (Lemma 8.5),
  `nat_telescope_step`, `nat_telescope_iter`, `exists_mem_forall_notMem_of_not_subset`,
  `exists_mem_isSMulRegular_of_associatedPrimes`, `isSMulRegular_quotient_of_isWeaklyRegular_append`,
  `exists_isWeaklyRegular_append_of_height` (under `hU`), `boxHilb_chain_bound` and `boxHilb_le_of_height` (under
  `hU`). An infinite field is assumed only where prime avoidance needs it.
- **The torus model**: `restrictSupport_block_filtration`, `torus_reduce_mem_restrictSupport` and
  `torus_reduced_inf_eq_bot` (together: reduced monomials are a basis modulo the torus ideal, over any field),
  `boxHilb_torusIdeal` (the exact count), `isWeaklyRegular_torusList` (the generators are weakly regular),
  `exists_translation_algEquiv` (milestone; translations act by automorphisms) and `torus_coeff_poly` (milestone).
- **The Hilbert side**: `le_of_forall_mul_pow_le`, `box_ray_upper_bound`, `box_ray_lower_bound` (milestone),
  `boxHilb_hilbert_side` (under `hU`), `torus_hilbert_side` and `le_hME_constant`.

The 30 modules have 2,326 lines in `Diaz/Mirror/`; none is over 200.

**Unmixedness for polynomial rings.** Five more nodes of 29 October 2026 prove `hU` for polynomial rings over an
algebraically closed field. `DiazModulus.unmixedHeight_mvPolynomial` (milestone; `[IsAlgClosed K] [Finite σ]`) is
`UnmixedHeight (MvPolynomial σ K)`: the inequality half of Macaulay's unmixedness theorem for K[X_σ] (Macaulay 1916;
Bruns–Herzog, *Cohen–Macaulay Rings*, Th. 2.1.6). The theorem is classical, and this is a formalisation of its known
proof; the reverse inequality is not stated. The route is local and uses regular sequences only, with Rees' theorem
from Mathlib (`ModuleCat.exists_isRegular_tfae`) as the one tool of depth theory:

- `length_le_ringKrullDim_quotient_of_mem_associatedPrimes` (Matsumura Th. 17.2, for regular sequences): in a
  Noetherian local ring, a weakly regular sequence in the maximal ideal is no longer than dim A/𝔭 for every
  associated prime 𝔭.
- `exists_isRegular_quotient_ofList` (Rees' theorem and the long exact Ext sequence): cutting by a weakly regular
  sequence `ps` shortens a regular sequence in the maximal ideal by at most the length of `ps`.
- `height_le_length_of_mem_associatedPrimes`: the local form of the unmixedness theorem, for a local ring with a
  regular sequence as long as its dimension.
- `exists_isWeaklyRegular_vanishing`: the Xᵢ − aᵢ form a weakly regular sequence in R[X_σ].
- `unmixedHeight_mvPolynomial`: localise at a maximal ideal, which by the Nullstellensatz is the ideal of a point.
- **The bridge.** `Diaz.torus_hilbert_side_complex` (`Diaz/HilbertSide.lean`) is `torus_hilbert_side` for K = ℂ with
  `hU` supplied by `unmixedHeight_mvPolynomial`: the Hilbert side of `hME` over ℂ holds without `hU`. Its other
  inputs, the height bound `hH` and the lower bound `hlow`, are what the multiplicity side has to supply.

The 5 modules have 563 lines in `Diaz/Mirror/`.

**The multiplicity side, and `hME` itself.** Thirty-two nodes of 30 October 2026 prove `hME`.
`DiazModulus.multiplicityEstimateElem` (milestone) is `MultiplicityEstimateElem`: the case G⁻ = {e}, G⁺ = G of
DALAG Th. 8.1 for G = 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁} over ℂ, written in coordinates. For G⁻ = {e} and finite Σ, DALAG notes
that Th. 8.1 is a special case of Philippon 1986, Th. 2.1. The proof is that of DALAG §8.4 (chapter 8 is by D. Roy),
at finite level and through elementary arguments. The theorem is classical, and this is a formalisation of its known
proof. The vocabulary is `Diaz/Multiplicity.lean`, the platform's definition `DiazMultiplicity` carried verbatim
(archived as `archive/prove2me/Def_DiazMultiplicity.lean`): the group `TorusGroup`, its invariant derivations
`torusDeriv`, the translations `torusTransl`, the ideal `torusVanishing S` of a set of points and the zero set
`torusZero I` of an ideal, the stabiliser `torusStab`, and the section ideals and obstruction spans of DALAG §8.4.1.

- **Zero sets and heights on the torus**: `isPrime_iInf_ker_eval_of_analytic`, `le_height_torusVanishing`,
  `torusVanishing_univ`, `torusVanishing_torusZero` (the Nullstellensatz on the torus), `torusTransl_algEquiv`,
  `ringKrullDim_quotient_sectionIdeal_le` and `card_le_height_add_of_ringKrullDim_quotient_le`.
- **Characters and subgroups**: `eval_eq_zero_of_sum_mul_char` (Dedekind's lemma with polynomial coefficients),
  `eval_eq_zero_on_span_of_addSubgroup`, `exists_coordinate_section_add`, `exists_coordinate_section_mul`,
  `linearIndependent_on_subgroup` and `torusStab_subgroup`.
- **Invariant derivations** (DALAG Lemma 8.11): `torusDeriv_mem_torusBox`, `torusDeriv_torusTransl`,
  `eval_torusDerivList_torusCoeffPoly`, `eval_torusDerivList_eq_zero` and `vanishOrd_ideal`.
- **Tangent duals and Wüstholz's argument** (Lemmas 8.14–8.16 and (8.20)): `exists_tangent_dual`,
  `exists_tangent_dual_cosets`, `derivation_pow_mul_mem`, `card_multiIndex` and `wustholz_le_boxHilb`.
- **The obstruction** (§8.4.1): `exists_chain_prime`, `obstructionSpan_vanishOrd`,
  `exists_le_translate_of_le_torusVanishing`, `le_height_obstruction`, `le_boxHilb_torusVanishing_subgroup`,
  `hlow_le_boxHilb` and `exists_obstruction`. Then `multiplicityEstimateElem` compares the lower bound with the
  Hilbert side (`torus_hilbert_side`, with `unmixedHeight_mvPolynomial`) through `le_hME_constant`.
- **The headline.** `DiazModulus.strong_six_exponentials_unconditional` (milestone): Roy's strong six exponentials
  theorem with no hypothesis, `strong_six_exponentials` applied to `multiplicityEstimateElem`.
- **The bridges.** `Diaz.strongSixExponentials : StrongSixExponentials` (`Diaz/StrongSixExponentials.lean`) is
  `strongSixExponentials_of_multiplicityEstimateElem multiplicityEstimateElem`. `Diaz/RoyUnconditional.lean` gives
  each of the 25 declarations above that take `hSSE` a corollary `<name>_unconditional`, with the same binders and
  conclusion and no `hSSE`; where Baker's theorem `hB` or Hermite–Lindemann `hHL` is a hypothesis too, it is
  supplied as well (`baker_two_logs`, `hermite_lindemann_holds`). The two statements of the quotient form over a
  general space `aLog` are specialised to `aLog = ℒ̃`.

So Roy's strong six exponentials theorem is machine-checked in the library with no hypothesis, from four rounds of
October 2026: C1.4 (Roy's theorem from `hME`), C1.1 (the Hilbert side of `hME`), C1.2 (unmixedness for polynomial
rings) and C1.3 (the multiplicity side and `hME`), 93 nodes in all. The agents that designed and wrote the 32 proofs
of C1.3 worked under a clean-room rule: no agent was to open another formalisation of the theorem. The 32 modules
have 4,270 lines in `Diaz/Mirror/`; the largest has 251.

### The five exponentials theorem

Three nodes of 1 November 2026. All three are classical results, formalised routinely.

- `DiazModulus.five_exponentials` (milestone) — Waldschmidt's five exponentials theorem (1988, Cor. 2.2, p. 378;
  DALAG §11.3.3, Example 1): if `x₀, x₁` are linearly independent over ℚ, `y₀, y₁` too, and `η ≠ 0` is algebraic,
  one of `e^{x₀y₀}`, `e^{x₀y₁}`, `e^{x₁y₀}`, `e^{x₁y₁}`, `e^{ηx₁/x₀}` is transcendental. The proof is DALAG's Remark
  after Cor. 11.16 (p. 399): Baker's theorem (`Transcendence.baker_linear_forms_in_logarithms`) turns ℚ-independence
  into Q̄-independence, with `y₂ = η/x₀` as the third column, and Roy's strong six exponentials theorem
  (`Diaz.strongSixExponentials`, above) concludes.
- `DiazModulus.two_pow_pi_or_three_pow_pi_transcendental` — one of `2^π`, `3^π` is transcendental: Waldschmidt's
  statement (2.2.3) (1988, p. 379) at t = π, β = i. It strengthens `two_three_five_pow_pi_transcendental`, the
  instance of the six exponentials theorem with `2^π`, `3^π`, `5^π`.
- `DiazModulus.exp_mul_or_exp_sq_mul_transcendental` — for non-zero logarithms `λ₀, λ₁` of algebraic numbers and
  algebraic `β ≠ 0`, one of `e^{βλ₀λ₁}`, `e^{(βλ₀)²λ₁}` is transcendental: DALAG Exercise 11.8(b), p. 415; at
  `λ₀ = λ₁ = log 2`, `β = 1` it is Exercise 11.8(c), one of `2^{log 2}`, `2^{(log 2)²}`.

All three are milestones of the Prove2Me mission: 173 for the theorem, 181 and 182 for the corollaries. The 3 modules have 238
lines in `Diaz/Mirror/`. The sharp six exponentials theorem (Waldschmidt 1988, Cor. 2.1) is not formalised.

