[← README](../README.md)

## Roy's rank bounds, *Variations*, *Further variations*, DALAG §11–12 and Fischler 2001

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
infinite-dimensional `Y` and DALAG Cor. 12.23 are formalised in the next section, *Further variations* Cor. 1.3 and
Fischler's Th. 1.1 in the second-to-last section, and Fischler's Th. 4.1 and 4.2 in pencil form in the last. Not
formalised: the ℚ + ℒ statement after DALAG Cor. 12.24; Fischler's §4 as printed, on orbits under algebraic groups.

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
628 lines in `Diaz/Mirror/`. The other implications of Prop. 12.13, Cor. 12.14, Prop. 12.6, Prop. 12.2 and the
Remark of p. 424 are formalised in the next section; Prop. 12.5 is not.

**Printed proofs completed while formalising.** The two corrections of the previous section now have formal
versions: the inductive step of Prop. 12.7 takes `V₁` as a `K`-subspace, built from `P·V`, and the implication
(iv) ⇒ (iii) of Prop. 12.13 applies (iv) to `x₀M`, whose entries lie in `E`. Three more points nearby. The Remark of
p. 424 carries Property (A B; C 0) along an isomorphism of `k`-vector spaces, which need not preserve it: `ℚ + ℚ√2`
lacks it, although it is ℚ-isomorphic to `ℚX + ℚY`, which has it. The Remark's statement is right, through the
isomorphism `X ↦ 1` and a dehomogenisation. On p. 423, before Prop. 12.5, `k^{n−r}` and `{0}^{n−r}` stand for
`k^{ℓ−r}` and `{0}^{d−r}`. In the proof of Lemma 12.11 (p. 428) the matrices `A` and `B` have `S + 1` blocks, not
`S`. [`ERRATA.md`](../ERRATA.md) gives each point (B8, B11, C10, C12, C13) with the printed text, the evidence and the
repair.

### DALAG Prop. 12.13 and Cor. 12.14, Prop. 12.6, Prop. 12.2, the Remark of p. 424 and §12.1.6

Sixteen nodes of 18 November 2026, formal proofs of classical results with no hypothesis, from DALAG §12.1
(pp. 418–431), in the setting of the previous section: fields `k ⊆ K` (in Lean, `K` is a `k`-algebra), a `k`-subspace
`E` of `K`, Property (A B; C 0), and the structural rank computed from a presentation `M = Σⱼ eⱼNⱼ` with `k`-free
`eⱼ ∈ E`. Below, condition (ii) is that of Prop. 12.13: whenever `x₁, …, xₙ ∈ E` and `1, x₁, …, xₙ` are linearly
independent over `k`, the `xᵢ` are algebraically independent over `k`.

- `DiazModulus.dalag_prop_12_13` (milestone) — DALAG Prop. 12.13 (pp. 429–430), complete: for `E` containing 1 (that is,
  `k ⊆ E`), four conditions are equivalent. (i) `E` has a basis over `k` made of 1 and elements algebraically
  independent over `k`; (ii) as above; (iii) no non-zero homogeneous polynomial over `k` vanishes at `k`-free
  `x₀, …, xₙ ∈ E`; (iv) every matrix over `E` has rank equal to its structural rank over `k`. `E` may be
  infinite-dimensional. The proof goes round the cycle (i) ⇒ (ii) ⇒ (iv) ⇒ (iii) ⇒ (ii) ⇒ (i), with (ii) ⇒ (iv) in
  place of the printed (i) ⇒ (iv), so that no basis of `E` has to be indexed. The implications are
  `dalag_prop_12_13_i_ii`, an affine change of variables, from `dalag_prop_12_13_i_ii_span` (the same step for the
  span of 1 and any algebraically independent family); `dalag_prop_12_13_ii_iv`, from `dalag_lemma_12_9` (above)
  and evaluation at algebraically independent elements, a homomorphism of fields; `dalag_prop_12_13_iv_iii`
  (above); `dalag_prop_12_13_iii_ii`, with the homogenisation that the printed proof leaves implicit; and
  `dalag_prop_12_13_ii_i`, which extends 1 to a basis and checks algebraic independence on finite subfamilies.
  `dalag_prop_12_13_ii_iv` keeps the hypothesis `1 ∈ E`, which it does not need.
