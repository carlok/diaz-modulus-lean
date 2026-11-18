[← README](../README.md)

## Roy's rank bounds, *Variations*, *Further variations* and DALAG §11–12

### Roy's Corollary 1: the rank of a matrix of logarithms

Ten nodes of 13 November 2026. All are formal proofs of classical results (Roy 1992; DALAG §11.6 and §12.3); two
steps were not found in the sources read in the form stated, and both are routine.

- `DiazModulus.roy_rank_bound` (milestone) — Roy 1992, Cor. 1 (p. 38), for Q̄ and `ℒ̃`: a `d × l` matrix `M` with
  entries in `ℒ̃`, `d ≥ 1`, has invertible algebraic `P`, `Q` and `0 < d′ ≤ d`, `l′ ≤ l` such that the top right
  `d′ × (l − l′)` block of `PMQ` vanishes and `d·l′ ≤ rank(M)·(d′ + l′)`. That is Roy's bound
  `rank(M) ≥ dθ/(1 + θ)`. With no hypothesis: it applies `multiplicityEstimateElem`.
- `DiazModulus.roy_theorem_four` — Roy's Theorem 4 in the form of DALAG Prop. 11.19: at a rational subspace `S`
  minimising `(n − dim(U ∩ S))/(d − dim S)`, the images in `ℂᵈ/S` satisfy `ℓ′d′ ≤ n′(d′ + ℓ′)` and `n′/d′ ≤ n/d`.
- `DiazModulus.roy_slope_bound`, `roy_semistable_node` — the proof: an induction on `d`. A semistable `U` gets one
  application of the linear subgroup theorem (`linear_subgroup_transcendence`, DALAG Th. 11.21) at `Υ⁻¹(U)`; otherwise
  `ℂᵈ` splits along a rational subspace of maximal slope. DALAG (Th. 11.5 (3′), Lemma 11.24) and Roy (his Th. 2)
  pass through other intermediate statements.
- Six leaves: lifts through Roy's map `Υ` (`roy_field_lifts`), its dimension counts (`roy_upsilon_dims`, DALAG
  Lemma 11.18), the image of an integer kernel (`roy_intKer_image`), the rank of the relations returned by Th. 11.21
  (`roy_relation_rank_le`), a space of periods (`roy_period_space`), and coordinates adapted to a rational subspace
  (`roy_rational_adapted_basis`). The second-to-last two are the steps not found in the sources read in this form.

Milestone 185 of the Prove2Me mission is the corollary; the other nine joined by import. The 10 modules have 2,497
lines in `Diaz/Mirror/`. Roy's Theorem 5 (DALAG Cor. 11.15) and the printed applications of the corollary (Waldschmidt's *Variations* and
*Further variations*, DALAG §12.3, Fischler 2001) are formalised in the two sections below.

### Roy's Theorem 5 and Waldschmidt's *Variations*

