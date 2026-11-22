[← README](../README.md)

## Results on Diaz's conjecture

### Consequences of Roy's strong six exponentials theorem

Ten nodes of 1 October 2026 carry Roy's strong six exponentials theorem as the hypothesis `hSSE` (later rounds added more), in the form of
`candidate_multiplier_module`: if `x₁, x₂` and `y₁, y₂, y₃` are linearly independent over `Q̄`, one of
the six products `xᵢyⱼ` is not in `ℒ̃`. Every statement was read on the page first. Since 30 October 2026 they hold
with no hypothesis: `Diaz/RoyUnconditional.lean` states each as `<name>_unconditional`.

- `DiazModulus.strong_six_exponentials_iff_quotient_form` — Diaz 2007, Théorème 3: the theorem is
  equivalent to its four-logarithm quotient form. No hypothesis; it also connects the two forms in
  which earlier nodes carry the theorem.
- `DiazModulus.diaz_2007_cor1_PQ`, `diaz_2007_cor2_P_consequences`, `diaz_2007_cor4`,
  `diaz_2007_cor5` — Diaz 2007, Corollaires 1 (PQ), 2 (P) 2) with its Conséquences 1–3, 4 and 5, in
  general.
- `DiazModulus.candidate_cube_and_axis_multiple_not_mem_logAlgTilde` — every candidate has
  `u³ ∉ ℒ̃`, and `λu ∉ ℒ̃` for every transcendental `λ ∈ ℒ̃` on the real or imaginary axis; so
  `e^{βπu}` is transcendental for every algebraic `β ≠ 0`. Diaz's general proofs use Baker's theorem;
  at a candidate, Hermite–Lindemann does that step.