- `DiazModulus.dalag_cor_12_14` (milestone) — DALAG Cor. 12.14 (p. 430): if `E₀ ∩ k = 0`, then `k`-free elements of `E₀`
  are algebraically independent over `k` if and only if every matrix over `k + E₀` has rank equal to its structural
  rank. No proof is printed. Both directions go through Prop. 12.13 for `k + E₀`, with the translation
  `xᵢ = cᵢ + yᵢ` (`cᵢ ∈ k`, `yᵢ ∈ E₀`); the hypothesis `E₀ ∩ k = 0` is used only for the converse.
- `DiazModulus.dalag_prop_12_6` (milestone) — DALAG Prop. 12.6 (p. 425): if `E` has Property (A B; C 0), `V ⊆ Kᵈ` is a
  `K`-subspace of dimension `n` and `Y ⊆ V ∩ Eᵈ` is a finite-dimensional `k`-subspace, then some `K`-subspace `S`
  of `Kᵈ`, rational over `k`, has `ℓ′ ≤ d − d′ ≤ n`, where `d′ = dim_K(Kᵈ/S)` and `ℓ′ = dim_k(Y/(Y ∩ S))`. The
  printed hypothesis `n < d` is not used by the proof and is dropped; for `n = d`, `S = Kᵈ` works. The printed `S`,
  an intersection of hyperplanes, is taken as the span of the first `r` columns of `P⁻¹`, `P` being the left factor
  that the Property gives for the matrix of a basis of `Y`; it is the same space.
- `DiazModulus.dalag_prop_12_2` (milestone) — DALAG Prop. 12.2 (p. 419), Proposition 1 of D. Roy (1990): if `E` is spanned
  over `k` by a family, finite or not, of elements algebraically independent over `k`, every matrix over `E` is
  `k`-equivalent to `(A B; C 0)` with `A` regular or of size 0 × 0. For any field `k`, by the first of the two
  printed proofs (pp. 420–422); the second (p. 424) assumes `k` infinite and is not used. From
  `dalag_prop_12_2_ii` (next item), with (ii) for `E` from `dalag_prop_12_13_i_ii_span`.
- `DiazModulus.dalag_prop_12_2_ii` (milestone) — the first proof of Prop. 12.2, run for every `E` with (ii) in place of a
  span of algebraically independent elements: every matrix over `E`, the zero matrix included, is `k`-equivalent to
  `(A B; C 0)` with `A` regular or empty; `1 ∈ E` is not assumed. DALAG notes (p. 422) that this proof gives a more
  general result, citing Roy 1989; this is such a generalisation. By strong induction on the dimension of the span
  of the entries, as printed, through four steps: `matrix_exists_rank_normal_form` (`PNQ = (I_r 0; 0 0)` over any
  field, by elimination), `dalag_prop_12_2_split` (the choice of `x` and of `E₁` with `E₀ = E₁ ⊕ kx`, where `E₁`
  contains 1 whenever it can), `dalag_prop_12_2_step` (the induction step of pp. 421–422) and `dalag_prop_12_2_det`
  (the closing determinant argument of p. 422, through a Schur complement and a characteristic polynomial, which is
  monic, in place of the leading term `xʳ det A′`).
- `DiazModulus.dalag_remark_12_1_3` (milestone) — the Remark of §12.1.3 (p. 424): if `E₀` is spanned by elements
  algebraically independent over `k`, then `k + E₀` has Property (A B; C 0). For any field `k`, and without the
  printed hypothesis `E₀ ∩ k = 0`, which follows from the algebraic independence. The printed reason passes through
  `K(X)`; the formal proof does not: `k + E₀` satisfies (ii) by `dalag_prop_12_13_i_ii_span`, and
  `dalag_prop_12_2_ii` concludes.