Eleven nodes of 14 November 2026. All are formal proofs of classical results: Roy 1992, Th. 5; DALAG Cor. 11.15;
§§2–3 of Waldschmidt's *Variations on the six exponentials theorem* (2005); and Cor. 6.3 of his *The role of complex
conjugation in transcendental number theory*. All hold with no hypothesis. Two printed corollaries of *Variations*
needed a correction, and the formal statements are the corrected ones (see "Printed statements corrected while
formalising" below).

- `DiazModulus.roy_theorem_five` (milestone) — Roy 1992, Th. 5 (p. 39), for Q̄ and `ℒ̃`: if `U ⊆ ℂᵈ` meets `Q̄ᵈ` only
  in 0 and `ℂᵈ` is the only rational subspace containing it, then `0 < dim U < d`, and `ℓ` Q̄-free points of
  `U ∩ ℒ̃ᵈ` satisfy `ℓ ≤ Σ nᵢdᵢ/(dᵢ − nᵢ)` for some decomposition `(dim U, d) = Σ (nᵢ, dᵢ)` with `0 < nᵢ < dᵢ`.
  Roy's `φ(n, d)` is the largest such sum, so this is `ℓ ≤ φ(dim U, d)`. The proof is Roy's induction on `d`
  (pp. 39–40) through his Theorem 4 (`roy_theorem_four`, above), with two helpers: `roy_theorem_four_exists`
  (Theorem 4 at a rational subspace that minimises the ratio) and `roy_hull_transport` (coordinates adapted to a
  rational subspace of least dimension).
- `DiazModulus.roy_theorem_five_dmin` (milestone) — DALAG Cor. 11.15 (p. 398) for `(Q̄, ℒ̃)`, in the same form: if
  `V ∩ Q̄ᵈ = 0`, then `V ∩ ℒ̃ᵈ` is finite-dimensional over Q̄, of dimension at most `Σ nᵢdᵢ/(dᵢ − nᵢ)` for a
  decomposition of `(dim V, d_min)`, where `d_min` is the least dimension of a rational subspace containing `V`.
  The proof follows Roy, not DALAG's argument for the corollary. The bound in DALAG's printed form, with the table
  Ψ, is `dalag_cor_11_15_psi` (below).
- `DiazModulus.variations_hyperplane_bound` (milestone) — *Variations* Th. 3.1 (p. 347): a hyperplane of `ℂᵈ` that
  meets `Q̄ᵈ` only in 0 meets `ℒ̃ᵈ` in dimension at most `d(d − 1)` over Q̄; the hyperplane case of the previous
  item. `DiazModulus.variations_cor_3_2` (milestone) — Cor. 3.2 (p. 348): for an `m × ℓ` matrix `(Λᵢⱼ)` over `ℒ̃`
  with Q̄-free columns, Q̄-free `x₁, …, x_m ∈ ℂ` and `ℓ > m(m − 1)`, some `Σᵢ xᵢΛᵢⱼ` is non-zero.
- `DiazModulus.variations_theorem_2_11` (milestone) — *Variations* Th. 2.11 (p. 346; *Role* Th. 6.2): if the columns
  of `(I_m, M)` are Q̄-free for `M = (Λᵢⱼ)` over `ℒ̃`, `1, Λ₁, …, Λ_m ∈ ℒ̃` are Q̄-free and `ℓ > m²`, some
  `Σᵢ ΛᵢΛᵢⱼ` is not in `ℒ̃`. From the hyperplane bound in `ℂ^{m+1}`.
- `DiazModulus.role_cor_6_3` (milestone) — *Role* Cor. 6.3: for a 2 × 5 matrix over `ℒ̃` with `1, Λ₁₁, Λ₂₁` Q̄-free
  and the seven columns of `(I₂, M)` Q̄-free, some `Λ₁₁Λ₂ⱼ − Λ₂₁Λ₁ⱼ` (`j = 2, …, 5`) is not in `ℒ̃`. This is the
  author's own correction of *Variations* Cor. 2.12, proved as printed from Th. 2.11.
- `DiazModulus.variations_cor_2_13_corrected` (milestone) — *Variations* Cor. 2.13, corrected: for `(Λᵢⱼ) ∈ ℒ̃^{2×3}`
  with `Λ₁₁, Λ₂₁` each real or purely imaginary, `1, Λ₁₁, Λ₂₁` Q̄-free and
  `1, Λ₂₁, Λ₂₂, Λ₂₃, Λ̄₂₂, Λ̄₂₃` Q̄-free, one of `Λ₁₁Λ₂₂ − Λ₂₁Λ₁₂`, `Λ₁₁Λ₂₃ − Λ₂₁Λ₁₃` is not in `ℒ̃`. From Cor. 6.3
  and the stability of `ℒ̃` under complex conjugation (`logAlgTilde_conj_stable`), with signs on the conjugate
  columns of the printed proof.
- `DiazModulus.variations_cor_2_14` (milestone) — *Variations* Cor. 2.14 (p. 347): the same conclusion as Th. 2.11
  for an `m × ℓ` matrix of logarithms with ℚ-free columns and ℚ-free logarithms `λ₁, …, λ_m`, `ℓ > m²`. From
  Th. 2.11 and Baker's theorem (`Transcendence.baker_linear_forms_in_logarithms`), through
  `baker_columns_qbar_independent`: Baker's theorem in column form, ℚ-free columns over `ℒ` make the columns of
  `(I_m, M)` Q̄-free.

Milestones 186–193 of the Prove2Me mission are the eight printed results; the three helpers joined by import. The
11 modules have 1,269 lines in `Diaz/Mirror/`. Roy's closed form of `φ` (his Lemma on p. 40)
and DALAG's table Ψ are formalised in "*Further variations* Th. 2.1 for every `Y`, Roy's Lemma, DALAG Cor. 11.15
and 12.23" below. Not formalised: *Variations* Th. 3.3 and Cor. 3.4–3.5, which rest on DALAG Cor. 11.6 rather
than on Roy's theorem.

### Applications of Roy's Corollary 1: *Further variations*, DALAG §12.3, Fischler

Eighteen nodes of 14 November 2026: the printed applications of Roy's Corollary 1 (`roy_rank_bound`, above) in
Waldschmidt's *Further variations on the six exponentials theorem* (2005), in DALAG §12.3, and in Fischler's
*Orbits under algebraic groups and logarithms of algebraic numbers* (2001). All are formal proofs of classical
results, with no hypothesis.

- ***Further variations*.**
  - `DiazModulus.fv_theorem_2_1` (milestone) — Th. 2.1 (p. 5), for finite-dimensional `Y`: if `X, Y ⊆ ℂⁿ` are
    Q̄-subspaces with `dim X = d > n` and `μ(Y, ℂⁿ) > d/(d − n)`, then `x · y ∉ ℒ̃` for some `x ∈ X`, `y ∈ Y`. Here
    `x · y` is the bilinear dot product and `μ(Y, ℂⁿ)` the least `dim_Q̄(Y/(Y ∩ V))/codim V` over all ℂ-subspaces
    `V ≠ ℂⁿ`. The printed statement allows any `Y`; its proof covers finite-dimensional `Y`, which is the case
    stated here, and `fv_theorem_2_1_rank` (below) proves the statement for every `Y`. The proof takes one ℂ-subspace of maximal slope for `X` (`fv_max_slope`) and a relative form of
    the semistable case (`fv_semistable_core`), with Roy's Corollary 1 applied once to a Gram matrix
    (`fv_gram_zero_block`) and the orthogonal for the dot product (`fv_dot_orthogonal`), in place of the printed
    reduction after Waldschmidt 1981, Lemmes 5.1–5.2.
  - `DiazModulus.fv_theorem_1_2` (milestone) — Th. 1.2, the main result: if `M ∈ ℒ̃^{2×3}` and the five rows of
    `(M; I₃)` and the five columns of `(I₂, M)` are Q̄-free, one of the three 2 × 2 minors of `M` is not in `ℒ̃`.
    From Th. 2.1 at `n = 2`, `d = 5`, with the estimate (3.1) for lines (`fv_two_by_three_lines`).
  - `DiazModulus.fv_lambda_squares` (milestone) — the example of p. 3: if `1, Λ₁, Λ₂, Λ₃ ∈ ℒ̃` are Q̄-free, one of
    `Λ₁² − Λ₂Λ₃`, `Λ₂² − Λ₃Λ₁`, `Λ₃² − Λ₁Λ₂` is not in `ℒ̃`.
  - `DiazModulus.fv_cor_1_4` (milestone) — Cor. 1.4: for a 2 × 3 matrix of logarithms with ℚ-free rows and ℚ-free
    columns, one of its three 2 × 2 minors is not in `ℒ̃`; from Th. 1.2 and Baker's theorem in column form.
- **DALAG §12.3.**
  - `DiazModulus.dalag_cor_12_21` (milestone) — Cor. 12.21 (p. 435): if `Σᵢⱼ τᵢσⱼΛᵢⱼ ≠ 0` for all non-zero
    algebraic `τ`, `σ`, then `rank M ≥ dℓ/(d + ℓ)`.
  - `DiazModulus.dalag_cor_12_22` (milestone) — Cor. 12.22 (p. 436): the rank of a matrix over `ℒ̃` is at least half
    its structural rank over Q̄. The structural rank is the rank of `Σₖ XₖNₖ` over `Q̄(X₁, …, X_m)` for a
    presentation `M = Σₖ eₖNₖ` with Q̄-free `eₖ` and algebraic `Nₖ`; the statement holds for every presentation.
    One helper: `matrix_rank_le_of_zero_block`.
  - `DiazModulus.dalag_cor_12_24` (milestone) — Cor. 12.24 (p. 436): a `d × ℓ` matrix over `ℒ̃` with Q̄-free rows,
    Q̄-free columns and `dℓ > d + ℓ` has rank at least 2. Proved from Th. 12.20 (Roy's Corollary 1) by a direct
    case analysis: the deduction from Cor. 12.22 that DALAG indicates gives only rank ≥ 1 for 2 × 3 matrices.
- **Fischler 2001.**
  - `DiazModulus.fischler_centralizer` (milestone) — Th. 1.2 (p. 169), complex case: if `M ∈ ℒ̃^{n×n}` has `n²`
    entries linearly independent over Q̄, its centraliser has dimension at most `(n² + 1)/2`. (Fischler's `ℒ` is
    `ℒ̃` here.) The proof is Fischler's: `fischler_prop_5_5` (Prop. 5.5, with Roy's Corollary 1 applied to `ad M`
    on the trace-zero matrices in coordinates, in place of Fischler's Cor. 2.2, so that the two subspaces are
    spanned by explicit algebraic matrices), `fischler_commute_of_trace`, and Rémond's lemma.
  - `DiazModulus.remond_commuting_subspaces` (milestone) — Fischler's Lemma 5.6, due to Rémond: subspaces `U, V`
    of `Matₙ(ℂ)` whose elements commute with each other have `dim U + dim V ≤ n² + 1`. From
    `remond_commuting_end`, the same statement for endomorphisms, by the printed induction on `n`.

Milestones 194–202 of the Prove2Me mission are the nine headline results; the other nine joined by import. The 18
modules have 1,851 lines in `Diaz/Mirror/`. *Further variations* Th. 2.1 for
infinite-dimensional `Y` and DALAG Cor. 12.23 are formalised in the next section. Not formalised: *Further
variations* Cor. 1.3; the ℚ + ℒ statement after DALAG Cor. 12.24; Fischler's Th. 1.1 and §4, on orbits under
algebraic groups.

**Printed statements corrected while formalising.** Formalising these results met three printed statements that
are false as stated, two of them used here: *Variations* Cor. 2.12, which the author corrected in *Further
variations* §4 and in *Role* Cor. 6.3, and *Variations* Cor. 2.13, for which no correction was found in the sources
consulted; the formal statements are the corrected ones. The third, DALAG Lemma 11.24, is not used by the formal
proofs. The printed proof of *Variations* Cor. 2.13 also needs signs on two columns when one of `Λ₁₁`, `Λ₂₁` is
real and the other purely imaginary; DALAG's deduction of Cor. 12.24 from Cor. 12.22 does not give rank 2, so
Cor. 12.24 is proved here from Th. 12.20; and the printed proof of *Further variations* Th. 2.1 covers
finite-dimensional `Y`, which is how it is stated here; the next section proves the statement as printed.
[`ERRATA.md`](../ERRATA.md) gives each point with the printed text, a counterexample or the missing step, and the
repair, with gaps in DALAG's proofs of Cor. 11.10/11.15, Prop. 11.19 (for `(ℚ, ℚ + ℒ)`), Th. 11.21, Lemma 12.9
and Prop. 12.13 and in its Remark of §12.1.3, in Roy's proof of his Lemma on `φ` and in his Remark (i), a fourth
false statement (DALAG Lemma 11.18 (2)), and a list of smaller slips.

### *Further variations* Th. 2.1 for every `Y`, Roy's Lemma, DALAG Cor. 11.15 and 12.23

Fifteen nodes of 14 November 2026. All are formal proofs of classical results, with no hypothesis: Waldschmidt's
*Further variations* Th. 2.1 as printed, for every Q̄-subspace `Y`; Roy's Lemma (Roy 1992, p. 40), the closed form
of `φ(n, d)`; DALAG Cor. 11.15 for `(Q̄, ℒ̃)` with DALAG's table Ψ; and DALAG Cor. 12.23. Each completes a result of
the two sections above.

- `DiazModulus.fv_theorem_2_1_rank` (milestone) — *Further variations* Th. 2.1 (p. 5) as printed: `Y` is any
  Q̄-subspace of `ℂⁿ`, and the hypothesis `μ(Y, ℂⁿ) > d/(d − n)` is read with `dim_Q̄ Y/(Y ∩ V)` a cardinal. From
  `fv_theorem_2_1_general`, the same theorem with the hypothesis through finite-dimensional witnesses (for each
  `V ≠ ℂⁿ`, some finite-dimensional `Y₀ ⊆ Y` with `d·(n − dim V) < (d − n)·dim_Q̄ Y₀/(Y₀ ∩ V)`), and
  `fv_rank_quot_witness` (if `dim_Q̄ Y/(Y ∩ V) ≥ N`, some finite-dimensional `Y₀ ⊆ Y` has
  `dim Y₀/(Y₀ ∩ V) ≥ N`). The
  printed proof covers finite-dimensional `Y` (`fv_theorem_2_1`, above). `fv_finite_approx` supplies the missing
  step: for every `Y` and every integer `B`, one finite-dimensional `Y₀ ⊆ Y` has
  `dim Y₀/(Y₀ ∩ V) ≥ min(dim Y/(Y ∩ V), B)` for every ℂ-subspace `V` at once. Its proof maximises a bounded integer
  attached to the intersection of the subspaces `V` where a finite-dimensional subspace falls short of `B`, with
  three dimension counts as helpers (`fv_rho_excess`, `fv_rho_inf`, `fv_rho_sInf`); no topology on Grassmannians
  is used.
- `DiazModulus.roy_lemma_phi` (milestone) — Roy's Lemma (Roy 1992, p. 40; not Roy's lemma on singular spaces of
  matrices in the table above): for `0 < n < d`, the largest `Σ nᵢdᵢ/(dᵢ − nᵢ)` over the decompositions
  `(n, d) = Σ (nᵢ, dᵢ)`, `0 < nᵢ < dᵢ`, is `nd/(d − n)` if `n = 1` or `d − n = 1`, and `(d − n)/(d − n − 1) + (n − 1)n`
  otherwise, which Roy writes `φ(1, d − n) + φ(n − 1, n)`. The proof is not Roy's exchange argument but
  `roy_phi_closed_form_superadd`: the closed form bounds a single part and is superadditive, so it bounds every
  decomposition by induction on the number of parts.
