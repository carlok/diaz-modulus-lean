[← README](../README.md)

## The classical theorems

The blueprint at https://carlok.github.io/diaz-modulus-lean/ states each of them, and every result their proofs use,
with a dependency graph, links to the Lean source and a PDF.
Since October 2026 it also has chapters of the library's own results: the rank-one configurations near a point of
a circle (Theorems A and B below, the power and Laurent hulls, separation, and the five-dimensional spaces, with the
progression spaces classified and configurations up to degree two), the dichotomy for Li₂(1/2), quadratic relations
near a point of a circle, and consequences in transcendence degree one, with results from the author's unpublished
manuscript and reductions under Kirby's weak Schanuel conjecture.
Its chapter ["Results not found in the sources read"](https://carlok.github.io/diaz-modulus-lean/chap-14-not-found-in-the-sources.html) lists the blueprint's results not found in the literature
checked, and what is printed nearby; all of them are routine.

| Result | Due to | Lean name | Lean proof |
|---|---|---|---|
| a non-zero logarithm of an algebraic number is transcendental | Hermite 1873, Lindemann 1882 | `Diaz.hermite_lindemann` | derived here from the next row |
| `e^{α₁}, …, e^{αₙ}` are linearly independent over Q̄ for distinct algebraic `αᵢ` | Lindemann 1882, Weierstrass 1885 | `linearIndependent_exp`, `algebraicIndependent_exp` | ported from Mathlib PR #28013 (unmerged) |
| `e^{bℓ}` is transcendental for algebraic irrational `b` and a non-zero logarithm `ℓ` | Gel'fond 1934, Schneider 1934 | `GelfondSchneider.gelfond_schneider` | restructured from M. Karatarakis and F. Wiedijk |
| `e^π` is transcendental | Gel'fond 1929 | `Diaz.e_pi_transcendence` | this project (the node was posed by another Prove2Me contributor) |
| the six exponentials theorem | Lang 1965–66, Ramachandra 1968 | `Diaz.six_exponentials` | this project |
| Roy's strong six exponentials theorem: for `x₁, x₂` and `y₁, y₂, y₃` free over Q̄, some `xᵢyⱼ` is not in `ℒ̃` | Roy 1992, Cor. 2; DALAG Cor. 11.16, via Th. 11.21 | `Diaz.strongSixExponentials` | this project, with no hypothesis, through an elementary case of the multiplicity estimate (DALAG Th. 8.1) |
| the five exponentials theorem: for `x₀, x₁` and `y₀, y₁` free over ℚ and algebraic `η ≠ 0`, one of `e^{xᵢyⱼ}`, `e^{ηx₁/x₀}` is transcendental | Waldschmidt 1988, Cor. 2.2; DALAG §11.3.3 | `Diaz.five_exponentials` | this project, from Roy's theorem and Baker's, as in DALAG (Remark after Cor. 11.16) |
| Roy's rank bound: a `d × l` matrix `M` with entries in `ℒ̃` has rank at least `dθ/(1 + θ)`, `θ` read off the zero blocks of `PMQ` for algebraic `P`, `Q` | Roy 1992, Cor. 1; DALAG Th. 12.20, Cor. 12.21 | `Diaz.roy_rank_bound` | this project, with no hypothesis, from the linear subgroup theorem (DALAG Th. 11.21) |
| Roy's Theorem 5: if `U ⊆ ℂᵈ` meets `Q̄ᵈ` only in 0 and no rational subspace other than `ℂᵈ` contains it, a Q̄-free family in `U ∩ ℒ̃ᵈ` has at most `φ(dim U, d)` elements, `φ` the largest `Σ nᵢdᵢ/(dᵢ − nᵢ)` over the decompositions `(dim U, d) = Σ (nᵢ, dᵢ)` | Roy 1992, Th. 5, Remark (i) (p. 37) and Lemma (p. 40); DALAG Cor. 11.15 | `Diaz.roy_theorem_five`, `Diaz.roy_theorem_five_dmin`, `Diaz.dalag_cor_11_15_psi`, `Diaz.dalag_cor_11_15_rat` | this project, with no hypothesis, from Roy's Theorem 4; `φ` in closed form, and DALAG's table Ψ as its integer part; over ℚ too, for `(ℚ, ℚ + ℒ)` |
| the four exponentials theorem in transcendence degree one | Waldschmidt 1973, Brownawell 1974 | `Diaz.four_exponentials_trdeg_one` | this project |
| two of `xᵢ, yⱼ, e^{xᵢyⱼ}` are algebraically independent when one column is algebraic | Waldschmidt 1973, Brownawell 1974 | `Diaz.two_algebraically_independent_of_exp_column` | this project |
| one of `e^e`, `e^{e²}` is transcendental (Schneider's eighth problem) | Waldschmidt 1973, Brownawell 1974 | `Transcendence.exp_e_or_exp_e_sq_transcendental` | this project |
| Roy's lemma on singular spaces of matrices | D. Roy (Dasgupta–Kakde II, Thm 2.2; a stronger form is DALAG Prop. 12.5) | `Transcendence.singular_matrix_subspace_annihilating_pair` | this project |
| Waldschmidt's transcendence criterion; zero counts for exponential polynomials | Waldschmidt 1971 | `Diaz.transcendence_criterion`, `Diaz.expPoly_zero_count` | this project |
| Baker's theorem: `1` and ℚ-independent logarithms of algebraic numbers are linearly independent over Q̄ | Baker 1966; the route of Bertrand–Masser 1980, as in DALAG Ch. 4 | `Transcendence.baker_linear_forms_in_logarithms` | this project |
| the criterion of Schneider–Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}` with `d₀ ≤ 1` | Schneider 1949, Lang 1966; this form is DALAG Cor. 4.2 | `Transcendence.schneider_lang_cartesian` | this project |
| a Schwarz lemma for Cartesian products | DALAG Prop. 4.7 | `Transcendence.cartesian_schwarz` | this project |

Some results carry a conjecture as an explicit hypothesis: Schanuel's conjecture; the strong four, sharp four and
strong five exponentials conjectures; Waldschmidt's 2×2 determinant conjecture; the case n = 2 of Kirby's weak
Schanuel conjecture; and the case n = 1 of Schanuel's conjecture over the kernel. Each is a hypothesis of the
statement that uses it, named in that statement's section below, so the library still assumes only Lean's three
axioms ("What is assumed"). Others carry Roy's strong six exponentials theorem, which is proved in the literature,
as the hypothesis `hSSE`. It is proved here too, with no hypothesis, through an elementary case of the multiplicity
estimate (DALAG Th. 8.1) that is proved as well, and `Diaz/RoyUnconditional.lean` restates each of those results
without `hSSE`; see "Roy's theorem from a multiplicity estimate".

Names are the library's own; `MIRROR_CHECKLIST.md` maps each to its name on Prove2Me.