- `DiazModulus.dalag_conclusion_12_1_6` (milestone) — §12.1.6 (p. 431), Property (A B; C 0) as a consequence of
  `r = r_str`: if `E` contains 1 and every matrix over `E` has rank equal to its structural rank, `E` has Property
  (A B; C 0). DALAG says it for `E = k + E₀` with `E₀ ∩ k = 0`; every `E` containing 1 has that form, so `E₀` does
  not appear. From (iv) ⇒ (iii) ⇒ (ii) of Prop. 12.13 and `dalag_prop_12_2_ii`.

Milestones 214–220 of the Prove2Me mission are the seven results marked milestone; the other nine joined by import.
The 16 modules have 1,342 lines in `Diaz/Mirror/`. Not formalised from §12.1: Lemma 12.3 as stated, Prop. 12.4,
Prop. 12.5 with the second proof of Prop. 12.2, and the boxed consequence of Property (A B; C 0) on p. 427,
`r ≥ r_str/2`.

**Printed proofs completed while formalising.** The Remark of p. 424 carries Property (A B; C 0) along an
isomorphism of `k`-vector spaces, which need not preserve it (previous section). The formal proof takes neither that
route nor the repair given there: it runs the first proof of Prop. 12.2 on `k + E₀`. Its step from `x ∉ E₁` to `x`
transcendental over `k(E₁)` (Lemma 12.3) then fails whenever 1 lies in the span of the entries but not in `E₁`: for
`E₁ = k·(1 + b)` and `x = b`, `x` lies in `k(E₁)`. So `E₁` is chosen to contain 1. This is not an error of the book,
since `k + E₀` does not satisfy the conditions of Lemma 12.3. The printed proof of Prop. 12.13 gives three of its
implications in one line each; they are right, and the formal proofs supply the homogenisation and the finite
subfamilies they leave implicit. Cor. 12.14 has no printed proof. Three slips nearby: in the Remark after Prop. 12.2
(p. 419) the block sizes printed for the second and third trivial examples do not fit the shape (12.1); in the proof
of Prop. 12.4 (p. 422) a matrix said to have rank `r₁ − 1` has rank `r₁`; and §12.1.6 (p. 431) refers to § 12.1.5
for `r ≥ r_str/2`, which is in §12.1.4. [`ERRATA.md`](../ERRATA.md) gives the three slips (C14, C15, C16) with the
printed text and the evidence, and names the formal versions of B8 and B11.

### *Further variations* Cor. 1.3, and Fischler 2001: Th. 1.1, §6 and the N.B. of p. 183

Twelve nodes of 18 November 2026, formal proofs of classical results with no hypothesis: Cor. 1.3 of Waldschmidt's
*Further variations*, and, from Fischler 2001, Lemma 6.1, Th. 1.1 (which is Th. 6.2 (1)), Th. 6.2 (2), Th. 6.4 (1)
and (2), Cor. 6.3 (1) and the N.B. of p. 183. They rest on Roy's strong six exponentials theorem
(`strong_six_exponentials_unconditional`, in the library with no hypothesis) and linear algebra, except the N.B.,
which rests on Roy's Corollary 1 through `fischler_prop_5_5`. As above,
Fischler's `ℒ` is `ℒ̃` here, and only his complex case is formalised. A subspace of `ℂᵐ` is defined over Q̄ when it
is spanned by vectors with algebraic coordinates (Fischler, p. 170).

- `DiazModulus.fv_cor_1_3` (milestone) — *Further variations* Cor. 1.3 (p. 3), as printed: if `Λ₁, Λ₂, Λ₃ ∈ ℒ̃`, `Λ₁` is
  transcendental and `1, Λ₂, Λ₃` are Q̄-free, then `Λ₁Λ₂ ∉ ℒ̃` or `Λ₁Λ₃ ∉ ℒ̃`. No proof is printed; the paper
  presents it as a consequence of its Th. 1.1, Roy's strong six exponentials theorem, and the proof is that theorem
  for `x = (1, Λ₁)` and `y = (1, Λ₂, Λ₃)`.