- `DiazModulus.dalag_cor_11_15_psi` (milestone) — DALAG Cor. 11.15 (p. 398) for `(Q̄, ℒ̃)` in its printed form:
  if `V ∩ Q̄ᵈ = 0`, then `dim_Q̄(V ∩ ℒ̃ᵈ) ≤ Ψ(dim V, d_min)`, with DALAG's table Ψ (p. 394), and `dim V < d_min` when
  `V ≠ 0`. From `roy_theorem_five_dmin` (above) and `dalag_psi_floor_roy_phi`: `Ψ(n, d) = ⌊φ(n, d)⌋`, row by row
  from Roy's Lemma.
- `DiazModulus.dalag_cor_12_23` (milestone) — DALAG Cor. 12.23 (p. 436): a matrix with entries in `ℚ + ℒ` has rank
  at least half its structural rank over ℚ, for every presentation `M = Σₖ eₖNₖ` with ℚ-free `eₖ ∈ ℚ + ℒ` and
  rational `Nₖ`. From `dalag_cor_12_22` (above) and three helpers: `baker_rat_add_logAlg_free`, Baker's theorem
  for `ℚ + ℒ` (elements free over ℚ are free over Q̄), through `logAlg_exists_rat_basis` (a ℚ-basis chosen among
  finitely many logarithms); and `matrix_rank_map_field` (a homomorphism of fields preserves the rank of a
  matrix). DALAG's Lemma 12.9 is not needed; the affine form of p. 435 is `dalag_cor_12_23_affine` (below).