- `DiazModulus.pi_powers_not_both_mem_logAlgTilde` — `π²` and `π³`, `π²` and `1/π`, `1/π` and `1/π²`
  are pairwise not both in `ℒ̃` (Diaz's own instances at `λ = iπ`). An exception to (S) would therefore
  make `e^{π²}` transcendental.
- `DiazModulus.algebraic_modulus_log_multiplier_rational` — with Baker's theorem as a second
  hypothesis: if `λ ∈ ℒ ∖ {0}`, `u ∈ ℒ̃`, and `|u|` and `e^{uλ}` are algebraic, then `u ∈ ℚ` or
  `uλ/λ̄ ∈ ℚ`. For arbitrary `u` this is an open question in Waldschmidt's book (2000, p. 399), which
  derives it from the strong four exponentials conjecture (`algebraic_modulus_log_multiplier_rational_of_sfe`,
  below); the derivation of the case `u ∈ ℒ̃` was not found in the sources read.
- Two helpers: `logAlgTilde_conj_stable` and `quadratic_eq_zero_of_not_mem_Qbar`.
- The rest of Diaz 2007 §2, added the same day: `diaz_2007_cor3_Q`, `diaz_2007_th4`,
  `diaz_2007_cor6`, `diaz_2007_th5`, `diaz_2007_cor7` (the modular statement (C4) of Diaz 1997 when τ or
  1/τ lies in `ℒ̃`), `diaz_2007_th6` and `diaz_2007_th7` (`u, u², u³` not all in `ℒ̃`). Parts that need
  it carry Baker's theorem as a second hypothesis.

Apart from that one derivation, no new mathematics is claimed.

### Where the strong six exponentials route stops

`DiazModulus.power_hull_strong_six_exp_configuration_iff`: for transcendental `u` and `k ≥ 1`, a
configuration of the strong six exponentials theorem with all six products in
`Q̄u⁻ᵏ + Q̄u⁻¹ + Q̄ + Q̄u + Q̄uᵏ` exists iff `k = 2` or `k = 3`. At a candidate, `ℒ̃` contains `1`, `u` and
`ū = |u|²/u`, and with `uᵏ` also `ūᵏ`; so the theorem, fed with the candidate's own data, excludes
`u²` and `u³` from `ℒ̃` and no higher power. The proof counts orders at `0` of polynomials supported on
`{0, k−1, k, k+1, 2k}`. Not found in the sources read; Diaz (2007, p. 390) remarks that inside that
theorem one cannot hope to go very far.

### No 2×3 configuration on generic data (Theorem A)

`DiazModulus.generic_circle_point_no_two_by_three_configuration` (4 October 2026): let u ≠ 0 with uū algebraic,
and let w₁, …, w_m be numbers such that u, w₁, …, w_m are algebraically independent over Q̄. Then no Q̄-independent
x₁, x₂ and y₁, y₂, y₃ have all six products x_i y_j in Q̄ + Q̄u + Q̄ū + ΣQ̄w_j.

For a candidate and logarithms w_j, this means Roy's strong six exponentials theorem cannot refute the candidate
on generic data, and neither can any statement whose hypothesis is a rank-one 2×3 configuration, whatever
logarithms are added.
- The case m = 0 is Roy's (1995, Th. 3.4).
- The case m = 1, w = iπ is `DiazModulus.generic_no_strong_six_exp_configuration`.
- The proof is algebra: polynomials of total degree at most two, and the ring map X₀ ↦ 0.

### Which four-dimensional extensions carry one (Theorem B)

`DiazModulus.circle_point_extension_two_by_three_configuration_iff` (5 October 2026): let u ∉ Q̄ with uū algebraic,
and z ∉ H₀ = Q̄ + Q̄u + Q̄ū. Then H₀ + Q̄z carries Q̄-independent x₁, x₂ and y₁, y₂, y₃ with all six products in it
exactly when z ∈ H₀ + Q̄w for w = u², w = ū² or w = 1/(u − a) with a algebraic and non-zero.
- With Roy's strong six exponentials theorem, these are Diaz's exclusions at a candidate (2007, Cor. 5(1) and
  5(4)). Every configuration in such a space is a geometric progression b, bh, bh², bh³, the shape of Fischler
  (2001, Lemma 6.1) and Diaz (2007, Th. 7(2)).
- The classification was not found in these terms in the sources read, but it is routine: its steps are printed
  (Bachoc–Serra–Zémor, Lemma 4; for the Möbius step, rank-three quadrics through a rational normal curve: Park 2024,
  Park–Sim 2025, Arbarello–Harris 1981). Since ℒ̃ is closed under conjugation, z ∈ ℒ̃ brings z̄
  with it; the five-dimensional spaces H₀ + Q̄z + Q̄z̄ are the next section.
- Five nodes: the progression lemma, a normal form for cubics with P₁P₂ = P₀², the progression step, the three
  configurations, and the equivalence.

### Five-dimensional spaces that Theorem B cannot see

`DiazModulus.circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions` (6 October 2026):
let u ∉ Q̄ with ρ = uū algebraic, a ∈ Q̄ non-zero, and z = u/(u² − a) if aā ≠ ρ², or z = u/(u² − a)² if aā = ρ².
Then W = H₀ + Q̄z + Q̄z̄ carries a configuration (the progression b, bu², bu⁴, bu⁶), but no four-dimensional
H₀ + Q̄w inside W does.
- The configuration's shape is printed (Diaz 2004, Th. 2; Diaz 2007, Th. 6(1) and 7(1)), and so are, up to one
  substitution, its consequences at a candidate: u/(u² − a) ∉ ℒ̃ is Diaz 2004, Th. 2 at x = (u, ū), and
  u/(u² − a)² ∉ ℒ̃ is Diaz 2007, Th. 6(3) (`DiazModulus.candidate_div_sq_sub_not_mem_logAlgTilde`).
- What was not found in the sources read is the invisibility to Theorem B's spaces; the proof is short (parity in u).
- For aā = ρ² the conjugation-stable H₀ + Q̄·u/(u² − a) carries none
  (`DiazModulus.conj_stable_circle_point_extension_no_two_by_three_configuration`): the conjugate z̄ is what lets
  the strong six exponentials theorem see u/(u² − a).
- Five nodes: the configuration, the exclusion of u², ū² and 1/(u − b), the invisibility, the contrast, and the
  exclusions at a candidate.

### Separation, a normal form, and Laurent hulls

Eighteen nodes of 8 October 2026 put the previous sections into one mechanism, over any subfield K of ℂ.
- **Separation** (`DiazModulus.rank_one_config_separation`): for K ≤ F, a K-space V₀ ⊆ F and w₁, …, w_m
  algebraically independent over F, every p×q configuration (p, q ≥ 2) in V₀ + Kw₁ + … + Kw_m lies in V₀. The
  numbers iπ of `generic_period_never_enters` and the w_j of Theorem A above are cases.
- **The normal form** (`DiazModulus.circle_point_two_by_two_normal_form`): for u transcendental over K with uū ∈ K,
  the 2×2 configurations in H₀ = K + Ku + Kū are exactly x = μ·P(1, u), y = μ⁻¹·Q(1, ū) with P, Q ∈ GL₂(K): one
  orbit, that of the certificate (1, u) ⊗ (1, ū). Their constant terms form the invertible matrix P·diag(1, ρ)·Q
  (`DiazModulus.circle_point_config_constant_matrix_det_ne_zero`), so at a candidate every row and column has an
  entry outside the Q̄-span of the logarithms
  (`DiazModulus.candidate_two_by_two_config_entry_not_mem_span_logAlg`, with Baker's theorem).
- **Laurent hulls** (`DiazModulus.laurent_hull_config_iff`): span_K{uˢ : s ∈ S}, S finite, carries a p×q
  configuration iff S contains a sumset A + B with |A| = p, |B| = q. The power hulls above are the case
  S = {0, ±1, ±k}. For S = {0, ±1, ±k, ±l} with 4 ≤ k < l, a 2×3 configuration exists iff
  l ∈ {k+1, k+2, 2k−1, 2k, 2k+1, 3k} (`DiazModulus.power_pair_hull_two_by_three_iff`); and the hull of
  {0, ±1} ∪ {±4ʲ : j ≥ 1} carries none (`DiazModulus.four_pow_hull_no_two_by_three`), so the strong six
  exponentials theorem, used through Laurent hulls, cannot exclude "u^{4ʲ} ∈ ℒ̃ for all j" at a candidate.
- The tools: the trailing-degree count, linear Cauchy–Davenport in K[X] (a case of Eliahou–Lecouvey, Th. 6.2, as
  stated in Bachoc–Serra–Zémor 2017, Th. 2), and p + q ≤ dim V₀ + 1 for configurations in K(u).
- Separation, the normal form and the Laurent criterion were not found in the sources read. The pairs of powers
  excluded at a candidate (`DiazModulus.candidate_power_pair_not_both_mem_logAlgTilde`) are not claimed: each case is
  one substitution in Diaz (2007, Cor. 2(P)(1), Th. 7(1), Cor. 5).

### Two poles, and Kirby's weak Schanuel conjecture

Seven nodes of 9 October 2026.
- **Two poles** (`DiazModulus.circle_point_two_pole_configuration_invisible_to_four_dimensional_extensions`): for
  u ∉ Q̄ with uū algebraic and any distinct non-zero algebraic a₁, a₂, the space
  H₀ + Q̄u/(u² − a₁) + Q̄u/(u² − a₂) carries a configuration (the progression b, bu², bu⁴, bu⁶) that no
  four-dimensional H₀ + Q̄w inside it carries. This drops the conjugation condition of the five-dimensional section's first
  family and covers the third family, a₁ā₁ = a₂ā₂ = ρ². At a candidate, u/(u² − a₁) and u/(u² − a₂) are not both
  in ℒ̃, and in the third family their sum is not; both are one substitution in Diaz (2007, Th. 7(2)), which is
  Fischler (2001, Lemma 6.1), and are not claimed.
- **Kirby's weak Schanuel conjecture** (Kirby 2018, Conj. 1.5), only its case n = 2, as a hypothesis: every
  candidate has Im u ∈ πℚ (`DiazModulus.candidate_im_mem_pi_rat_of_weak_schanuel`), and Diaz's conjecture is
  equivalent to the single relation "t² + π² is transcendental for real t ≠ 0 with eᵗ algebraic"
  (`DiazModulus.diaz_iff_single_relation_of_weak_schanuel`). Not found in the sources read. The weak form says
  nothing about that relation itself, whose logarithms always satisfy 2·iπ ∈ 2πiℤ.

### Every involution of the u-line

Four nodes of 10 October 2026 extend the two-pole spaces to every Möbius involution τ of the u-line.
- τ is given by its pencil q₁, q₂ (coprime quadratics). For non-zero l₁, l₂ in the pencil, the space
  H₀ + Σᵢ Q̄ q₁(u)ⁱq₂(u)³⁻ⁱ/(u l₁(u) l₂(u)) carries a configuration (the progression with ratio q₁(u)/q₂(u)). It
  contains none of u², u⁻² and 1/(u − b), so no four-dimensional space of Theorem B inside it carries one
  (`DiazModulus.involution_pencil_configuration_invisible_to_four_dimensional_extensions`). τ: u ↦ −u is the
  previous section.
- Conversely, every five-dimensional space containing a progression with ratio rational in u is visible to
  Theorem B or of this form (`DiazModulus.progression_space_contains_square_or_reciprocal_or_eq_involution_pencil_space`,
  12 October 2026). The ratio has degree at most 2 (`DiazModulus.progression_space_ratio_degree_le_two`, through
  the degree formula in Mathlib's proof of Lüroth's theorem); degree 1 is the next section's index-one node, degree 2
  gives the involution space (`DiazModulus.quadratic_ratio_progression_space_eq_involution_pencil_space`). The
  progression step is Bachoc–Serra–Zémor (2017, Lemma 4) and stays in the research notes.
- A configuration whose products fill the space can be invisible too: Q̄u⁻¹ + Q̄ + Q̄u + Q̄u³ + Q̄u⁴
  (`DiazModulus.laurent_case_two_configuration_invisible`). That space is not stable under conjugation.
- Not found in the sources read.

### Conjugation-stable configurations that are not progressions

Seven nodes of 11 October 2026.
- **The family.** For u ∉ Q̄, s ∈ Q̄ real with s² = uū, λ ∈ Q̄ with |λ| = 1 and f real, the span of 1, u, ū, f,
  f/(s + λu) is stable under conjugation and carries the configuration (1, u) ⊗ (u⁻¹, 1, f/(s + λu))
  (`DiazModulus.conj_stable_real_pencil_space_carries_two_by_three_configuration`). Conversely, if 1, u, ū, g, ug are
  free and ḡ ∈ Q̄ + Q̄u + Q̄ug, the span of 1, u, ū, g, ug is one of these
  (`DiazModulus.conj_equivariant_degree_one_space_eq_real_pencil_space`).
- **An invisible member with no progression.** For λ = 1 and f = u²/s² + s²/u², the space contains none of u², ū²
  and 1/(u − b), so no four-dimensional space of Theorem B inside it carries a configuration
  (`DiazModulus.real_pencil_quartic_configuration_invisible_to_four_dimensional_extensions`). Its polar divisor has
  degree 5, so it contains no progression: conjugation-stable invisible spaces need not contain a
  progression.
- **At a candidate**, under Roy's strong six exponentials theorem, f and f/(|u| + λu) are not both in ℒ̃
  (`DiazModulus.candidate_real_pencil_not_both_mem_logAlgTilde`). This is one substitution in Diaz (2007, Th. 7(1))
  and is not claimed.
- **Index one is visible.** If h is a Möbius function of u and Q̄ + Q̄u + Q̄u⁻¹ + Σ_{k≤3} Q̄ c hᵏ has dimension 5, it
  contains u², u⁻² or some 1/(u − b) (`DiazModulus.mobius_progression_space_contains_square_or_reciprocal`). The
  proof uses only one relation c u p(u) = r(u) between the progression and Q̄ + Q̄u + Q̄u⁻¹, not the divisor argument
  of the notes.
- **Two hypotheses.** Kirby's weak Schanuel conjecture for n = 2, with Schanuel's conjecture over the kernel 2πiℚ for
  n = 1, implies Diaz's conjecture (`DiazModulus.diaz_of_weak_schanuel_and_kernel_schanuel`). The second hypothesis
  contains the algebraic independence of e and π, which is open.
- Not found in the sources read, except the candidate statement; all routine.

### Case II beyond degree one

Eleven nodes of 14 October 2026 and four of 15 October, from the R12 research notes.
- **A space with no factor of degree one.** For u ∉ Q̄ and s ∈ Q̄ real with s² = uū, put F = u³/s³ + u²/s². The span
  of 1, u, ū, F, F̄ is stable under conjugation, the six products of (1, u²) and (ū, u + s, F̄) span it, and it is
  invisible to Theorem B (`DiazModulus.laurent_cubic_configuration_invisible_to_four_dimensional_extensions`). No
  configuration in it has a Möbius ratio (`DiazModulus.laurent_cubic_space_no_mobius_ratio_configuration`), so it is
  none of the real pencil spaces above.
- **Two orbits of u ↦ −u.** The span of 1, u, u⁻¹, α/(u − a) + β/(u + a), γ/(u − b) + δ/(u + b) carries a spanning
  configuration with factor (1, u²) and is invisible when α ≠ β or γ ≠ δ
  (`DiazModulus.two_orbit_configuration_invisible_to_four_dimensional_extensions`); α = β, γ = δ is the two-pole family.
  With |a| = |b| = |u| and β/α, δ/γ real it is stable under conjugation (`DiazModulus.conj_stable_two_orbit_space`),
  and its configuration is then that of Diaz's Théorème 7(1) of 2007 at v = u.
- **No factor of degree three or more.** If 1, u, u⁻¹ lie in the span of c, ch, ch², ck, chk with h = p(u)/q(u), then
  max(deg p, deg q) ≤ 2 (`DiazModulus.progression_pair_span_ratio_degree_le_two`, through the degree formula in
  Mathlib's proof of Lüroth's theorem).
- **Visibility for Laurent f.** For a real Laurent polynomial f of width k in u/s, the real pencil space W(λ, f) is
  invisible when k ≥ 3, or k = 2 and f(−λ̄) ≠ 0, and contains u² when k = 2 and f(−λ̄) = 0
  (`DiazModulus.laurent_real_pencil_configuration_invisible_to_four_dimensional_extensions`,
  `DiazModulus.laurent_real_pencil_space_contains_square_of_root`).
- **Orbits exchanged by conjugation, and the cyclic case.** With g = a₁/(u − a) + a₂/(u + a), |a| ≠ |u| and a₁ ≠ a₂,
  conjugation exchanges the orbits ±a and ±s²/ā, and the span of 1, u, u⁻¹, g, ḡ is stable under conjugation,
  carries a spanning configuration and is invisible
  (`DiazModulus.conj_swapped_two_orbit_configuration_invisible_to_four_dimensional_extensions`). With v = u/s, the
  span of 1, u, ū, G₁ = 1/(v − 1) + 2/(v + 1) and G₂ = 1/(v − 1)² + 1/(v − 1) − 2/(v + 1)² + 2/(v + 1) is stable
  under conjugation and invisible, (1, u²) acts on G₁, G₂ as a Jordan block modulo 1, u, ū, and no configuration in
  it has a Möbius ratio (`DiazModulus.cyclic_pair_configuration_invisible_to_four_dimensional_extensions`,
  `DiazModulus.cyclic_pair_space_no_mobius_ratio_configuration`). Both configurations are that of Diaz's
  Théorème 7(1) at v = u, with w = ug and w = uG₂.
- The classification of the degree-two case is formal without conjugation, as Theorem NF below, and the visibility
  criterion in the form of "Which degree-one spaces Theorem B sees". In the research notes only, not formalised: the
  three conjugation-stable families of the degree-two case, for every involution of the u-line that commutes with
  conjugation: two of its orbits fixed or exchanged by conjugation, and a cyclic family. Each family has a formal
  member above, all for the involution u ↦ −u.
- Not found in the sources read, except the configurations of the conjugation-stable spaces: each is that of Diaz's
  Théorème 7(1) of 2007 at v = u (for the Laurent cubic space w = u² + su, so `F ∉ ℒ̃` at a candidate is one
  substitution there). What was not found is their invisibility and the absence of Möbius ratios. All routine. At a
  candidate they add nothing: Roy's theorem already excludes every such space.

### Polynomial hulls, and a barrier

Ten nodes of 16 October 2026, from a research note in this repository (`tex/diaz-theorem-c.tex`, written by Claude
agents and refereed by agents and computer algebra; the parts below are now formal).
- **Theorem C.** For u ∉ Q̄ with uū algebraic and P ∈ Q̄[X], the span of 1, u, ū, P(u), P(u)‾ carries a 2×3
  configuration exactly when deg P is 2 or 3 (`DiazModulus.polynomial_hull_two_by_three_configuration_iff`). The
  configurations are Diaz's Théorème 7(1) of 2007 (and his Théorème 2 of 2004); the case P = Xᵏ of the converse is the
  power-hull theorem above. For deg P ≥ 4 the proof counts orders at 0 and degrees together, with
  `DiazModulus.five_point_sumset_rigid` and `DiazModulus.polynomial_submodule_degrees_card`
  (`DiazModulus.polynomial_hull_no_two_by_three_configuration`).
- **Real polynomials in Re u and Im u** with algebraic coefficients carry no configuration in their hull
  (`DiazModulus.real_polynomial_hull_no_two_by_three_configuration`, from Theorem B). So at a candidate, Roy's theorem
  cannot exclude (Re u)² or Re u · Im u from ℒ̃ one number at a time.
- **A barrier.** Over subfields K ⊆ F, a 2×3 configuration in V₀ + Ku + Ku⁻¹, with V₀ ⊆ F and u transcendental over
  F, has its products in V₀ (`DiazModulus.rank_one_config_inverse_adjoin`). So, under Roy's theorem, ℒ̃ + Q̄u + Q̄ū
  carries no configuration when uū is algebraic and u is transcendental over the field of ℒ̃
  (`DiazModulus.logAlgTilde_adjoin_circle_point_no_two_by_three_configuration`).
- The rest of the research note is formal too: its Theorem E, the classification of all polynomials in u and ū,
  and the rest of its Theorem D (Baker's and Gel'fond–Schneider's theorems, the six exponentials theorem over Q and
  the four exponentials theorem in transcendence degree one, in the same model). See below.
- Not found in the sources read, except the configurations of degrees 2 and 3; all routine.

### Which degree-one spaces Theorem B sees

Six nodes of 18 October 2026. A degree-one space W_g = span(1, u, ū, g, ug) always carries the configuration
(1, u) ⊗ (ū, 1, g). Theorem B sees it through a four-dimensional subspace exactly when u·R(u)·g = N(u) for some
R ≠ 0 of degree at most 2 and N of degree at most 3
(`DiazModulus.degree_one_space_visible_to_four_dimensional_extensions_iff_cubic_over_quadratic`). This is the
completeness criterion of the research notes, stated without divisors on P¹, which Mathlib does not have.
- **Rational data.** For g = P(u)/Q(u) in lowest terms, W_g is visible exactly when
  max(deg P, deg Q) ≤ 2 + [Q(0) = 0]
  (`DiazModulus.rational_degree_one_space_visible_to_four_dimensional_extensions_iff_natDegree_le`).
- **Pencil spaces.** For W(λ, f) = span(1, u, ū, f, f/(s + λu)) with |λ| = 1 and f = P(u)/Q(u), the bound is
  max(deg P, deg Q + 1) ≤ 2 + [Q(0) = 0] + [P(−sλ̄) = 0]
  (`DiazModulus.rational_pencil_space_visible_to_four_dimensional_extensions_iff_natDegree_le`). For Laurent f it
  contains `DiazModulus.laurent_real_pencil_configuration_invisible_to_four_dimensional_extensions`, and it does not
  need f real.
- Not found in the sources read; all routine.

### Polynomials in u and ū: Theorem E

Twenty-five nodes of 18 October 2026, from the research note `tex/diaz-theorem-c.tex`, whose proof two referee agents
checked independently before formalisation. For u ∉ Q̄ with uū algebraic, s = |u| and v = u/s, let z be any polynomial
in u and ū with algebraic coefficients, that is, a Laurent polynomial in v, and W = span(1, u, ū, z, z̄) its hull.
- **Theorem E.** W carries a 2×3 configuration exactly when it is five-dimensional and in one of three classes:
  (P) it contains αu² + βu³ ≠ 0 (Theorem C's hulls); (Q) a family in the exponents ±2, ±3 with an involution
  exchanging 0 and ∞; (R) the real pencil spaces with Laurent data of degree at least 2
  (`DiazModulus.laurent_conj_hull_two_by_three_configuration_iff`). The classes are disjoint, and each forces
  dimension 5.
- **Corollary E.** If some exponent has absolute value at least 4, only (R) remains; for exponents within ±3, with
  z ≡ Aū³ + Bū² + Cu² + Du³, N = |A|² − |D|² and Δ = AC̄ − BD̄, a configuration exists exactly when
  NΔ(|Δ|² − |u|²N²) = 0 (`DiazModulus.cubic_window_conj_hull_two_by_three_configuration_iff_criterion`).
- **At a candidate**, under Roy's theorem, no member of the three classes lies in ℒ̃
  (`DiazModulus.candidate_laurent_conj_hull_class_not_mem_logAlgTilde`).
- The formal proof goes pencil by pencil: a configuration factors through a coprime pencil of degree at most 2, one
  width count rules out two of the four pencils, and the other two give (R) and (Q).
- The configurations are printed or substitutions: (P) is Diaz 2007, Théorème 7(1); (Q) is the configuration of the
  proof of Diaz 2004, Théorème 2. The "only if" half, the family (Q) and the criterion were not found in the sources
  read, and Theorem E is in the blueprint's list of results not found. Two referees re-examined it on 22 November
  2026 and judged every step routine: printed methods (Theorem B, the valuation count of Bachoc–Serra–Zémor at 0 and
  ∞) and elementary algebra.

### Theorem D: what these theorems cannot refute

Sixteen nodes of 18 October 2026, the rest of Theorem D of the research note `tex/diaz-theorem-c.tex`. Let u be a
point of a circle (uū algebraic) that is transcendental over the field generated by ℒ̃; such points exist, since that
field is countable. Put ℒ_u = ℒ + ℚu + ℚū.
- **Theorem D** (`DiazModulus.logAlg_adjoin_circle_point_theorem_D`). ℒ_u contains ℒ and u, is stable under
  conjugation, and satisfies, with ℒ replaced by ℒ_u: Baker's theorem, Hermite–Lindemann, Gel'fond–Schneider, the
  six exponentials theorem over Q and the four exponentials theorem in transcendence degree one; and Roy's theorem
  for ℒ̃ implies it for ℒ̃_u = Q̄ + Q̄ℒ_u.
- **The barrier** (`DiazModulus.theorem_D_barrier`). So some ℚ-space L ⊇ ℒ has all these properties and a non-zero
  element of algebraic modulus: these theorems, used as properties of (ℒ, ℒ̃) together with conjugation, cannot
  prove Diaz's conjecture. ℒ itself has the same properties, and the conjecture says exactly that it has no such
  element (`DiazModulus.span_logAlg_theorem_D_properties`). The model concerns membership in ℒ only, not the
  exponential function.
- The six exponentials clause needs neither Roy's theorem nor Gel'fond–Schneider: Baker's theorem for ℒ_u covers
  the dependent cases, and otherwise the inversion lemma above puts the products in ℒ.
- Each clause restates a classical theorem with ℒ replaced by ℒ_u; not found in the sources read; routine.

### Rational functions of u: Theorem F

Twenty-two nodes of 23 October 2026. They take up next step (2) of the research note `tex/diaz-theorem-c.tex`:
Theorem E's question for every z rational in u. Let u ∉ Q̄, and let W be a five-dimensional space containing 1, u and
u⁻¹. Say that W satisfies (D1) if t_j and u·t_j lie in W for three independent t_j; (D2a, two-orbit) if
W = span(1, u, u⁻¹, Q(u)S₁(u)/(uP(u)), P(u)S₂(u)/(uQ(u))); and (D2b, cyclic) if
W = span(1, u, u⁻¹, Q(u)S₁(u)/(uP(u)), Q(u)(Q(u)S₁(u) + P(u)S₂(u))/(uP(u)²)); here P, Q are coprime with
max(deg P, deg Q) = 2, and deg S₁, deg S₂ ≤ 2.
- **Theorem NF** (`DiazModulus.degree_two_configuration_normal_form`). If W carries a 2×3 configuration whose ratio
  x₂/x₁ is p(u)/q(u), with p, q coprime and max(deg p, deg q) = 2, then W satisfies (D1), (D2a) or (D2b). W is not
  assumed to lie in Q̄(u). The proof is elementary: the resultant of the pencil is non-zero, so 1 and J(u)/q(u), for
  the Wronskian J, are free over Q̄(p(u)/q(u)); at most two values of λ are bad; and multiplication by
  q(u)/(p(u) − λq(u)) modulo span(1, u, u⁻¹) is a 2×2 matrix over Q̄, scalar, with two eigenvalues, or one Jordan
  block. The statement is Theorem 2 of the R12 research notes, proved there with vector bundles on P¹.
- **Theorem F** (`DiazModulus.rational_conj_hull_two_by_three_configuration_iff`). Let uū be algebraic and z ∈ Q̄(u).
  The hull W_z = span(1, u, ū, z, z̄) carries a 2×3 configuration exactly when either dim W_z = 4 and
  z ∈ span(1, u, ū, 1/(u − a)) for some algebraic a with aā = uū, or dim W_z = 5 and W_z satisfies (D1), (D2a) or
  (D2b). In dimension 5 conjugation plays no part: a five-dimensional W ⊆ Q̄(u) containing 1, u and u⁻¹ carries one
  exactly when it satisfies (D1), (D2a) or (D2b) (`DiazModulus.rational_space_two_by_three_configuration_iff`).
- **The degree-one case.** W satisfies (D1) exactly when it contains u², u⁻² or some 1/(u − a) with a ≠ 0, so that
  Theorem B sees it, or W = span(1, u, u⁻¹, g, ug)
  (`DiazModulus.degree_one_multiplier_space_visible_or_degree_one_space`). If W is also stable under conjugation, it
  is visible or a real pencil space W(λ, f)
  (`DiazModulus.conj_stable_degree_one_multiplier_space_visible_or_real_pencil_space`).
- Theorem F builds on Theorem B. Six more nodes of 23 October 2026 settle what it left open; all six are routine, and
  none was found in the sources read:
- **Agreement with Theorem E** (`DiazModulus.laurent_conj_hull_configuration_shape_iff_class`): for Laurent z with
  dim W_z = 5, W_z satisfies (D1), (D2a) or (D2b) exactly when it is in class (P), (Q) or (R). The proof goes through
  Theorem E, so Theorem E's explicit criteria still do not follow from Theorem F.
- **(P) is two-orbit** (`DiazModulus.laurent_polynomial_class_conj_hull_two_orbit_form`): a hull of class (P) is the
  (D2a) space of the pencil (X², 1).
- **(Q) is cyclic** (`DiazModulus.laurent_involution_class_space_cyclic_form`): the span of class (Q) is the (D2b) space
  of the pencil (sX, X² + βs²), where s² = uū.
- **(R) is degree one** (`DiazModulus.laurent_real_pencil_class_space_u_multiplier_triple`): in a hull of class (R),
  (u⁻¹, 1, g) is a free triple whose u-multiple stays in the hull, so (D1) holds.
- **Uniqueness in Theorem NF** (`DiazModulus.degree_two_configuration_multiplier_space_eq`): for the ratio
  h = x₂/x₁ = p(u)/q(u), the f ∈ W with hf ∈ W are exactly x₁·span(y), so the span depends only on W and h.
- **At a candidate** (`DiazModulus.candidate_rational_conj_hull_criterion_not_mem_logAlgTilde`): under Roy's theorem,
  no z ∈ Q̄(u) whose hull meets Theorem F's criterion lies in ℒ̃; each instance is one substitution in Roy's theorem.
- The four-dimensional configuration is printed: rescaled, it is Diaz's Théorème 7(1) of 2007 at v = 1/(u − a), and
  its exclusion at a candidate is his Corollaire 5(4). When the six products span only four dimensions, the
  configuration is a progression by Bachoc–Serra–Zémor (2017, Lemma 4). The "only if" half of Theorem F and the
  proof of Theorem NF without vector bundles were not found in the sources read. Of the literature on scrolls and
  rank-two bundles on P¹ only a textbook chapter was read (Reid, Chapters on algebraic surfaces, Ch. 2): it prints the
  ingredients of the bundle proof but not the three shapes. Theorem F with its key step Theorem NF is in the
  blueprint's list of results not found. Two referees re-examined it on 22 November 2026 and judged it routine: the
  three types of Theorem NF come from the normal forms of a regular 2×2 pencil (two eigenvalues, one Jordan block,
  a scalar).

### Invisible degree-two spaces: Q1.4–Q1.7

Seventeen nodes of 1 November 2026 answer four questions of the R12 research notes about the two-orbit (D2a) and
cyclic (D2b) shapes of Theorem NF. In both, P, Q are coprime with max(deg P, deg Q) = 2 and deg S₁, deg S₂ ≤ 2. Say
that P and S have a common zero on the projective line if they are not coprime or their coefficients of X² both
vanish (a common zero at ∞). "Visible" means visible to the four-dimensional extensions: some w ∈ W outside
H₀ = span(1, u, u⁻¹) makes H₀ + Q̄w carry a 2×3 configuration.

- **Q1.4, visibility** (`DiazModulus.two_orbit_space_visible_to_four_dimensional_extensions_iff_common_zero`,
  `DiazModulus.cyclic_space_visible_to_four_dimensional_extensions_iff_common_zero`; milestones): for uū algebraic and
  dim W = 5, a two-orbit space is visible exactly when P and S₁, or Q and S₂, have a common zero on the projective
  line; a cyclic space, exactly when P and S₁ do. Visibility means containing u², u⁻² or some 1/(u − a) with a ≠ 0
  (`visible_to_four_dimensional_extensions_iff_visible_element_mem`, a restatement of Theorem B); the scalar shape is
  always visible (`scalar_quadratic_space_visible_element_mem`).
- **Q1.5, no degree one** (`DiazModulus.invisible_two_orbit_space_u_multiplier_space_eq`,
  `DiazModulus.invisible_cyclic_space_u_multiplier_space_eq`; milestones): with no common zero, W has dimension 5 and
  the f with f, uf ∈ W are exactly span(1, u⁻¹), so (D1) fails. No hypothesis on uū is needed.
- **Q1.6, the involution is unique** (`DiazModulus.invisible_two_orbit_space_configuration_ratio_mobius`,
  `DiazModulus.invisible_cyclic_space_configuration_ratio_mobius`; milestones): with no common zero, every
  configuration in W has ratio x₁/x₀ a Möbius function of P(u)/Q(u), at every position of the orbits, ramified
  orbits included. Without the hypothesis it fails: span(u⁻², u⁻¹, 1, u, u²) carries ratios u² − u and u²,
  neither a Möbius function of the other.
- **Q1.7, conjugation** (`DiazModulus.conj_stable_invisible_quadratic_space_conj_ratio_mobius`; milestone): if such
  a W is stable under complex conjugation σ, the conjugate of P(u)/Q(u) is a Möbius function of P(u)/Q(u), that is,
  στσ = τ.
- The tools: `binary_quadratic_dvd_of_coprime_mul_eq` (Euclid's lemma for binary forms, with formal degrees, so that
  a zero at ∞ counts), `quadratic_space_mem_iff_numerator`,
  `u_multiplier_space_le_span_no_degree_one_no_visible_element`,
  `quadratic_fraction_extension_visible_element_mem_of_common_zero`, `degree_two_configuration_pencil_normal_form`
  (Theorem NF with the configuration's own pencil kept), `configuration_ratio_quadratic_of_not_degree_one`,
  `invisible_two_orbit_space_pole_pencil` and `invisible_cyclic_space_pole_pencil`.

The questions, and proofs of them through orders of poles, are the research notes' (rounds R12 and R20). The formal
proofs run on divisibility of binary forms instead of orders of poles. No novelty is claimed: all seventeen are
routine. Checked on 1 November 2026 against the literature on products of spaces (Bachoc–Serra–Zémor 2017,
Bachoc–Couvreur–Zémor 2018, Couvreur–Zémor 2024, Wessel 2024) and Reid's notes on the cubic scroll S(1, 2): the
criterion and Q1.5–Q1.7 were not found in the sources read; Eisenbud–Harris 1987 and Eisenbud's *Geometry of
Syzygies*, Ch. 6, were not read. The 17 modules have 2,805 lines in `Diaz/Mirror/`; the largest,
`invisible_cyclic_space_configuration_ratio_mobius`, has 304.

### The Matrix Coefficient Conjecture sees nothing homogeneous either

- `Transcendence.singular_matrix_subspace_annihilating_pair` — Roy's lemma (Dasgupta–Kakde II,
  Thm 2.2; a stronger form is Waldschmidt's book, Prop. 12.5): over an infinite field, a linear space of
  singular `n × n` matrices has non-zero `v, w` with `wᵀAv = 0` for all its elements.
- `DiazModulus.generic_no_homogeneous_relation` — for `u` and `π` algebraically independent with `|u|²`
  algebraic, no non-zero homogeneous polynomial over `Q̄` vanishes at `(u, ū, iπ)` (an instance of the
  book's Prop. 12.13).
- `DiazModulus.generic_matrix_coefficient_barrier` — in that setting every singular `n × n` matrix over
  `ℚu + ℚū + ℚiπ` (resp. `Q̄u + Q̄ū + Q̄iπ`) has non-zero rational (resp. algebraic) `v, w` with
  `wᵀMv = 0`: the Matrix Coefficient Conjecture of Dasgupta and Kakde, and its `Q̄` form, hold on these
  matrices in every size, as the four exponentials conjecture does at `n = 2`.

### Strong four, sharp four and strong five exponentials

Three nodes of 2026-10-01, each carrying a conjecture as a hypothesis:

- `DiazModulus.sharp_four_and_strong_five_exponentials_of_strong_four` — the strong four exponentials
  conjecture (the hypothesis of `diaz_of_sfe`), with Baker's theorem, implies the sharp four exponentials
  conjecture, and that one implies the strong five (Waldschmidt's remark, 1988, p. 379). Both conclusions
  are stated in the forms of `diaz_of_sharp_four_exponentials` and `diaz_of_strong_five_exponentials`,
  and plug into them.
- `DiazModulus.algebraic_modulus_log_multiplier_rational_of_sfe` — the open question of Waldschmidt's
  book, p. 399, for every `u`, from the strong four exponentials conjecture as the book says: if
  `λ ∈ ℒ ∖ {0}` and `|u|`, `e^{uλ}` are algebraic, then `u ∈ ℚ` or `uλ/λ̄ ∈ ℚ`. No Baker.
- `DiazModulus.exp_log_mul_log_transcendental_of_strong_five` — under the strong five exponentials
  conjecture, `(log a)(log b) ≠ log c` for non-zero logarithms (Waldschmidt 1988, p. 379); so `e^{λ²}`
  and `e^{π²}` are transcendental (Waldschmidt 2005).

No new mathematics is claimed for these three.

### Diaz's (Qr2) in transcendence degree one

Four nodes of 2 October 2026, from the four exponentials theorem in transcendence degree one:

- `DiazModulus.log_mul_real_trichotomy_of_trdeg_one` and `DiazModulus.log_mul_imaginary_mixed_of_trdeg_one`
  — for non-zero logarithms `λ, μ` such that `λ, λ̄, μ, μ̄` generate a field of transcendence degree at
  most one: a real product `λμ` has both factors real, both purely imaginary, or `μ ∈ ℚλ̄`; a purely
  imaginary product has one factor on each axis.
- `DiazModulus.diaz_2007_qr2_of_trdeg_one` — Diaz's conjecture (Qr2) (2007, p. 376) in transcendence
  degree one: for logarithms `ℓ₀, ℓ₁` off both axes, a real or purely imaginary `ℓ₁/ℓ₀` is rational.
- `DiazModulus.candidate_log_mul_real_iff_rat_conj` — for a candidate `u` and a logarithm `μ` algebraic
  over `ℚ(u)`: `uμ` is real exactly when `μ ∈ ℚū`, and it is never purely imaginary.

They are immediate from Diaz 2007, who proves (Qr2) from the four exponentials conjecture with the same
2×2 matrix and quotes the theorem in transcendence degree one without combining the two. The
transcendence-degree-one form was not found in the sources read.

### A dichotomy for Li₂(1/2)

`DiazModulus.dilog_half_irrational_or_exp_i_div_pi_transcendental`: Li₂(1/2) = π²/12 − (log 2)²/2 is irrational,
or e^{iγ/π} is transcendental for every rational γ ≠ 0.
- Waldschmidt lists the irrationality of Li₂(1/2) as unknown (*Open Diophantine Problems*, 2004, p. 274). Two 2026
  preprints report it proved (Tan–Zhang, arXiv:2611.01066; Lai, arXiv:2610.06838), with public Lean developments. The
  preprints are unrefereed, and this project has not built those developments. If the result stands, the first
  alternative holds and the corollary says nothing about e^{iγ/π}. The second alternative is open: e^{i/π} is the
  smallest case of the real half of (S).
- It comes from `DiazModulus.recip_pi_log_of_rational_quadratic_relation`: if a·t² + b·π² is rational, with a ≠ 0,
  then e^{iγ/π} is transcendental. That is Brownawell's Corollary 5 (1974) in general form.
- The dichotomy was not found in the sources read.

### From the manuscript, through Waldschmidt 1973

Carlo Perassi's unpublished manuscript on the conjecture had three results that seemed to need Roy–Waldschmidt
1997. They are direct instances of Waldschmidt's 1973 Corollaire 4:
- `DiazModulus.candidate_pair_dichotomy` (Theorem 2.5): two candidates with a rational ratio of squared moduli
  are rational multiples of each other, or of the conjugate, exactly when they are algebraically dependent;
- `DiazModulus.candidate_axis_ratio` (Theorem 2.3): for two distinct candidates whose difference is real or
  purely imaginary, a rational ratio of squared moduli, equal moduli, and v = ±ū are equivalent;
- `DiazModulus.candidate_mixed_rigidity` (Theorem 3.9): for a candidate u and a logarithm μ outside ℚu ∪ ℚū, the
  numbers u, μ and e^{uū/μ} generate transcendence degree at least two.

### Baker's theorem as a hypothesis, discharged

With Baker's theorem proved, four nodes of 2 October 2026 drop it:

- `DiazModulus.no_algebraic_generalized_line_unconditional`;
- `DiazModulus.candidate_one_log_saturation_unconditional`, which drops Hermite–Lindemann as a hypothesis
  too;
- `DiazModulus.no_first_order_arithmetic_operator_unconditional`, through
  `DiazModulus.candidate_qbar_independent_one_u_conj`: for a candidate `u`, the numbers `1, u, ū` are
  linearly independent over `Q̄`, which is Baker's theorem at a candidate.

### A barrier: the four exponentials conjecture sees nothing homogeneous

A candidate certifies three logarithms: `u`, `ū` and `iπ`. On them, the four
exponentials *conjecture* (ℚ-independent rows and columns, products in ℒ) is
already a theorem, so it can give nothing.

- `generic_conj_pair_no_quadratic_relation` — if `|u|²` is algebraic and `u`, `πi`
  are algebraically independent over Q̄, no rational quadratic form vanishes at
  `(u, ū, iπ)`. It does not use `e^u`.
- `generic_conj_pair_four_exp_barrier` — hence every singular 2×2 matrix over
  `ℚu + ℚū + ℚiπ` has ℚ-dependent rows or columns. `det_zero_linear_forms_rank_one`
  is the classical linear-algebra step.
- `candidate_nongeneric_four_exp_barrier` — the same conclusion for candidates
  algebraic over ℚ(π), where the proved four exponentials theorem in
  transcendence degree one does the work.
- `recip_pi_log_four_exp_barrier` — the same on `ℚ·γ/(iπ) + ℚ·iπ`, the data an
  exception to (S) would certify.

A configuration that does detect a counterexample needs an entry with a constant
term, as in `diaz_of_sfe`. For a generic candidate the constant is all it can add:

- `generic_quadratic_relation_is_norm` — with algebraic coefficients and a constant
  coordinate, the only quadratic relation among `1, u, ū, iπ` is the norm
  `X₁X₂ − ρX₀²`, up to a factor.
- `generic_period_never_enters` — in a singular 2×2 matrix over
  `Q̄ + Q̄u + Q̄ū + Q̄iπ` with Q̄-independent rows and columns, the coefficient of `iπ`
  in every entry is zero. `det_zero_linear_forms_rank_one_field` is the
  linear-algebra step, over any field of characteristic zero.
- `generic_qbar_homogeneous_four_exp_barrier` — with algebraic coefficients but no
  constant there is still no 2×2 configuration over `Q̄u + Q̄ū + Q̄iπ`.
- `generic_no_strong_six_exp_configuration` — no 2×3 configuration even over
  `Q̄ + Q̄u + Q̄ū + Q̄iπ`: the proved strong six exponentials theorem gives nothing
  against a generic candidate, even with `iπ` added.

Points of a circle can carry homogeneous relations; candidates cannot. For a
candidate algebraic over ℚ(π) with `Im u ∉ ℚπ`, Théorème 0.2 of Roy–Waldschmidt
(Ann. Sci. École Norm. Sup. 30, 1997) excludes every rational quadratic relation
among `u, ū, iπ`. That theorem is not formalised here. What the nodes below add is
that no 2×2 configuration sees an anisotropic relation:

- `conj_pair_quadratic_relation_iff` — for `u` off the axes with `Im u ∉ ℚπ`, the
  rational quadratic relations among `u, ū, iπ` are exactly the identities
  `Q(Im u, π) = s|u|²`.
- `anisotropic_relation_four_exp_barrier` — a relation whose form has no rational
  zero never yields a configuration, because every 2×2 determinant of rational
  linear forms has one (`det_linear_forms_isotropic`). It uses the transcendence
  of π, not `e^u`.
- `anisotropic_relation_on_circle` — such relations occur: `Re(u²) = π²` at points
  of every circle of algebraic radius greater than π. By Roy–Waldschmidt, `e^u` is
  transcendental at those points, so none of them is a candidate.

Indistinguishability also holds with π fixed:

- `circle_points_indistinguishable` — two points of a circle, transcendental over a
  conjugation-stable field `K` containing the squared radius, are indistinguishable
  over `K`.
- `exists_noncandidate_transcendental_on_circle` — every circle of positive radius
  has a point transcendental over a given countable field, with `e^t` transcendental.
- `generic_indistinguishable_over_pi` — with `K` the algebraic closure of ℚ(π), a
  candidate algebraically independent of π cannot be told from a non-candidate
  point of its circle by any vanishing statement with coefficients in `K`.

The companion note (since version 1.8) states all of this precisely.

### From the literature, formalised

The reading of Diaz, Roy and Waldschmidt on 24 September 2026 produced twelve
more nodes, all in `Diaz/Mirror/`. Most are published results, formalised and
attributed as such; two are new couplings.

Known results, now machine-checked:

- `exp_abs_transcendental_of_conj_algebraic` — for a non-real logarithm `λ` with
  `λ̄` algebraic over `ℚ[λ]`, `e^{|λ|}` is transcendental (Diaz 1997, Prop. 2;
  Roy–Waldschmidt 1997, Cor. 7.4). At `λ = iπ` it gives `e^π`. It is the
  unconditional form of `Diaz.log_modulus_forces_independence`, which
  `log_modulus_forces_independence_alg` (milestone 184) states with that node's
  hypothesis `hMaster` dropped.
- `exp_abs_log_two_add_i_pi_transcendental` — if `log 2` is algebraic over
  `ℚ(π)`, then `exp √((log 2)² + π²)` is transcendental (Roy–Waldschmidt's
  example, 1997, p. 792).
- `log_pair_square_ratio_transcendental` — for `ℚ`-independent logarithms
  `ℓ₁, ℓ₂` with `ℓ₁` algebraic over `ℚ[ℓ₂]`, both `e^{ℓ₁²/ℓ₂}` and `e^{ℓ₂²/ℓ₁}`
  are transcendental (Waldschmidt, LN 402, 1974, p. 202).
- `log_two_pi_dependent_forces_transcendence` — its case `log 2`, `iπ`: if
  `log 2` and `π` are algebraically dependent, `2^{i log 2/π}` and
  `e^{π²/log 2}` are transcendental. This strengthens
  `log_two_diaz_or_transcendental`.

Weaker published conjectures that already give Diaz's conjecture and (S). Each
is inlined as an explicit hypothesis, as the strong four exponentials conjecture
is in `diaz_of_sfe`:

- `diaz_of_strong_five_exponentials`, `recip_pi_not_log_of_strong_five_exponentials`
  — Waldschmidt's strong five exponentials conjecture (1988), which he calls
  weaker than the strong four exponentials conjecture of that paper: the sharp
  four exponentials conjecture of the next item, not the hypothesis of
  `diaz_of_sfe`. With `x₁ = y₁ = 1` its fifth exponential is one of the four.
- `diaz_of_sharp_four_exponentials`, `recip_pi_not_log_of_sharp_four_exponentials`
  — the sharp four exponentials conjecture (Waldschmidt 2005; 1988, p. 377).
- `diaz_of_two_by_two_determinant_conjecture`,
  `recip_pi_not_log_of_two_by_two_determinant_conjecture` — Conjecture 1.6 of
  Waldschmidt's *Further variations on the six exponentials theorem* (2005):
  a 2×2 matrix over `ℒ̃` with suitably independent rows and columns has
  determinant outside `ℒ̃`. For Diaz the matrix is `H(u, |u|)`.

Two new couplings, both from the four exponentials theorem in transcendence
degree one:

- `candidate_norm_div_log_not_log` — for a candidate `u` and a logarithm `x`
  algebraic over `ℚ[u]` outside `ℚu ∪ ℚū`, `e^{|u|²/x}` is transcendental. It
  generalises `candidate_harmonic_not_log`.
- `candidate_norm_recip_pi_not_log` — its analogue at `x = iπ`: for every
  candidate algebraic over `ℚ(π)`, the real half of (S) holds at `γ = |u|²`.
  A non-generic counterexample to Diaz's conjecture never yields, through its
  squared modulus, a counterexample to (S).

Five more the same day. They came from a size audit of the library that
applied the platform's own rule on how large a helper may be before it
becomes a node:

- `Transcendence.trdeg_adjoin_le_one_of_isAlgebraic_adjoin` — for fields
  `K ⊆ L`, elements algebraic over `K[x]` generate a `K`-algebra of
  transcendence degree at most one. Sixteen proofs in this library carry local
  lemmas of this kind, most written before it became a result; two of October
  (`candidate_im_mem_pi_rat_of_weak_schanuel`, `diaz_of_weak_schanuel_and_kernel_schanuel`) carry
  copies instead of importing it.
- `log_pair_algebraicIndependent_of_mul_eq_rat_pi_sq` — Diaz 1997,
  Proposition 1: if `ℓ₁ℓ₂ = cπ²` with `c ∈ ℚ^×` and `e^{ℓ₁}` not a root of
  unity, then `ℓ₁, ℓ₂` are algebraically independent, and so are `ℓ₁, 2πi`.
- `exp_two_pi_I_mul_transcendental_of_normSq_rat` — the case of Diaz's
  property (4-1) where `τ` is algebraic over `ℚ(π)`: for non-real `τ` with
  `|τ|² ∈ ℚ`, `e^{2πiτ}` is transcendental.
- `div_not_mem_logAlgTilde_of_sfe` — under the strong four exponentials
  conjecture, `Λ₂/Λ₁ ∉ ℒ̃` whenever `Λ₁, Λ₂ ∈ ℒ̃` and `Λ₁`, `Λ₂/Λ₁` are
  transcendental (Waldschmidt 2005, Consequence 1.7). His Consequence 1.6 is
  the case `Λ₂ = 1`, and at `Λ₁ = iπ` it gives `1/(iπ) ∉ ℒ̃`.
- `e_pi_transcendence` — `e^π` is transcendental (Gelfond 1929), as an
  instance of the Gelfond–Schneider theorem proved here. It closes another
  contributor's node, which had been open since June 2026.

On 25 September the same audit took four general results out of proofs that
carried them inline, and made each a node:

- `exp_abs_transcendental_of_isAlgebraic_adjoin` — if `e^λ` is algebraic, `λ`
  is not real, and `λ`, `λ̄` are algebraic over one ring `ℚ[x]`, then
  `e^{|λ|}` is transcendental.
- `qbar_dependent_of_det_linear_forms` — if each product `x_i y_j` of a 2×2
  block is an algebraic linear form in four fixed numbers, and the block's
  determinant vanishes identically as a quadratic form, then the `x`'s or the
  `y`'s are linearly dependent over `Q̄`.
- `Transcendence.circle_vanishing_ideal` — for a subfield `K` of `ℂ`, a point
  of the circle `x² + y² = ρ ≠ 0` whose `y` is transcendental over `K` lies on
  no curve over `K` except multiples of the circle.
- `dvd_of_small_values_at_scale` — one scale of Gel'fond's transcendence
  criterion.

Nine results were proved again, importing these or a node they had re-proved.
On the platform those nine proofs went from 2,865 lines to 856. Here, seven
mirror modules were regenerated from the new proofs, and `Kernel.lean` now
derives `candidate_vanishing_ideal` from the circle node: 130 lines instead
of 472.

A second wave the same day took apart `aligned_norm_free_no_rational_log_matrix`,
until then a single 1,550-line proof, most of which it never used. It is now
44 lines, from three new nodes:

- `Transcendence.quadratic_coeffs_eq_zero_of_transcendental` — a transcendental
  number is a root of no non-zero quadratic with algebraic coefficients.
- `four_exp_barrier_of_no_quadratic_relation` — if numbers satisfy no rational
  quadratic relation, a singular 2×2 matrix of rational linear forms in them
  has rationally dependent rows or columns. The `*_four_exp_barrier` results
  each proved this step inline.
- `aligned_norm_free_no_quadratic_relation` — in the aligned, norm-free case,
  `u`, `ū` and `2πi` satisfy no rational quadratic relation.

`recip_pi_log_four_exp_barrier`, `generic_conj_pair_four_exp_barrier` and
`period_free_split_nondegenerate` were proved again from them. The four proofs
went from 2,725 lines to 320.

A third wave took on the two proofs of Waldschmidt's 1973 Lemmas 4 and 7,
`aux_linear_system` and `norm_to_polynomial_alg`. Each carried the same
1,046-line block of helpers. Eight nodes replace it:

- `Transcendence.length_sum_le` and `Transcendence.length_mul_le` — the length
  of integer polynomials (the sum of the absolute values of the coefficients)
  of a finite sum, and of a product.
- `Transcendence.exists_int_pow_repr` — scaled powers of an algebraic number are
  integer combinations of a fixed basis, with coefficients at most `Aⁿ`.
- `Transcendence.exists_modByMonic_length_le` — reduction modulo any polynomial
  multiplies the length by at most `Cⁿ`.
- `exists_iteratedDeriv_presentation` — the derivatives of an exponential
  polynomial at a grid point, presented through the four exponentials, for any
  coefficients. `exists_iteratedDeriv_reduced_presentation` adds the unknowns
  and the reduction modulo `Q`.
- `exists_pow_mul_pow_le_exp_sq_mul_sqrt_log` — the asymptotic estimate at the
  scale `N²/√log N`.
- `exists_int_norm` — the core of Lemma 7, the norm from `ℚ(ω, ω₁)` down to
  `ℚ(ω)` with size control.

The two proofs went from 4,068 lines to 458, and 2,173 with the new nodes.

A fourth wave took on the remaining proofs of 300 lines or more:
`extrapolation`, `siegel_aux`, `small_irreducible_factor` and
`trdeg_one_presentation` in the four exponentials subtree, and the six
exponentials steps `SX.descent_step` and `SX.exists_aux_expSum`. Eight nodes:

- `Transcendence.siegel_entrywise` — Siegel's lemma with an entrywise bound:
  with at least twice as many unknowns as equations and entries at most `B`,
  a non-zero integer solution of size at most `nB`.
- `Transcendence.expPoly_grid_estimate` — the Cauchy estimate for an
  exponential polynomial that vanishes to order `n` on a grid of `ℚ`-linearly
  independent points, at any point of a larger grid.
- `extrapolation_numbers` — the numerical inequality of the four exponentials
  extrapolation.
- `Transcendence.norm_resultant_le_max_norm_eval` — a Liouville inequality
  through the resultant, the complex form of Roy–Waldschmidt 1997,
  Corollary 3.7.
- `Transcendence.exists_irreducible_factor_cofactor_bound` — the multiplicative
  step of Gel'fond's lemma.
- `Transcendence.exists_monic_integral_model` and
  `Transcendence.exists_monic_integral_model_presentation` — finitely many
  numbers algebraic over `ℚ(ω)`, presented over one monic integral model.
- `Transcendence.exists_denom_house_monomial_le` — one denominator and a house
  bound for every monomial of bounded degree in a number field.

The six proofs went from 2,661 lines to 906, and 1,881 with the new nodes.

A fifth wave, on 30 September 2026, took the six proofs still at 300 lines or more, measured on
the mirror: `…_period_aligned_norm_rat_mult`, `transfer_breaks_exactly`,
`transcendence_criterion_continuous`, `construction_growth`, `expPoly_value_le_derivs` and
`GelfondSchneider.deriv_upper`. Most of their length re-proved something that already existed:
the non-generic four exponentials barrier, the grid estimate above, or Mathlib
(`Polynomial.supNorm`, `StrictMonoOn.Iic_union_Ici`, `Complex.real_algHom_eq_id_or_conj`). One
of them carried 183 lines that no theorem used. One node is new:
`Transcendence.expPoly_iteratedDeriv_le`, which bounds every derivative of an exponential
polynomial at a point by its first `N` there, geometrically in the order. The six proofs went
from 2,234 lines to 884, and 998 with the node.