- `DiazModulus.fischler_lemma_6_1` (milestone) — Fischler's Lemma 6.1 (p. 184): non-zero `λ₁, …, λ_q ∈ ℒ̃` in geometric
  progression with transcendental ratio have `q ≤ 3`. Fischler applies his Th. 2.3 (next section) to the
  `2 × (q − 1)` matrix of consecutive terms; here the strong six exponentials theorem is applied to its `2 × 3`
  corner.
- `DiazModulus.fischler_theorem_1_1` (milestone) — Th. 1.1 (pp. 168–169), which is Th. 6.2 (1) (p. 184): if `k ≥ 3` and
  `P = (λ₁X₁ + ⋯ + λ_mX_m)ᵏ` has all its coefficients in `ℒ̃`, then `P = aφᵏ` with `a ∈ ℒ̃` and `φ` a linear form
  with algebraic coefficients. For any `m`; the printed hypothesis that `P` is homogeneous of degree `k` follows
  from `P = Λᵏ` and is omitted. `DiazModulus.fischler_theorem_6_2_two` (milestone) — Th. 6.2 (2) (p. 184): for `k = 2`,
  `P = (aφ₁ + bφ₂)²` with `a, b ∈ ℂ` and `φ₁, φ₂` linear forms with algebraic coefficients. The printed hypothesis
  `m ≥ 2` is dropped; for `m ≤ 2` the conclusion is immediate.
- `DiazModulus.fischler_theorem_6_4_one` and `DiazModulus.fischler_theorem_6_4_two` (milestones) — Th. 6.4 (p. 185), in the
  coordinates of the basis `e_{I(1)} ⊗ ⋯ ⊗ e_{I(k)}`, which is defined over Q̄. (1) If `k ≥ 3` and every product
  `v_{I(1)}⋯v_{I(k)}` of coordinates of `v ∈ ℂᵐ` lies in `ℒ̃`, these products are `a·v′_{I(1)}⋯v′_{I(k)}` with
  `a ∈ ℒ̃` and `v′ ∈ Q̄ᵐ`, for any `m` (printed: `m ≥ 2`). (2) If `m ≥ 2` and every `vᵢvⱼ` lies in `ℒ̃`, then `v`
  lies in a 2-dimensional subspace of `ℂᵐ` defined over Q̄; here `m ≥ 2` is printed and needed.
- `DiazModulus.fischler_cor_6_3` (milestone) — Cor. 6.3 (1) (p. 184): Fischler's Conjecture 1 for the `k`-th powers of
  linear forms, `k ≥ 3`, in the form of its non-trivial inclusion: every such power with coefficients in `ℒ̃` lies on
  a line `ℂQ`, `Q` with algebraic coefficients, made of `k`-th powers of linear forms. From Th. 1.1. Part (2), a
  conditional reduction to the squares of linear forms in two variables, is not formalised.
- `DiazModulus.fischler_centralizer_nb` (milestone) — the N.B. after Prop. 5.5 (p. 183): Th. 1.2 (`fischler_centralizer`,
  above) holds with its hypothesis that the `n²` entries of `M ∈ ℒ̃^{n×n}` are Q̄-free replaced by: no hyperplane of
  `Matₙ(ℂ)` defined over Q̄ contains both `M` and the identity. Hyperplanes are vector hyperplanes, by Fischler's
  convention (p. 169). The freeness implies this hypothesis, so this implies `fischler_centralizer`. The N.B. has
  no separate proof: the printed proof of Th. 1.2 uses the freeness only to show that algebraic `A, B` with
  `Tr(M(AB − BA)) = 0` commute, and otherwise `{N : Tr(N(AB − BA)) = 0}` would be a hyperplane defined over Q̄
  containing `M` and the identity. From `fischler_prop_5_5` and `remond_commuting_subspaces` (above).