Milestones 203–206 of the Prove2Me mission are the four printed results; the other eleven joined by import. The 15
modules have 1,330 lines in `Diaz/Mirror/`. DALAG Cor. 11.15 for `(ℚ, ℚ + ℒ)` and DALAG Lemma 12.9 are
formalised in the next two sections.

**Printed proofs completed while formalising.** The proof of *Further variations* Th. 2.1 covers finite-dimensional
`Y` only, and the statement as printed is true: the finite approximation above reduces it to that case. Roy's
proof of his Lemma concludes that a maximising decomposition has two parts from two exclusions that leave parts
`(nᵢ, dᵢ) = (1, 2)` free: for `(n, d) = (3, 7)` the decomposition `(1, 3), (1, 2), (1, 2)` meets every condition
of the printed argument and has three parts. One exchange on three parts repairs it, and the Lemma is correct.
DALAG's proof of Lemma 12.9 leaves a dehomogenisation implicit, and its table Ψ does not define `Ψ(0, 0)`, which
Cor. 11.15 uses at `V = 0`. [`ERRATA.md`](../ERRATA.md) gives each point with the printed text, the evidence and the
repair.

### DALAG Cor. 11.15 for `(ℚ, ℚ + ℒ)`, by Roy's route over ℚ

Eight nodes of 14 November 2026. All are formal proofs of classical results: DALAG Cor. 11.15 (p. 398) for
`(ℚ, ℚ + ℒ)`, with no hypothesis, and on the way Roy's Theorems 4 and 5 over ℚ. Roy's Remark (i) (p. 37) says that
his Theorem 4 holds over every subfield `F` of Q̄, with `F + F·ℒ` in place of `ℒ̃`; here `F = ℚ`, and `ℚ + ℒ` is
the ℚ-span of 1 and `ℒ`. A subspace is rational over ℚ when it is spanned by vectors with rational coordinates.

- `DiazModulus.dalag_cor_11_15_rat` (milestone) — DALAG Cor. 11.15 (p. 398) for `(ℚ, ℚ + ℒ)` in its printed form:
  if `V ⊆ ℂᵈ` meets `ℚᵈ` only in 0, then `V ∩ (ℚ + ℒ)ᵈ` is finite-dimensional over ℚ and
  `dim_ℚ(V ∩ (ℚ + ℒ)ᵈ) ≤ Ψ(dim V, d_min)`, with DALAG's table Ψ (p. 394) and `d_min` the least dimension of a
  subspace rational over ℚ that contains `V`; and `dim V < d_min` when `V ≠ 0`. From `roy_rat_theorem_five` and
  `dalag_psi_floor_roy_phi` (above), with `Ψ(n, ·)` non-increasing above `n`.
- `DiazModulus.roy_rat_theorem_five` — Roy 1992, Th. 5 (p. 39) over ℚ: if `U ⊆ ℂᵈ` meets `ℚᵈ` only in 0, then
  `ℓ` ℚ-free points of `U ∩ (ℚ + ℒ)ᵈ` satisfy `ℓ ≤ Σ nᵢdᵢ/(dᵢ − nᵢ)` for some subspace `S ⊇ U` rational over ℚ and
  some decomposition `(dim U, dim S) = Σ (nᵢ, dᵢ)` with `0 < nᵢ < dᵢ`. By an induction on `d` that splits along a
  subspace of maximal slope, with the slope bound on the subspace and the induction on the quotient, so that Roy's
  hypothesis that `ℂᵈ` is the least subspace rational over ℚ containing `U` is not needed.