- Four helpers: `fischler_linear_pow_prod_mem` (if the coefficients of `Λᵏ` lie in `ℒ̃`, so does every product of `k`
  coefficients of `Λ`; by differentiation and induction on `k`), `fischler_power_span_finrank` (the common core of
  Th. 6.2 and 6.4: if every product of `k ≥ 2` coordinates of `v` lies in `ℒ̃`, then `v₁, …, v_m` span a Q̄-space of
  dimension at most 2, and at most 1 if `k ≥ 3`), `fischler_rational_hull` (the least subspace defined over Q̄ that
  contains `v`, p. 185, as an explicit decomposition `v = Σₐ cₐwₐ`) and `qbar_linearIndependent_complex` (Q̄-free
  vectors with algebraic coordinates are ℂ-free; the proof of the helper of the same name in `roy_period_space`).
  Fischler's proofs of Th. 6.2 and 6.4 apply his Th. 2.3 to a symmetric `n × n` matrix and, for `k ≥ 3`, Lemma 6.1;
  `fischler_power_span_finrank` applies the strong six exponentials theorem to a `2 × 3` corner in both steps and
  does not use Lemma 6.1.

Milestones 221–228 of the Prove2Me mission are the eight printed results; the four helpers joined by import. The 12
modules have 869 lines in `Diaz/Mirror/`. Th. 2.1, 2.3 and 5.3, Cor. 6.5 (1), and Props. 3.1 and 3.2 and Ths. 4.1
and 4.2 in pencil form are formalised in the next section, which lists what is not.

**Printed statements and proofs met while formalising.** The printed proofs of Th. 6.2 (1) and Th. 6.4 (1) stop at
`n ≤ 1` and leave implicit why `a` lies in `ℒ̃`; the formal proofs give the reason: `a` is a Q̄-multiple of the
coefficient `λⱼᵏ` (of the coordinate `vⱼᵏ`). Two points concern results not formalised here. In *Further
variations* (p. 3), the remark after Th. 1.2, that the `d + ℓ` columns of `(I_d M)` are Q̄-free when `M` is a
`d × ℓ` matrix of rank 1 with Q̄-free columns and `d, ℓ ≥ 2`, is false as printed: `M = (1 λ; 1 λ)` with `λ = log 2`
has Q̄-free columns, and `e₁ + e₂ − (1, 1)ᵀ = 0`. It holds when the rows of `M` are Q̄-free too, and the use made of
it is unaffected, since Th. 1.1 assumes both. In Fischler's proof of Prop. 5.7 (p. 183), the step from "dimension at
least 2" to a point of the hyperplane `E` does not follow: an affine subspace of any dimension can miss an affine
hyperplane. The conclusion stands, by a scaling argument on the discriminant. [`ERRATA.md`](../ERRATA.md) gives both
points (A5, B12) with the printed text, the evidence and the repair.

### Fischler 2001: Th. 2.1, 2.3 and 5.3, Cor. 6.5 (1), and Props. 3.1–3.2 and Ths. 4.1–4.2 in pencil form

Eleven nodes of 20 November 2026 from Fischler 2001, with no hypothesis: formal proofs of Cor. 6.5 (1), Th. 2.3,
Th. 5.3 and Th. 2.1; pencil forms of Prop. 3.1, Prop. 3.2, Th. 4.1 and Th. 4.2, which are not printed in this form;
and three routine helpers of linear algebra over Q̄. As in the previous section, Fischler's `ℒ` is `ℒ̃` here, only
his complex case is formalised, a subspace is rational (defined over Q̄) when it is spanned by vectors with algebraic
coordinates, and hyperplanes are vector hyperplanes (p. 169). For `v ∈ ℂᵐ` and `I : {1, …, k} → {1, …, m}`,
`v_I = v_{I(1)}⋯v_{I(k)}` is the coordinate of `v ⊗ ⋯ ⊗ v` (`k` factors) on `e_{I(1)} ⊗ ⋯ ⊗ e_{I(k)}`, a basis
defined over Q̄.