- `DiazModulus.roy_rat_slope_bound`, `roy_rat_semistable_node` — Roy's Theorem 4 over ℚ, in the slope form of
  `roy_slope_bound`, by the same induction as over Q̄: a semistable `U` gets one application of the linear subgroup
  theorem (`linear_subgroup_transcendence`, DALAG Th. 11.21), for Roy's map `Υ(x, y) = x + y`. The additive part of
  the obstruction it returns is replaced by the span of its rational vectors, so no subgroup has to be selected and
  DALAG Prop. 11.19 is not used. Both take the multiplicity estimate `hME` as a hypothesis, as their Q̄ versions do;
  `roy_rat_theorem_five` discharges it with `multiplicityEstimateElem`.
- Four leaves: `ratLogAlg_mem_iff` (the ℚ-span of 1 and `ℒ` is `ℚ + ℒ`, which gives the lifts through `Υ`), and
  three ℚ analogues of leaves of "Roy's Corollary 1" above: `roy_rat_adapted_basis` (coordinates adapted to a
  subspace rational over ℚ, by a rational matrix), `roy_rat_relation_rank_le` (the rank of the relations returned
  by Th. 11.21) and `roy_rat_period_space` (a space of periods).

Milestone 207 of the Prove2Me mission is the corollary; the other seven joined by import. Apart from
`linear_subgroup_transcendence`, `multiplicityEstimateElem` and `dalag_psi_floor_roy_phi`, they import nothing
proved earlier; in particular not Baker's theorem. The 8 modules have 2,138 lines in `Diaz/Mirror/`.

**A printed proof that misses this case.** DALAG proves Cor. 11.15 (p. 403) from Prop. 11.19, whose proof reads
Th. 11.5 (3′) at the trivial subgroup. For `(ℚ, ℚ + ℒ)` that step fails: Th. 11.5 ranges over subgroups defined
over Q̄, and for `U = ℂ(1, √2, 0) + ℂ(log 2, log 3, log 5)` in `ℂ³` a subgroup with tangent space
`ℂ(1, √2, 0) × {0}` ties with the trivial one and is the one (3′) selects. The example refutes the inference, not
the inequality, and Prop. 11.19 is true; the route above proves the corollary without it. The tie comes from the
algebraic vector `(1, √2, 0)` of `U`, which the second clause of DALAG Lemma 11.18 (2) would exclude; that clause is
false, since `U ∩ kᵈ = 0` does not give `U ∩ Q̄ᵈ = 0`. For `(Q̄, ℒ̃)` the printed step is right.
[`ERRATA.md`](../ERRATA.md) gives both points (A4, B9) with the printed text and the evidence. Prop. 11.19 itself, for
`(ℚ, ℚ + ℒ)`, is formalised in the next section.

### Roy's Theorem 4 and DALAG Prop. 11.19 over ℚ

Two nodes of 14 November 2026, formal proofs of classical results with no hypothesis: Roy's Theorem 4 over ℚ, in the
minimal-ratio form of `roy_theorem_four` (above), and DALAG Prop. 11.19 (p. 402) for `(ℚ, ℚ + ℒ)` as printed, with
the finiteness it claims. Subspaces rational over ℚ are as in the previous section.

- `DiazModulus.dalag_prop_11_19_rat` (milestone) — DALAG Prop. 11.19 for `(ℚ, ℚ + ℒ)`: let `U ⊆ ℂᵈ` have dimension
  `n < d`, and let `T ≠ ℂᵈ`, rational over ℚ, minimise `n′/d′` among such subspaces, where `n′ = n − dim(U ∩ T)` and
  `d′ = d − dim T`. Then the quotient of `U ∩ (ℚ + ℒ)ᵈ` by `U ∩ T ∩ (ℚ + ℒ)ᵈ` is finite-dimensional over ℚ, and its
  dimension `ℓ′` satisfies `ℓ′/(d′ + ℓ′) ≤ n′/d′ ≤ n/d`. From `roy_rat_theorem_four`, applied to lifts of a ℚ-free
  family of the quotient: `n < d` gives `n′ < d′`, so such a family has at most `n′d′` elements.
- `DiazModulus.roy_rat_theorem_four` — Roy 1992, Th. 4 (p. 34) over ℚ, by his Remark (i) (p. 37): for ℚ-free
  `z₁, …, z_ℓ ∈ U ∩ (ℚ + ℒ)ᵈ` and `S` minimising `n′/d′` as above, `ℓ′/(d′ + ℓ′) ≤ n′/d′ ≤ n/d`, where
  `ℓ′ = ℓ − dim_ℚ(span_ℚ(z) ∩ S)`; here `n < d` is not needed. The analogue over ℚ of `roy_theorem_four`, by the same
  passage to `ℂᵈ/S`: from `roy_rat_slope_bound` and `roy_rat_adapted_basis` (above), with the multiplicity estimate
  discharged by `multiplicityEstimateElem`.

Milestone 210 of the Prove2Me mission is the proposition; the theorem joined by import. The 2 modules have 448
lines in `Diaz/Mirror/`.

**Printed proofs completed while formalising.** Roy's Remark (i) says that his Theorem 4 holds over every subfield
`F` of Q̄, with `F + F·ℒ` in place of `ℒ̃`, and that "the proof is the same". That holds for the proof of Theorem 4 and
for the deduction of his Theorem 2 from his Theorem 1, but Theorem 1 is quoted from Waldschmidt over Q̄, and its form
over `F` is not addressed; it follows from Theorem 1 by replacing an additive kernel by the span of its vectors with
coordinates in `F`. The formal proof needs neither Theorem 1 nor Theorem 2: it rests on the slope bound of the
previous section. DALAG's own proof of Prop. 11.19 for `(ℚ, ℚ + ℒ)` has the gap described there and is not used.
[`ERRATA.md`](../ERRATA.md) gives both points (B9, B10) with the printed text, the evidence and the repair.

### DALAG Lemma 12.9, and Cor. 12.23 in the affine form of p. 435

Four nodes of 14 November 2026, formal proofs of classical results with no hypothesis. DALAG §12.1.4 defines the
structural rank of a matrix `M` with entries in a field `K`, over a subfield `k`, through an injective `k`-linear
map from the span of its entries into the linear forms `kX₁ + ⋯ + kXₙ`; Lemma 12.9 (p. 427) allows the affine forms `k + kX₁ + ⋯ + kXₙ`. As in
`dalag_cor_12_22`, the structural rank is computed from a presentation `M = Σⱼ eⱼNⱼ`, with `k`-free `eⱼ` and `Nⱼ`
over `k`: it is the rank of `Σⱼ ZⱼNⱼ` over `k(Z₁, …, Z_m)`.

- `DiazModulus.dalag_lemma_12_9` (milestone) — DALAG Lemma 12.9 (p. 427), for any field `k`: if
  `φ : K → k + kX₁ + ⋯ + kXₙ` is `k`-linear and injective on the span of the `eⱼ`, the rank of `φ(M)` over
  `k(X₁, …, Xₙ)` is the structural rank of `M`. From two helpers, the two steps the printed proof leaves implicit:
  `dalag_lemma_12_9_dehomog`, dehomogenisation keeps the rank (`N₀ + Σᵢ XᵢNᵢ` over `k(X₁, …, X_m)` and
  `Y₀N₀ + Σᵢ YᵢNᵢ` over `k(Y₀, …, Y_m)` have the same rank); and `dalag_lemma_12_8_linear`, DALAG Lemma 12.8 (p. 426)
  for every `k`-linear map into linear forms that is injective on the span of the `eⱼ`, not only for one given by a
  basis. Both rest on `matrix_rank_map_field` (above).
- `DiazModulus.dalag_cor_12_23_affine` (milestone) — DALAG Cor. 12.23 (p. 436) with the matrix of p. 435: if
  `M = M₀ + Σₖ λₖNₖ` with rational `M₀, Nₖ`, `λₖ ∈ ℚ + ℒ` and `1, λ₁, …, λ_m` linearly independent over ℚ, then
  `rank_{ℚ(X₁, …, X_m)}(M₀ + Σₖ XₖNₖ) ≤ 2·rank M`. By Lemma 12.9 the left side is the structural rank over ℚ. From
  `dalag_cor_12_23` (above) and `dalag_lemma_12_9_dehomog`.

Milestones 208 and 209 of the Prove2Me mission are the lemma and the corollary; the other two joined by import. The
4 modules have 356 lines in `Diaz/Mirror/`. DALAG Prop. 12.13, (iv) ⇒ (iii), whose proof uses Lemma 12.9, is
formalised in the next section, with Props. 12.7 and 12.10.