**The pencil forms.** Fischler's §§2.3–5.1 concern a representation `ρ : G → GL(W)` of an affine algebraic group,
both defined over Q̄, an orbit `X`, `d = dim W`, `l = dim G` and `r = dim X`. The pencil forms replace the group by
`d × d` matrices `F₁, …, F_l` with algebraic entries, the images under `Lie(ρ)` of a basis of the Lie algebra defined
over Q̄. For `α ∈ ℂᵈ`, `M_α` is the `d × l` matrix with columns `F_aα`, so that `M_α s = (Σₐ sₐFₐ)α`; orbit
dimensions are read as ranks of `M_α` (Fischler's Lemma 2.4 gives `r = rk M_x`), and `x ∈ X(ℒ)` becomes `x ∈ ℒ̃ᵈ`.
Where the print assumes `(ρ, X)` suitable (p. 172), the pencil forms assume three linear consequences: (S1′)
`F₁, …, F_l` are Q̄-free; (S2′) no non-zero algebraic `φ` has `φᵀFₐ = 0` for every `a`; (S3′) `(d + l)·rk M_x < dl`.
These four statements are not printed in this form, and their titles say so. That they are the right reading of
Fischler's statements rests on an argument, not on a formal proof of the dictionary: suitability gives (S1′)–(S3′),
and a Zariski-dense orbit, when there is one, is the set of `α` with `rk M_α = d`. The printed statements, on
algebraic groups, are not formalised.

- `DiazModulus.fischler_cor_6_5` (milestone) — Cor. 6.5 (1) (p. 185): Fischler's Conjecture 1 for the tensors
  `v ⊗ ⋯ ⊗ v`, `k ≥ 3`, in the form of its non-trivial inclusion. If every `v_I` lies in `ℒ̃`, there is `y` with
  algebraic coordinates such that `(v_I)_I` lies in `ℂy` and every element of `ℂy` is a tensor `v″ ⊗ ⋯ ⊗ v″`. For any
  `m`; Th. 6.4, on which it rests, is printed for `m ≥ 2`. From `fischler_theorem_6_4_one` (previous section):
  `v^{⊗k} = a·v′^{⊗k}` with `v′` algebraic, `y = v′^{⊗k}`, and `γy = (zv′)^{⊗k}` when `zᵏ = γ`. Part (2), a
  conditional reduction to `k = m = 2`, is not formalised.
- `DiazModulus.fischler_theorem_2_3` (milestone) — Th. 2.3 (p. 171), as printed: if a `d × l` matrix of rank 1 with
  entries in `ℒ̃` has `d ≥ 2` and `l ≥ 3`, its rows or its columns are linearly dependent over Q̄. It is the `d × l`
  form of Roy 1992, Cor. 2, which Roy prints for `2 × 3` matrices only (p. 38); Fischler presents it as a corollary
  of his Th. 2.1. Here it comes from the strong six exponentials theorem: write `Mᵢⱼ = uᵢcⱼ`; Q̄-free rows and
  Q̄-free columns make `u` and `c` Q̄-free, and the theorem applies to `(u₁, u₂)` and `(c₁, c₂, c₃)`.
- `DiazModulus.fischler_theorem_5_3` (milestone) — Th. 5.3 (p. 180), in the setting of §5.1: if `m, k ≥ 2`,
  `(k, m) ≠ (2, 2)` and every `v_I` lies in `ℒ̃`, then `Σ_I ψ_I v_I = 0` for some algebraic `ψ_I`, not all zero. That
  is Conjecture 2 for the tensors `v ⊗ ⋯ ⊗ v` with a vector hyperplane, where Conjecture 2 asks for an affine one, so
  it is slightly stronger than printed; Fischler notes that his method gives vector hyperplanes (p. 169). The printed
  proof goes through the orbit results of §4 and is sketched (p. 178). This one uses a single bound and no orbit
  theory: by `fischler_power_span_finrank` (previous section), `v₁, …, v_m` span a Q̄-space of dimension at most 2,
  at most 1 if `k ≥ 3`, hence less than `m`; a relation `Σ βᵢvᵢ = 0` over Q̄ gives `ψ`, supported on the
  multi-indices `(i, 1, …, 1)`, since `Σᵢ βᵢvᵢv₁^{k−1} = 0`.
- Three helpers, routine linear algebra over Q̄: `rational_common_kernel` (a rational `T ⊆ ℂᵈ` is the common kernel
  of `d` linear forms with algebraic coefficients, one half of Fischler's remark of p. 170; zero forms and rows of
  the matrix of the automorphism given by `roy_rational_adapted_basis`, above), `rational_proper_annihilator` (a
  rational `T ≠ ℂᵈ` is killed by a non-zero linear form with algebraic coefficients, one of those `d` forms) and
  `rational_preimage_finrank` (for a complex `d × l` matrix `M` and any subspace `T ⊆ ℂᵈ`, some rational `S ⊆ ℂˡ` has
  `MS ⊆ T` and `dim S = dim_Q̄(W ∩ T)`, `W` the Q̄-span of the columns of `M`; `S` is spanned by algebraic preimages
  of a Q̄-basis of `W ∩ T`, which are ℂ-free by `qbar_linearIndependent_complex`). `rational_preimage_finrank` keeps
  the hypothesis that the columns of `M` are Q̄-free, which its proof does not use.
- `DiazModulus.fischler_theorem_2_1` (milestone) — Th. 2.1 (pp. 170–171), Roy's Th. 4 in Fischler's form, in
  coordinates for bases defined over Q̄: if `M ∈ ℒ̃^{d×l}` has rank `r`, Q̄-free columns, Q̄-free rows and
  `(d + l)r < dl`, there are rational `S ⊆ ℂˡ` and `T ⊆ ℂᵈ` with `MS ⊆ T`, of codimensions `l₁, d₁ ≥ 1`, and an
  integer `r₁ ≥ 1` with `r₁d < rd₁` and `l₁d₁ ≤ r₁(l₁ + d₁)`. The printed hypothesis that the spaces are non-zero
  follows from `(d + l)r < dl` and is omitted. The proof takes a rational `T ≠ ℂᵈ` minimising
  `(r − dim(U ∩ T))/(d − dim T)`, `U` the column space of `M` (`roy_theorem_four_exists`), and for `S` the space
  given by `rational_preimage_finrank`. Roy's Th. 4 (`roy_theorem_four`) at `T` gives `l₁d₁ ≤ r₁(l₁ + d₁)` and
  `r₁d ≤ rd₁`. The second is strict because Th. 4 holds at every minimiser: in case of equality the zero subspace is
  a minimiser too, and Th. 4 there gives `dl ≤ r(d + l)`, against the hypothesis. `rational_proper_annihilator` and
  the Q̄-free rows give `U ⊄ T`, hence `r₁ ≥ 1` and `l₁ ≥ 1`.
- `DiazModulus.fischler_prop_3_2_pencil` — Prop. 3.2 (p. 174) in pencil form, not printed in this form: for `d ≥ 1`,
  algebraic `F₁, …, F_l` and `x ∈ ℒ̃ᵈ`, with `r = rk M_x` and `𝓔` the least rational subspace containing `x` (the
  intersection of all of them), there are subspaces `S ⊆ ℂˡ` and `T ⊆ ℂᵈ`, of codimensions `l₁` and `d₁ ≥ 1`, with
  `(d − r)l₁ ≤ rd₁` and `(Σₐ sₐFₐ)α ∈ T` for every `s ∈ S` and `α ∈ 𝓔`. No property of the `Fₐ` beyond being
  algebraic is assumed, and, as printed, `S` and `T` are not said to be rational. The proof is the printed one: Roy's
  Corollary 1 (`roy_rank_bound`, Fischler's Cor. 2.2) applied to `M_x`, with `fischler_rational_hull` (previous
  section) to pass from `x` to `𝓔`.
- `DiazModulus.fischler_theorem_4_2_pencil` (milestone) — Th. 4.2 (p. 175) in pencil form, not printed in this form.
  Printed: if `ρ` has a Zariski-dense orbit `Y` and `X` has dimension `r < d/2`, every `x ∈ X(ℒ)` lies in a subspace
  defined over Q̄ that is disjoint from `Y`. Pencil form: for algebraic `F₁, …, F_l` and `x ∈ ℒ̃ᵈ` with
  `2·rk M_x < d`, some rational `E` containing `x` has `rk M_α < d` for every `α ∈ E`. Disjointness from `Y` is read
  as `rk M_α < d`, and the dense-orbit hypothesis is dropped, so the pencil form is a little more general. The proof
  is the printed one: `E` is the least rational subspace containing `x`, and on it the pencil form of Prop. 3.2, with
  rank–nullity for `M_α` on `S`, turns `rk M_α = d` into `d₁ ≤ l₁` and then `d ≤ 2r`. From
  `fischler_prop_3_2_pencil`, `fischler_rational_hull` and `rational_common_kernel`.
- `DiazModulus.fischler_prop_3_1_pencil` — Prop. 3.1 (p. 173) in pencil form, not printed in this form: under
  (S1′)–(S3′), if `x ∈ ℒ̃ᵈ` lies in no hyperplane defined over Q̄, there are subspaces `S ⊆ ℂˡ` and `T ⊆ ℂᵈ`, of
  codimensions `l₁, d₁ ≥ 1`, such that the image of `Σₐ sₐFₐ` lies in `T` for every `s ∈ S`, and an integer `r₁ ≥ 1`
  with `r₁d < rd₁` and `l₁d₁ ≤ r₁(l₁ + d₁)`, `r = rk M_x`. As printed, `S` and `T` are not said to be rational. The
  proof is the printed one (pp. 173–174): (S1′), (S2′) and the hypothesis on `x` make the columns and the rows of
  `M_x` Q̄-free, Th. 2.1 applies to `M_x`, and `rational_common_kernel` extends `(Σₐ sₐFₐ)x ∈ T` to the whole image
  of `Σₐ sₐFₐ`.
- `DiazModulus.fischler_theorem_4_1_pencil` (milestone) — Th. 4.1 (pp. 174–175) in pencil form, not printed in this
  form: if `k ≥ 2`, (S1′)–(S3′) hold, `d < rk M_α + k` for some `α ∈ ℂᵈ` (printed: an orbit of codimension less than
  `k`) and `k·rk M_x ≤ d` (printed: `r ≤ d/k`), then `x` lies in a hyperplane defined over Q̄: `φ · x = 0` for some
  non-zero algebraic `φ`. The proof is the printed one (p. 175), its arithmetic cleared of denominators: otherwise
  the pencil form of Prop. 3.1 and rank–nullity for `M_α` give `d₁ ≤ l₁ + k − 1`, and the inequalities on `r₁` then
  fail both for `l₁ = 1` and for `l₁ ≥ 2`.

Milestones 229–234 of the Prove2Me mission are Cor. 6.5 (1), Th. 2.3, Th. 5.3, Th. 2.1 and the pencil forms of
Th. 4.2 and Th. 4.1; the other five nodes joined by import. The 11 modules have 983 lines in `Diaz/Mirror/`.
Not formalised from Fischler 2001: Th. 5.1; Th. 5.4; Prop. 5.7, which assumes the Algebraic Independence Conjecture;
the conditional reductions Cor. 6.3 (2) and Cor. 6.5 (2); and the printed statements of Props. 3.1 and 3.2 and
Ths. 4.1 and 4.2, on algebraic groups.

**Printed proofs met while formalising.** No error was found in the printed statements formalised here or in the
printed proofs followed, and [`ERRATA.md`](../ERRATA.md) has no entry for them. A step is left implicit in Th. 2.1.
Fischler derives Th. 2.1 from Roy's Th. 4 and points to Roy's proof of Cor. 1 (p. 38), which applies Th. 4 at one
minimiser and gives only `r₁/d₁ ≤ r/d`. The strict inequality needs Th. 4 at the zero subspace as well; Roy states
Th. 4 for every minimiser (p. 34), so the step is available, and the formal proof takes it.