**Printed proofs completed while formalising.** DALAG's proof of Lemma 12.9 (p. 428) obtains the structural rank as
the rank of a homogenised matrix and leaves the dehomogenisation implicit; it also applies Lemma 12.8 to a map not
given by a basis, which the proof of Lemma 12.8 covers. Its proof of Prop. 12.13, (iv) ⇒ (iii) (p. 430), applies
(iv) to a matrix whose entries need not lie in the space `E` that (iv) is about; multiplying that matrix by `x₀`
gives one over `E` with the same rank and, by Lemma 12.9, full structural rank, and the proposition is correct.
Two slips nearby: "k-vector subspace" for "K-vector subspace" in the proof of Prop. 12.7 (p. 426), and "a r × r
matrix" in the remark before Lemma 12.9 (p. 427), meant for a matrix `k`-equivalent to one with a regular `r × r`
block. [`ERRATA.md`](../ERRATA.md) gives each point (B7, B8, C10, C11) with the printed text, the evidence and the
repair.

### DALAG Prop. 12.7, Prop. 12.10, and Prop. 12.13 (iv) ⇒ (iii)

Four nodes of 14 November 2026, formal proofs of classical results with no hypothesis, from DALAG §12.1
(pp. 423–431), which is linear algebra over two fields `k ⊆ K` (in Lean, `K` is a `k`-algebra). A `k`-subspace `E` of
`K` has Property (A B; C 0) (p. 424) if every non-zero matrix `M` with entries in `E` is `k`-equivalent to a block
matrix `(A B; C 0)` with `A` regular: `PMQ` has that shape for some invertible `P`, `Q` with entries in `k`.

- `DiazModulus.dalag_prop_12_7` (milestone) — DALAG Prop. 12.7 (p. 426): if `E` has Property (A B; C 0) and
  `V ⊆ Kᵈ` is a `K`-subspace of dimension `n` with `V ∩ kᵈ = 0`, then `V ∩ Eᵈ` is finite-dimensional over `k`, of
  dimension at most `n(n + 1)/2`. By strong induction on `d`, from `dalag_prop_12_7_step`, the printed inductive
  step: `ℓ` `k`-free vectors of `V ∩ Eᵈ` give `r ≤ dim V`, `r < d`, a `K`-subspace `V₁ ⊆ Kʳ` with `V₁ ∩ kʳ = 0`, and
  `ℓ − r` `k`-free vectors of `V₁ ∩ Eʳ`.
- `DiazModulus.dalag_prop_12_10` (milestone) — DALAG Prop. 12.10 (p. 428), which DALAG credits, with the rest of its
  §12.1.5, to D. Roy: every `P ∈ k[X₁, …, Xₙ]` is `det(A₀ + X₁A₁ + ⋯ + XₙAₙ)` for square matrices `Aᵢ` over `k`;
  here over any commutative ring `k`. By the printed reduction of the degree, through the constructions of DALAG
  Lemmas 12.11 and 12.12; the latter is Mathlib's `Matrix.det_fromBlocks_one₁₁`.
- `DiazModulus.dalag_prop_12_13_iv_iii` (milestone) — DALAG Prop. 12.13, (iv) ⇒ (iii) (p. 430): if every matrix
  over `E` has rank equal to its structural rank over `k` (condition (iv), for presentations `M = Σⱼ eⱼNⱼ` with
  `k`-free `eⱼ ∈ E`, as above), then no non-zero homogeneous polynomial over `k` vanishes at `k`-free
  `x₀, …, xₙ ∈ E`. From `dalag_prop_12_10` and `dalag_lemma_12_9_dehomog` (above), through the matrix `x₀M` of the
  repair below; `k ⊆ E` is not assumed.

Milestones 211–213 of the Prove2Me mission are the three propositions; the step joined by import. The 4 modules have
628 lines in `Diaz/Mirror/`. Not formalised: the other implications of Prop. 12.13, Cor. 12.14, Prop. 12.6,
and Props. 12.2 and 12.5 with the Remark of p. 424.

**Printed proofs completed while formalising.** The two corrections of the previous section now have formal
versions: the inductive step of Prop. 12.7 takes `V₁` as a `K`-subspace, built from `P·V`, and the implication
(iv) ⇒ (iii) of Prop. 12.13 applies (iv) to `x₀M`, whose entries lie in `E`. Three more points nearby. The Remark of
p. 424 carries Property (A B; C 0) along an isomorphism of `k`-vector spaces, which need not preserve it: `ℚ + ℚ√2`
lacks it, although it is ℚ-isomorphic to `ℚX + ℚY`, which has it. The Remark's statement is right, through the
isomorphism `X ↦ 1` and a dehomogenisation. On p. 423, before Prop. 12.5, `k^{n−r}` and `{0}^{n−r}` stand for
`k^{ℓ−r}` and `{0}^{d−r}`. In the proof of Lemma 12.11 (p. 428) the matrices `A` and `B` have `S + 1` blocks, not
`S`. [`ERRATA.md`](../ERRATA.md) gives each point (B8, B11, C10, C12, C13) with the printed text, the evidence and the
repair.

