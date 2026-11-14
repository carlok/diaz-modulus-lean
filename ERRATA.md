*Transcendence theory in Lean 4 (`diaz-modulus-lean`): notes of 14 November 2026.*

# Notes on printed statements and proofs met while formalising rank bounds for matrices of logarithms

These notes record places where a printed statement or argument needed a correction while the results below were
being formalised. Most items are small. Four printed statements are false as stated (two corollaries in [Var]
and two lemmas in [DALAG]); one of the two corollaries was already corrected by its author. Section B lists nine
gaps in printed proofs, each with a repair (six in [DALAG], one each in [Var], [FV] and [Roy]), and section C eleven
smaller slips. Each item gives the place, the printed text (short quotation), what goes wrong, the evidence,
whether the point is already corrected in print,
and how the formal version handles it. The formal versions are theorems of the Lean 4 library in this repository;
they are named here without their namespace.

Notation. Q̄ is the field of algebraic numbers in ℂ; ℒ = {λ ∈ ℂ : e^λ ∈ Q̄}; ℒ̃ is the Q̄-vector space spanned by 1
and ℒ. "Q̄-free" means linearly independent over Q̄. Log is the principal branch. Baker's theorem is used in the
form: if λ₁, …, λ_r ∈ ℒ are linearly independent over ℚ, then 1, λ₁, …, λ_r are linearly independent over Q̄.

Sources.
- [DALAG] M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Grundlehren 326, Springer, 2000.
- [Roy] D. Roy, Matrices whose coefficients are linear forms in logarithms, J. Number Theory 41 (1992), 22–47.
- [Var] M. Waldschmidt, Variations on the six exponentials theorem, in *Algebra and Number Theory* (Proceedings
  of the Silver Jubilee Conference, University of Hyderabad, ed. R. Tandon), Hindustan Book Agency, 2005, 338–355.
- [FV] M. Waldschmidt, Further variations on the six exponentials theorem, Hardy–Ramanujan J. 28 (2005), 1–9.
- [Role] M. Waldschmidt, The role of complex conjugation in transcendental number theory, in *Diophantine Equations*
  (N. Saradha, ed.; proceedings of DION 2005), Tata Institute of Fundamental Research, 2007 (Narosa, New Delhi).
  Page numbers are those of the 12-page version consulted.
- [GDL] M. Waldschmidt, Transcendance et exponentielles en plusieurs variables, Invent. Math. 63 (1981), 97–127.
- [Fis] S. Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, Acta Arith. 100 (2001),
  167–187.

Classification: **false statement** (a counterexample to the printed statement), **proof gap** (the statement is
true or not in question, but the printed argument fails at a named step), **slip** (a wrong symbol, number or
citation whose intent is clear).

---

## A. False statements

### A1. [Var] Corollary 2.12, p. 346 — false statement; already corrected by the author

**Printed.** M = (Λᵢⱼ) a 2 × 5 matrix with entries in ℒ̃. Hypotheses (p. 346, line 11, the first line after the
displayed matrix): "Assume that Λ₂₁ ≠ 0, that the number Λ₁₁/Λ₂₁ is transcendental", and the seven columns of
(I₂, M) are Q̄-free. Conclusion: one of Λ₁₁Λ₂ⱼ − Λ₂₁Λ₁ⱼ (j = 2, 3, 4, 5) is not in ℒ̃.

**What goes wrong.** The proof applies Theorem 2.11 with Λ₁ = −Λ₂₁, Λ₂ = Λ₁₁, which needs 1, Λ₁₁, Λ₂₁ to be
Q̄-free. "Λ₂₁ ≠ 0 and Λ₁₁/Λ₂₁ transcendental" does not give this (it allows a relation with a constant term).

**Counterexample.** Λ₁₁ = 1, Λ₂₁ = log 2, Λ₁ⱼ = 0 and Λ₂ⱼ = log 3, log 5, log 7, log 11 for j = 2, 3, 4, 5.
- Entries in ℒ̃: yes (1, 0 and logarithms of rationals).
- Λ₂₁ ≠ 0, and Λ₁₁/Λ₂₁ = 1/log 2 is transcendental (log 2 is).
- Seven columns e₁, e₂, (1, log 2), (0, log 3), …, (0, log 11): a relation a e₁ + b e₂ + Σ cₖ(column k) = 0 with
  algebraic coefficients reads a + c₁ = 0 in the first row and b + c₁ log 2 + c₂ log 3 + c₃ log 5 + c₄ log 7 +
  c₅ log 11 = 0 in the second. The logarithms of distinct primes are ℚ-free (unique factorisation), so Baker's
  theorem gives b = c₁ = … = c₅ = 0, and then a = 0.
- Conclusion fails: Λ₁₁Λ₂ⱼ − Λ₂₁Λ₁ⱼ = log pⱼ ∈ ℒ ⊂ ℒ̃ for all four j.

(The author's own example, below, is of the same kind: Λ₂₁ = 1 and Λ₂ⱼ = 0, completed for instance by
Λ₁₁ = log 2 and Λ₁ⱼ = log 3, …, log 11.)

**Already corrected in print.** Yes, twice, and on the author's publications page (which gives p. 346).
[FV] §4 "Erratum to [8]", journal p. 8, replaces the hypothesis by
"the three numbers 1, Λ₁₁ and Λ₂₁ are linearly independent over the field of algebraic numbers" and notes a
counterexample with Λ₂₁ = 1, Λ₂ⱼ = 0 (2 ≤ j ≤ 5). [Role] Corollary 6.3, pp. 10–11, restates the corrected
version. (Both refer to the corollary as being on p. 347; it is on p. 346.) The corrected hypothesis implies the
printed one, so the corrected corollary is the weaker statement, as it must be.

**Formal version.** States and proves [Role] Corollary 6.3 (`role_cor_6_3`), from Theorem 2.11
(`variations_theorem_2_11`), exactly as in the printed proof.

### A2. [Var] Corollary 2.13, p. 346 — false statement; no correction in print found

**Printed.** M = (Λᵢⱼ) a 2 × 3 matrix with entries in ℒ̃. Hypotheses (p. 346, lines 20–22): "Assume that Λ₁₁,
Λ₁₂, Λ₁₃ and Λ₂₁ are in ℝ ∪ iℝ and that Λ₂₁ ≠ 0"; Λ₁₁/Λ₂₁ transcendental; the six numbers 1, Λ₂₁, Λ₂₂, Λ₂₃,
Λ̄₂₂, Λ̄₂₃ Q̄-free.
Conclusion: Λ₁₁Λ₂₂ − Λ₂₁Λ₁₂ or Λ₁₁Λ₂₃ − Λ₂₁Λ₁₃ is not in ℒ̃.

**What goes wrong.** The corollary is deduced from Corollary 2.12 (proof on p. 347) and inherits the hypothesis
of A1: nothing prevents a relation among 1, Λ₁₁, Λ₂₁.

**Counterexample.** Λ₁₁ = 1, Λ₁₂ = Λ₁₃ = 0, Λ₂₁ = log 2, Λ₂₂ = Log(2 + i), Λ₂₃ = Log(3 + 2i).
- Entries in ℒ̃: yes.
- Λ₁₁, Λ₁₂, Λ₁₃, Λ₂₁ = 1, 0, 0, log 2 are real; Λ₂₁ ≠ 0; Λ₁₁/Λ₂₁ = 1/log 2 is transcendental.
- The six numbers are 1, log 2, Log(2 + i), Log(3 + 2i), Log(2 − i), Log(3 − 2i) (Log z̄ = conj Log z off the
  negative real axis). The five logarithms are ℚ-free: an integer relation Σ nₖ Log αₖ = 0 gives Π αₖ^{nₖ} = 1 in
  ℚ(i); in ℤ[i], 2 = −i(1 + i)² and 1 + i, 2 + i, 2 − i, 3 + 2i, 3 − 2i are pairwise non-associate Gaussian primes
  (norms 2, 5, 5, 13, 13; 2 − i is not a unit times 2 + i, nor 3 − 2i a unit times 3 + 2i), so every nₖ = 0.
  Baker's theorem then gives the six numbers Q̄-free.
- Conclusion fails: Λ₁₁Λ₂₂ − Λ₂₁Λ₁₂ = Log(2 + i) and Λ₁₁Λ₂₃ − Λ₂₁Λ₁₃ = Log(3 + 2i) are both in ℒ ⊂ ℒ̃.

**Repair.** Replace "Λ₂₁ ≠ 0 and Λ₁₁/Λ₂₁ transcendental" by "1, Λ₁₁, Λ₂₁ are Q̄-free", as in the correction of
Corollary 2.12. (The counterexample violates exactly this: 1 − Λ₁₁ = 0.) The hypothesis Λ₁₂, Λ₁₃ ∈ ℝ ∪ iℝ is not
used by the proof and can be dropped. The proof also needs the change described in B1.

**Already corrected in print.** Not in the sources consulted, nor on the author's publications page, whose erratum
for [Var] concerns Corollary 2.12 only: [FV] §4 and [Role] Cor. 6.3 correct Corollary 2.12
only, and neither mentions Corollary 2.13.

**Formal version.** States and proves the corrected corollary (`variations_cor_2_13_corrected`): entries in ℒ̃;
Λ₁₁, Λ₂₁ ∈ ℝ ∪ iℝ; 1, Λ₁₁, Λ₂₁ Q̄-free; 1, Λ₂₁, Λ₂₂, Λ₂₃, Λ̄₂₂, Λ̄₂₃ Q̄-free. The printed hypotheses are
deliberately not formalised.

### A3. [DALAG] Lemma 11.24, p. 410 — false statement (the conclusion κ′ = 0)

**Printed.** In the setting of Theorem 11.5 (G = 𝔾ₐ^{d₀} × 𝔾ₘ^{d₁}, Y ⊂ ℒ_G of finite rank ℓ₁ > 0, W rational
over Q̄, V ⊇ Y ∪ W of dimension n), with Ω_G = ker exp_G and κ = rank_ℤ(Y ∩ Ω_G): there is a connected algebraic
subgroup G* with d₀′ = d₀, d₁′ = d₁ − κ, d′ = d − κ, n′ = n − κ, ℓ₁′ ≤ ℓ₁ − κ, …, and κ′ = 0, where
κ′ = rank_ℤ(Y′ ∩ Ω_{G′}) and Ω_{G′} = ker exp_{G′}.
Proof: "The ℂ-vector subspace of ℂ^d spanned by Ω_G can be written T_e(G*)".

**What goes wrong.** After the periods lying in Y are divided out, other elements of Y can become periods of the
quotient, so κ′ = 0 can fail.

**Counterexample.** d₀ = 0, d₁ = 3 (G = 𝔾ₘ³), W = {0}, V = ℂ² × {0}, Y = ℤ(2πi, 0, 0) + ℤ(log 2, 2πi, 0).
- Hypotheses: Y ⊂ ℒ³ ∩ V, of rank ℓ₁ = 2; n = 2 < d = 3.
- κ = 1: if a(2πi, 0, 0) + b(log 2, 2πi, 0) ∈ (2πiℤ)³, the first coordinate gives b log 2 ∈ 2πiℤ, so b = 0 (a
  real number in iℝ is 0). So Y ∩ Ω_G = ℤ(2πi, 0, 0).
- The conclusions d₁′ = 2, n′ = 1, ℓ₁′ ≤ 1 force G* to be a one-dimensional subtorus with T_e(G*) ⊂ V and
  Y ∩ T_e(G*) ≠ {0}. A line ℂ(a, b, 0) (a, b ∈ ℤ) meeting Y outside 0 must be ℂ(1, 0, 0): a point
  m(2πi, 0, 0) + k(log 2, 2πi, 0) with k ≠ 0 would give k log 2 ∈ 2πiℚ. So G* = 𝔾ₘ × {1} × {1}.
- In G′ = G/G* ≅ 𝔾ₘ² (last two coordinates), Y′ = ℤ(2πi, 0) ⊂ (2πiℤ)² = Ω_{G′}, so κ′ = 1.

**Repair.** Drop "κ′ = 0". All other conclusions hold for the subtorus G* whose tangent space is the ℂ-span of
Y ∩ Ω_G (a set of vectors in (2πiℤ)^{d₁}, so the span is rational over ℚ and has dimension κ, and it lies in V because
Y does). In the proof, "spanned by Ω_G" should read "spanned by Y ∩ Ω_G": the span of Ω_G itself is
{0} × ℂ^{d₁}, which would give d₁′ = 0. The derivation of (1̃) on p. 411 does not invoke κ′ = 0.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** Not used: the formal proof of [Roy] Theorem 4 (DALAG Proposition 11.19) applies Theorem 11.21
once, in a semistable situation, and never passes to a quotient group, so neither Lemma 11.24 nor (1̃) is needed.

### A4. [DALAG] Lemma 11.18 (2), p. 400 — false statement (the second clause of "Moreover")

**Printed.** k is a number field of degree m with ℚ-basis ω₁, …, ω_m, Υ(x, y₁, …, y_m) = x + ω₁y₁ + ⋯ + ω_my_m on
ℂ^d × (ℂ^d)^m, d̲₀ = d, d̲₁ = md, and 𝒱 = Υ⁻¹(𝒰). "Moreover, if 𝒰 ∩ k^d = {0}, then 𝒱 ∩ ({0} × ℚ^{d̲₁}) = {0} and
𝒱 ∩ (Q̄^{d̲₀} × {0}) = {0}" (the overline is on the second ℚ only).

**What goes wrong.** The first clause is right: (0, y) ∈ 𝒱 with y rational gives Σ ω_c y_c ∈ 𝒰 ∩ k^d = {0}, so y = 0.
The second is not: 𝒱 ∩ (Q̄^{d̲₀} × {0}) = {(x, 0) : x ∈ 𝒰 ∩ Q̄^d}, and 𝒰 ∩ k^d = {0} does not imply 𝒰 ∩ Q̄^d = {0}. The
proof (p. 401: the second property "follows from the fact that the spaces ℂ^d̲/𝒱 and ℂ^d/𝒰 are isomorphic") does
not address the clause.

**Counterexample.** k = ℚ, the case (𝕂, L) = (ℚ, ℚ + ℒ) of Proposition 11.19 (p. 402: "in the case
(𝕂, L) = (ℚ, ℚ + ℒ) we have k = ℚ"): d = 2, 𝒰 = ℂ(1, √2). Then 𝒰 ∩ ℚ² = {0}, and ((1, √2), 0) ∈ 𝒱 ∩ (Q̄² × {0}). For
any number field k, 𝒰 = ℂ(1, α) with α ∈ Q̄ ∖ k.

**Repair.** Either assume 𝒰 ∩ Q̄^d = {0} for the second clause, or read k^{d̲₀} for Q̄^{d̲₀} (true, by the argument of
the first clause). Only the first repair serves Proposition 11.19: in the (Q̄, ℒ̃) case its first case gives
𝒰 ∩ Q̄^d = {0}; in the (ℚ, ℚ + ℒ) case 𝒰 may contain algebraic vectors, and B9 is the consequence.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** Not used: no formal proof uses a statement about 𝒱 ∩ (Q̄^{d̲₀} × {0}).

---

## B. Proof gaps

### B1. [Var] proof of Corollary 2.13, p. 347 — proof gap (a sign); still present after the repair of A2

**Printed.** Corollary 2.12 is applied to the 2 × 5 matrix with columns (Λ₁₁, Λ₂₁), (Λ₁₂, Λ₂₂), (Λ₁₃, Λ₂₃),
(Λ̄₁₂, Λ̄₂₂), (Λ̄₁₃, Λ̄₂₃), and the text concludes (p. 347, lines 4–5): "one at least of the four numbers
Λ₂, Λ̄₂, Λ₃, Λ̄₃ is not in ℒ̃", where Λⱼ = Λ₁₁Λ₂ⱼ − Λ₂₁Λ₁ⱼ.

**What goes wrong.** Write Λ̄₁₁ = ε₁Λ₁₁ and Λ̄₂₁ = ε₂Λ₂₁ with ε₁, ε₂ = ±1 (real or purely imaginary). The number
that Corollary 2.12 attaches to the conjugate column is

  Λ₁₁Λ̄₂ⱼ − Λ₂₁Λ̄₁ⱼ = conj(ε₁Λ₁₁Λ₂ⱼ − ε₂Λ₂₁Λ₁ⱼ).

It equals ±Λ̄ⱼ when ε₁ = ε₂ (Λ₁₁, Λ₂₁ both real or both purely imaginary), but equals ε₁·conj(Λ₁₁Λ₂ⱼ + Λ₂₁Λ₁ⱼ)
when ε₁ = −ε₂, and then the four numbers produced are not Λ₂, Λ̄₂, Λ₃, Λ̄₃.

**Evidence that the mixed case occurs within the hypotheses** (corrected as in A2, and also the printed ones):
Λ₁₁ = log 2, Λ₂₁ = iπ, Λ₁₂ = log 3, Λ₁₃ = log 7, Λ₂₂ = Log(2 + i), Λ₂₃ = Log(3 + 2i). Here 1, log 2, iπ are
Q̄-free (log 2 and iπ are ℚ-free, one real and one purely imaginary; Baker), so also Λ₁₁/Λ₂₁ is transcendental; and
1, iπ, Log(2 ± i), Log(3 ± 2i) are Q̄-free (an integer relation n₀iπ + Σ nₖ Log αₖ = 0 gives
(−1)^{n₀} Π αₖ^{nₖ} = 1, so all nₖ = 0 by the factorisation in A2, then n₀ = 0; Baker). Numerically, for j = 2:
Λ̄₂ ≈ 0.5578 + 3.1300i, while the number attached to the fourth column is ≈ 0.5578 − 3.7728i, which is neither
Λ̄₂ nor −Λ̄₂; for j = 3: Λ̄₃ ≈ 0.8889 + 5.7057i against ≈ 0.8889 − 6.5208i.

**Repair.** Use the columns (ε₂Λ̄₁ⱼ, ε₁Λ̄₂ⱼ) instead of (Λ̄₁ⱼ, Λ̄₂ⱼ) for j = 2, 3. Their numbers are
Λ₁₁ε₁Λ̄₂ⱼ − Λ₂₁ε₂Λ̄₁ⱼ = Λ̄₁₁Λ̄₂ⱼ − Λ̄₂₁Λ̄₁ⱼ = Λ̄ⱼ in every case; the seven columns stay Q̄-free (the second row
only rescales Λ̄₂₂, Λ̄₂₃ by ε₁ ≠ 0); and ℒ̃ is stable under complex conjugation. The printed argument covers the case
"Λ₁₁ and Λ₂₁ both real or both purely imaginary".

**Already corrected in print.** Not in the sources consulted.

**Formal version.** `variations_cor_2_13_corrected` uses the repaired matrix and covers all four sign patterns.

### B2. [DALAG] proof of Corollary 11.10, pp. 396–397, and hence of Corollary 11.15, p. 403 — proof gap

**Printed.** Corollary 11.10 (p. 394): for V ≤ ℂ^d of dimension n with V ∩ ℚ^d = {0},
dim_ℚ(V ∩ ℒ^d) ≤ Ψ(n, d_min). The proof (p. 396) reduces to d_min = d, takes S from Corollary 11.14 (a rational
S ≠ ℂ^d with n′/d′ minimal) and, in the last paragraph of p. 396 (from "If dim(S) > 0"), says: "we may apply
the induction hypothesis to Y ∩ S and deduce that" ℓ* ≤ n*d*/(d* − n*), "hence ℓ* ≤ ψ(n*, d*)", where
d* = dim S, n* = dim(V ∩ S), ℓ* = dim_ℚ(V ∩ S ∩ ℒ^d).
The proof of Corollary 11.15 (p. 403) is "exactly the same", with Proposition 11.19 in place of Corollary 11.14.

**What goes wrong.** Two steps are missing.
1. The induction hypothesis is the statement being proved, with bound Ψ, not n d/(d − n). It cannot yield
   ℓ* ≤ n*d*/(d* − n*): that bound fails for some configurations to which the induction hypothesis applies. By
   DALAG's own Lemma 11.20 (p. 403) there is, for (n, d) = (4, 10), a subspace V of dimension 4 with
   V ∩ Q̄^10 = {0}, not contained in a proper rational subspace, and dim_ℚ(V ∩ ℒ^10) ≥ 4·3/2 + 1 = 7, while
   4·10/6 = 20/3 < 7 (other shapes: (5, 10), (6, 10), (3, 13)). The weaker bound ℓ* ≤ Ψ(n*, d*), which is all
   the last line of the proof uses, is what the induction hypothesis gives — provided step 2 holds.
2. The induction hypothesis, in the reduced form used ("the only subspace … rational over ℚ and contains V is ℂ^d
   itself"), applies to V ∩ S inside S only if no proper rational subspace of S contains V ∩ S. This is not
   checked. Without it one gets only ℓ* ≤ Ψ(n*, d_min(V ∩ S)), and Ψ(n, ·) is non-increasing
   (Ψ(2, 3) = 6 > Ψ(2, 4) = 4 > Ψ(2, 5) = 3), so a smaller d_min gives a weaker bound.

**Repair.** Step 2 follows from the minimality of n′/d′, by the argument of [Roy] p. 39 (the subspace T₁): if
T ⊊ S is rational and contains V ∩ S, then dim(V ∩ T) = n*, so T has the same n′ as S and a larger d′, hence a
smaller ratio (n′ ≥ 1, since V ⊄ S), contradicting the choice of S. Then the induction hypothesis gives
ℓ* ≤ Ψ(n*, d*) directly, and the proof ends as printed with (11.13). (Also, "Y ∩ S" should read V ∩ S.)

**Already corrected in print.** Not in the sources consulted. [Roy] Theorem 5 and its proof (pp. 39–40) treat the
(Q̄, ℒ̃) case of Corollary 11.15 by the route of the repair.

**Formal version.** Both cases are formalised along [Roy]'s route. For (ℚ, ℚ + ℒ): `roy_rat_theorem_five` and
`dalag_cor_11_15_rat` (B9). For (Q̄, ℒ̃): `roy_theorem_five` and
`roy_theorem_five_dmin` (Corollary 11.15 with the bound in the form "ℓ ≤ Σ nᵢdᵢ/(dᵢ − nᵢ) for some decomposition
of (n, d_min)"), and `dalag_cor_11_15_psi` (the printed bound Ψ(n, d_min)), which passes from that form to the
table Ψ through [Roy]'s Lemma on p. 40 (`roy_lemma_phi`; see B6) and Ψ(n, d) = ⌊φ(n, d)⌋
(`dalag_psi_floor_roy_phi`).

### B3. [DALAG] proof of Theorem 11.21, Step 6, p. 407 — proof gap (small): G* not shown to be defined over Q̄

**Printed.** Theorem 11.21 (p. 404) asserts a connected algebraic subgroup G* "defined over Q̄" with
d′ > ℓ₀′ and (λ′ + d₁′)/(d′ − ℓ₀′) ≤ d₁/(d − n). Step 6 takes complex numbers c_{τt} (the polynomial P), applies the
multiplicity estimate, Theorem 8.1, and obtains "a subgroup G* of G of dimension < d"; Step 7 finishes with this G*.

**What goes wrong.** Theorem 8.1 is stated over an arbitrary algebraically closed field K and gives a connected
G* with no field of definition. Here K = ℂ, and the additive part of G* is a subspace of ℂ^{d₀} that need not be
rational over Q̄. The property "defined over Q̄" in the statement is therefore not established.

**Repair (routine).** Either (a) the linear system for the c_{τt} has algebraic coefficients (the points are in
G(Q̄) and W is rational over Q̄), so P can be chosen with algebraic coefficients and Theorem 8.1 applied with
K = Q̄; or (b) at the end, replace the additive part V′ of G* by the span of its algebraic vectors: since
Γ = exp_G(Y) ⊂ G(Q̄), a point of Γ lies in the smaller group iff it lies in G*, so λ′ is unchanged; d₁′ is
unchanged; and d′ − ℓ₀′ = d − dim(W + T_e(G*)) can only increase. So both inequalities still hold. (Exercise 11.1,
p. 411, asks for the analogous refinement of Theorem 11.5 over a subfield of Q̄.)

**Already corrected in print.** Not in the sources consulted.

**Formal version.** The library's form of Theorem 11.21 returns an obstruction with no rationality claim. The
formal proof of [Roy] Theorem 4 uses it once, and there applies repair (b).

### B4. [DALAG] p. 436, Corollary 12.24 and the bullet after it — proof gap: the corollaries cited do not give them

**Printed.** "The strong six exponentials Theorem (Corollary 11.16) follows from Corollary 12.22:", followed by
Corollary 12.24 (M ∈ ℒ̃^{d×ℓ}, rows Q̄-free, columns Q̄-free, ℓd > ℓ + d ⇒ rank M ≥ 2). Then: "One can deduce the
following result either from Corollary 12.23 or from Corollary 12.24", the result being the same statement for
M with entries in ℚ + ℒ and ℚ-free rows and columns. No argument is printed for either deduction.

**What goes wrong.** Corollaries 12.22 and 12.23 give rank M ≥ rstr(M)/2. For d = 2, ℓ = 3 — the strong six
exponentials case itself, and a case of both statements since 6 > 5 — the structural rank is at most
min(d, ℓ) = 2, so they give only rank M ≥ 1, which the hypotheses already imply. For every d, ℓ ≥ 2 the structural
rank can be 2 with free rows and columns: the structural matrix with first row (a₁ + b₁, a₂, …, a_ℓ), first column
(a₁ + b₁, b₂, …, b_d) and zeros elsewhere (aⱼ, bᵢ independent variables) has free rows and free columns and rank 2.
So the cited corollaries cannot give rank ≥ 2 by being applied to M.

**Repair.** The statements are true. Corollary 12.24 follows in two lines from Corollary 12.21 (p. 435): if
rank M ≤ 1 then M = x yᵀ (rank 0 is excluded by the free rows), the rows are Q̄-free iff x₁, …, x_d are, and the
columns iff y₁, …, y_ℓ are; so τᵀMσ = (Σ τᵢxᵢ)(Σ σⱼyⱼ) ≠ 0 for all non-zero algebraic τ, σ, and Corollary 12.21
gives 1 ≥ rank M ≥ dℓ/(d + ℓ) > 1, a contradiction. (Equivalently, Corollary 12.24 is Corollary 11.16 restated, and
it can also be read off from Theorem 12.20.) The ℚ + ℒ statement follows from Corollary 12.24, because by Baker's
theorem ℚ-free vectors with coordinates in ℚ + ℒ are Q̄-free (expand the coordinates on a ℚ-basis 1, μ₁, …, μ_s of
their span, with μ_t ∈ ℒ; Baker makes 1, μ₁, …, μ_s Q̄-free; a Q̄-relation among the vectors becomes Q̄-relations
among ℚ-free rational vectors). It does not follow from Corollary 12.23 for the reason above.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** `dalag_cor_12_24` is proved from Theorem 12.20 (in [Roy]'s form) by a direct case analysis
of the block shape, not from Corollary 12.22; the ℚ + ℒ bullet is not a target.

### B5. [FV] Theorem 2.1, pp. 4–6 — proof gap (scope): the proof covers finite-dimensional Y only; the statement holds for every Y

**Printed.** μ(Y, ℂⁿ) is defined for any Q̄-vector subspace Y of ℂⁿ (p. 4). Theorem 2.1 (p. 5): "Let X and Y be
two Q̄-vector subspaces of ℂⁿ", X of dimension d > n, μ(Y, ℂⁿ) > d/(d − n); then X·Y ⊄ ℒ̃. No finiteness is
assumed for Y.

**What goes wrong.** The proof reduces, "like in Lemme 5.2 of [6]", subspaces X and Y "of dimensions d and ℓ
respectively", and on p. 6 writes Y = Q̄y₁ + ⋯ + Q̄y_ℓ. So it treats dim Y = ℓ < ∞ only. For infinite-dimensional
Y one needs a finite-dimensional Y_f ⊂ Y with μ(Y_f, ℂⁿ) > d/(d − n). That is not automatic, because V ranges over
infinitely many subspaces, and no argument is given.

**Repair.** The statement is true for every Q̄-subspace Y. What the proof needs is one finite-dimensional Y_f ⊂ Y
that serves for all V at once, and a finite approximation supplies it: for every Q̄-subspace Y ⊂ ℂⁿ and every
B ∈ ℕ there is a finite-dimensional Y₀ ⊂ Y with dim(Y₀/(Y₀ ∩ V)) ≥ min(dim(Y/(Y ∩ V)), B) for every ℂ-subspace V
of ℂⁿ, an infinite dimension counting as larger than B. Proof: for finite-dimensional Z ⊂ Y let I(Z) be the
intersection of the ℂ-subspaces V with dim(Z/(Z ∩ V)) < B. It is the intersection of at most n of them, so
dim(Z/(Z ∩ I(Z))) ≤ nB by Grassmann's formula, and the integer (nB + 1)·dim I(Z) + dim(Z/(Z ∩ I(Z))) is bounded;
let Y₀ maximise it. A V not containing I(Y₀) has dim(Y₀/(Y₀ ∩ V)) ≥ B by the definition of I(Y₀). For Z ⊃ Y₀,
maximality gives I(Z) = I(Y₀) and the same quotient dimension there, and Grassmann's formula carries this from
I(Y₀) to every V ⊃ I(Y₀). With B = dn + 1, Y₀ satisfies the hypothesis of the finite-dimensional case whenever
μ(Y, ℂⁿ) > d/(d − n), and the printed proof applied to (X, Y₀) gives the theorem. Equivalently, μ(Y, ℂⁿ) is the
largest μ(Y₀, ℂⁿ) over the finite-dimensional Y₀ ⊂ Y when it is finite, and their supremum when it is infinite.
A Noetherian argument on Grassmannians over Q̄ also works, but only for the subspaces V that the proof of the
finite-dimensional case produces (rational after a change of coordinates); it needs Hilbert's basis theorem and
re-enters that proof, while the argument above uses Grassmann's formula only. Every application in [FV]
(Theorem 1.2, Corollary 1.4) has dim Y = 5.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** `fv_theorem_2_1` is the finite-dimensional case (Y finite-dimensional, an explicit
hypothesis). `fv_finite_approx` is the finite approximation, with three dimension counts as helpers:
`fv_rho_excess` (the excess dim(Z′/(Z′ ∩ V)) − dim(Z/(Z ∩ V)) for Z ⊂ Z′ does not increase as V grows),
`fv_rho_inf` (the intersection of two subspaces) and `fv_rho_sInf` (the bound nB at the intersection of any
family). `fv_theorem_2_1_general` proves the theorem for every Y with the hypothesis written through
finite-dimensional witnesses: for each V ≠ ℂⁿ, some finite-dimensional Y₀ ⊂ Y with
d·(n − dim V) < (d − n)·dim(Y₀/(Y₀ ∩ V)). `fv_theorem_2_1_rank` states it as printed, with dim_Q̄(Y/(Y ∩ V)) a
cardinal (`Module.rank`), and derives it from `fv_theorem_2_1_general` through `fv_rank_quot_witness`.

### B6. [Roy] proof of the Lemma, pp. 40–41 — proof gap (small): "k = 2" does not follow from the two exclusions

**Printed.** The Lemma (p. 40): for integers 0 < n < d, φ(n, d) = φ(1, d − n) + φ(n − 1, n) if n ≥ 2 and
d − n ≥ 2, and φ(n, d) = nd/(d − n) if n = 1 or d − n = 1; here φ(n, d) is the largest Σ nᵢdᵢ/(dᵢ − nᵢ) over the
decompositions (n, d) = Σ (nᵢ, dᵢ) with 0 < nᵢ < dᵢ (pp. 38–39). The proof writes nd/(d − n) = n + n²/(d − n), so
that φ(n, d) − n is the largest Σ nᵢ²/δᵢ over the decompositions (n, d − n) = Σ (nᵢ, δᵢ) into k pairs of positive
integers. It takes a maximiser in which every part has nᵢ = 1 or δᵢ = 1 (by n²/δ ≤ (n − 1)² + 1/(δ − 1) for
n, δ ≥ 2), excludes two parts (nᵢ, 1), (nⱼ, 1) with nᵢ, nⱼ ≥ 2 and two parts (1, δᵢ), (1, δⱼ) with δᵢ, δⱼ ≥ 2,
and concludes (p. 41): "k ≥ 2, so that k = 2". The value (n − 1)² + 1/(δ − 1) follows.

**What goes wrong.** Parts (1, 1) fall under neither exclusion, so the exclusions do not bound k. For
(n, δ) = (3, 4), that is (n, d) = (3, 7), the decomposition (1, 2), (1, 1), (1, 1) has every part with nᵢ = 1, no
two parts of either excluded kind, and k = 3; so has (2, 1), (1, 1), (1, 2) for (n, δ) = (4, 4), that is
(n, d) = (4, 8), with one part of each kind. Neither is a maximiser (values 5/2 < 13/3 and 11/2 < 28/3), but the
printed argument does not show it. Exchanges of two parts, the only kind used, cannot show it: when one of two
parts is (1, 1) and the other has nᵢ = 1 or δᵢ = 1, no rewrite of the pair into one or two parts with the same
sums strictly increases Σ nᵢ²/δᵢ.

**Repair.** One exchange on three parts: (a, 1), (1, b), (1, 1) → (a + 1, 1), (1, b + 1) increases Σ nᵢ²/δᵢ by
2a − 1/(b(b + 1)) > 0 for a, b ≥ 1 (the two parts (a, 1) and (1, b) may themselves be (1, 1)). A decomposition
that obeys the printed conditions and has k ≥ 3 parts has at most one part (a, 1) with a ≥ 2 and at most one
(1, b) with b ≥ 2, hence a part (1, 1), and so contains three parts of this shape: it is not a maximiser. So a
maximiser has k ≤ 2; k = 1 is excluded when n, δ ≥ 2, and the printed conclusion follows. The Lemma is correct.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** `roy_lemma_phi` states the Lemma with the second value in closed form,
(d − n)/(d − n − 1) + (n − 1)n = φ(1, d − n) + φ(n − 1, n), as the greatest value over all decompositions. Its
proof uses no exchanges: the closed form bounds a single part and is superadditive
(`roy_phi_closed_form_superadd`), so it bounds every decomposition by induction on the number of parts, and the
decomposition (1, d − n), (n − 1, n) attains it.

### B7. [DALAG] proof of Lemma 12.9, p. 428 — proof gap (small): an implicit dehomogenisation, and Lemma 12.8 beyond its stated scope

**Printed.** §12.1.4 (p. 426) defines the structural rank rstr_k(M) of a matrix M with respect to a subfield k:
E is the k-span of the entries, φ an injective k-linear map of E into kX₁ + ⋯ + kXₙ, and rstr_k(M) the rank of
φ(M) over k(X₁, …, Xₙ). Lemma 12.8 (p. 426) says that this rank does not depend on the choice; it is stated for φ
given by a basis of E. Lemma 12.9 (p. 427) allows an injective φ into the affine space k + kX₁ + ⋯ + kXₙ. Its
proof (p. 428): compose φ with the injective linear map k + kX₁ + ⋯ + kXₙ → kY₀ + ⋯ + kYₙ,
a₀ + Σ aᵢXᵢ ↦ a₀Y₀ + Σ aᵢYᵢ, and use Lemma 12.8.

**What goes wrong.** Two steps are left to the reader. (1) The composition gives rstr_k(M) as the rank over
k(Y₀, …, Yₙ) of the homogenised matrix ψ(φ(M)), ψ the map above. That this equals the rank of φ(M) over
k(X₁, …, Xₙ), which is what the Lemma asserts, is not argued; the remark printed just before the Lemma (p. 427),
that the determinant of a matrix of linear forms is homogeneous, is the hint. (2) ψ ∘ φ is not given by a basis of
E, so Lemma 12.8 as stated does not apply; its proof (p. 427) covers it, since it starts from two arbitrary
families of algebraically independent elements.

**Repair (routine).** For (1): Xᵢ ↦ Yᵢ/Y₀ defines a homomorphism of fields k(X₁, …, Xₙ) → k(Y₀, …, Yₙ) (a
non-zero polynomial P goes to Y₀^(−deg P) times its homogenisation, which is non-zero); it sends φ(M) to
Y₀⁻¹·ψ(φ(M)), and a homomorphism of fields preserves the rank of a matrix. For (2): read "Lemma 12.8" as its
proof, or as the independence of the choice of φ asserted in §12.1.4. The Lemma is correct.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** `dalag_lemma_12_9` states the Lemma in presentation form, M = Σ eⱼNⱼ with e free over k, for
any field k and any k-linear φ into k + kX₁ + ⋯ + kXₙ that is injective on the span of the eⱼ. Step (1) is
`dalag_lemma_12_9_dehomog`, proved through the substitution Yᵢ ↦ Y₀Yᵢ rather than Xᵢ ↦ Yᵢ/Y₀. Step (2) is
`dalag_lemma_12_8_linear`: Lemma 12.8 for any k-linear map into kX₁ + ⋯ + kXₙ that is injective on the span.
`dalag_cor_12_23_affine` is Corollary 12.23 with the affine matrix M₀ + Σ XₖMₖ of p. 435. `dalag_cor_12_23` needs
neither: it works with ℚ-presentations M = Σ eₖNₖ, whose structural matrix Σ XₖNₖ is homogeneous, and compares the
ranks over ℚ(X) and Q̄(X) through `matrix_rank_map_field`.

### B8. [DALAG] proof of Proposition 12.13, (iv) ⇒ (iii), p. 430 — proof gap (small): the matrix used need not have entries in E

**Printed.** Assuming that (iii) fails, the proof takes x₀, …, xₙ ∈ E, free over k, such that the quotients
yᵢ = xᵢ/x₀ are algebraically dependent, a non-zero P with P(y) = 0, and a square matrix M₀ + Σ MᵢXᵢ over
k + Σ kXᵢ with determinant P (Proposition 12.10). It sets M = M₀ + Σ Mᵢyᵢ: then det M = 0, while the structural
rank of M, through the map that is the identity on k and sends yᵢ to Xᵢ, is full; "condition (iv) does not hold".

**What goes wrong.** Condition (iv) is about matrices with entries in E, and yᵢ = xᵢ/x₀ need not lie in E.
Example: k = ℚ, K = ℂ, E = ℚ + ℚe + ℚe√2 with e = exp(1). Then x₀ = e and x₁ = e√2 are free over ℚ and
X₁² − 2X₀² vanishes at them, so (iii) fails. But y₁ = √2 is not in E: otherwise e would be algebraic or √2
rational. So no M₀ + M₁√2 with det(M₀ + M₁X₁) = X₁² − 2, such as ((√2, 2), (1, √2)), is a matrix over E.

**Repair.** Use x₀M = M₀x₀ + Σ Mᵢxᵢ in place of M. Its entries lie in E, and its rank is rank M, less than its
size. The k-linear map x₀ ↦ 1, xᵢ ↦ Xᵢ is injective on the span of x₀, …, xₙ and sends x₀M to M₀ + Σ MᵢXᵢ, whose
determinant is P ≠ 0; by Lemma 12.9 the structural rank of x₀M is full. In the example,
x₀M = ((e√2, 2e), (e, e√2)) has rank 1 and structural rank 2. The Proposition is correct.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** Proposition 12.13 is not formalised. The repaired step is the case of `dalag_lemma_12_9` (see
B7) with this map.

### B9. [DALAG] proof of Proposition 11.19, pp. 402–403, case (𝕂, L) = (ℚ, ℚ + ℒ) — proof gap: Theorem 11.5 (3′) need not select {e}

**Printed.** The proof reduces to the first case: for every 𝕂-rational T with 0 < dim T < d,
dim(𝒰/𝒰 ∩ T)/codim T > n/d (C1). Then "Thanks to Lemma 11.18, we may apply part (3′) of Theorem 11.5 … Since d̲ > n̲,
we deduce ℓ₁(d̲ − n̲) ≤ d̲₁(n̲ − ℓ̲₀)". This is (3′) read at G* = {e}; section D (first bullet) checks that (3′)
selects {e}.

**What goes wrong.** In Theorem 11.5, "G* is a connected algebraic subgroup of G, defined over Q̄" (p. 381), so
T = Υ(T_e(G*)) is rational over Q̄ only (Lemma 11.18 (3)). For 𝕂 = Q̄ the check in D is right. For 𝕂 = ℚ the first case
says nothing about a T that is not rational over ℚ, and (3′) need not select {e}.

**Counterexample (to the inference).** d = 3, n = 2, 𝒰 = ℂ(1, √2, 0) + ℂ(log 2, log 3, log 5); k = ℚ, m = 1,
G = 𝔾ₐ³ × 𝔾ₘ³, 𝒱 = Υ⁻¹(𝒰): d̲ = 6, n̲ = 5, d̲₁ = 3, ℓ̲₀ = 3.
- 𝒰 ∩ ℚ³ = {0}: if α(1, √2, 0) + β(log 2, log 3, log 5) = q ∈ ℚ³ with q₃ ≠ 0, eliminating α gives
  √2(q₁ log 5 − q₃ log 2) + q₃ log 3 − q₂ log 5 = 0, a non-trivial Q̄-linear relation, excluded by Baker's theorem.
  So q₃ = 0, β = 0, and α = 0.
- The first case holds over ℚ: a rational line meets 𝒰 in {0} (ratio 1 > 2/3); a rational plane meets 𝒰 in a line
  (ratio 1 > 2/3).
- G* = G₀* × {1} with T_e(G₀*) = ℂ(1, √2, 0) is defined over Q̄, T_e(G*) ⊂ 𝒱, and d̲′ = 5, n̲′ = 4, d̲₁′ = 3: the ratio
  d̲₁′/(d̲′ − n̲′) is 3, that of {e}. The minimum is 3 (d̲′ > n̲′ forces T_e(G*) ⊂ 𝒱, and then the ratio is
  3 − dim T_e(G₁*) with T_e(G₁*) ⊂ 𝒰 rational over ℚ, hence {0}); the minimisers are {e} and this G*
  (𝒰 ∩ Q̄³ = Q̄(1, √2, 0), by Baker's theorem). (3′) takes d̲′ minimal and selects G*, not {e}.
The example refutes the inference, not the inequality: here Y* = {0} and 𝒲* = {0}, so (3′) for this G* gives
ℓ₁ ≤ 3(n̲′ − ℓ̲₀′) = 3, which implies ℓ₁(d̲ − n̲) ≤ 6 = d̲₁(n̲ − ℓ̲₀). In general, when Y* = {0}, the mediant inequality
gives the wanted bound; when Y* ≠ {0}, passing from G/G* back to G needs a bound for ℓ₁* that the text does not give.
The tie comes from the algebraic point ((1, √2, 0), 0) of 𝒱 ∩ (Q̄^{d̲₀} × {0}), which the false clause A4 would exclude.

**Repair.** The statement is true. (a) Apply Theorem 11.21 directly to G = 𝔾ₐ^d × 𝔾ₘ^d with Υ(x, y) = x + y, and
replace the additive part of its output by the span of its rational vectors (B3, repair (b), with ℚ in place of Q̄;
legitimate because the additive coordinates of the points are rational). The resulting T is rational over ℚ, and
[Roy]'s argument (Theorem 4 with his Remark (i), p. 37, for F = ℚ) goes through with no selection step.
(b) Inside DALAG's framework: a variant of Theorem 11.5 (3′) in which only G₀* is required to be rational over ℚ (subtori
G₁* always are), under "additive coordinates of Y in ℚ^{d̲₀}, 𝒲 rational over ℚ". Exercise 11.1 (p. 411) does not
supply it: its hypothesis exp_G(Y) ⊂ G(ℚ) fails here (multiplicative coordinates in Q̄, e.g. e^λ = 1 + i). Granting
the variant, T is rational over ℚ, T_e(G₀*) ⊂ 𝒰 is impossible since 𝒰 ∩ ℚ^d = {0}, and the check in D goes through.

**Already corrected in print.** Not in the sources consulted.

**Formal version.** Repair (a): `dalag_cor_11_15_rat` (Corollary 11.15 for (ℚ, ℚ + ℒ)) rests on
`roy_rat_semistable_node`, which applies `linear_subgroup_transcendence` once and never selects a subgroup.

---

## C. Slips

### C1. [DALAG] proof of Proposition 11.19, p. 402 — slip: "> d*/d" should be "> n/d"

**Printed.** After reducing to the case where T = {0} is the only rational T ≠ ℂ^d with n′/d′ ≤ n/d, the text
assumes, for every rational T of dimension d* with 0 < d* < d, that dim(U/U ∩ T)/dim(ℂ^d/T) "> d*/d".

**What is meant.** The first case says n′/d′ > n/d for every such T; the right-hand side should be n/d. With n/d
the next sentence ("This implies U ∩ 𝕂^d = {0}") follows (a rational line T in U would give
(n − 1)/(d − 1) < n/d); with d*/d it does not.

**Already corrected in print.** Not in the sources consulted. **Formal version.** Not affected (the formal proof of
the proposition follows a different route).

### C2. [DALAG] statement of Proposition 11.19, p. 402 — slip: "the subspaces of T" for "the subspaces T of ℂ^d"

**Printed.** "Among the subspaces of T which are rational over 𝕂 and distinct from ℂ^d, we select one …"

**What is meant.** T is the subspace being selected: "Among the subspaces T of ℂ^d which are rational over 𝕂 …",
as in Corollary 11.14 (p. 394), of which Proposition 11.19 is the analogue.

**Already corrected in print.** Not in the sources consulted. **Formal version.** States the selection over all
rational subspaces of ℂ^d.

### C3. [DALAG] p. 394 — slip (attribution): Corollary 11.10 introduced as "Th. 5 of [Roy 1992b]"

**Printed.** Before Corollary 11.10, p. 394 line 7: "Here is Th. 5 of [Roy 1992b], which we shall deduce from
Theorem 11.5" ([Roy 1992b] is [Roy] in these notes).

**What is meant.** Corollary 11.10 is the (ℚ, ℒ) statement: V ∩ ℚ^d = {0}, rationality over ℚ, dim_ℚ(V ∩ ℒ^d).
[Roy] Theorem 5 (p. 39) is the (Q̄, ℒ̃) statement: U ∩ Q̄^d = 0, rationality over Q̄, dim_Q̄(U ∩ ℒ̃^d) ≤ φ(n, d);
the introduction (p. 23) says the bound is proved "where ℚ is replaced by Q̄". It is DALAG's Corollary 11.15
that corresponds to [Roy] Theorem 5 in the (Q̄, ℒ̃) case, as DALAG itself says on p. 398 ("Following [Roy 1992b]")
and as [Var] p. 347 says ("Theorem 5 of [7] (see also Corollary 11.15 in [12])"). Neither statement implies the
other directly (the hypotheses V ∩ ℚ^d = {0} and V ∩ Q̄^d = {0} differ, and so do the two hulls); the (ℚ, ℒ)
version is within reach of [Roy]'s method by his Remark (i), p. 37 (Theorem 4 over a subfield F of Q̄).

**Already corrected in print.** Not in the sources consulted. **Formal version.** Both cases are
formalised: (Q̄, ℒ̃) credited to [Roy] Theorem 5 and DALAG Corollary 11.15, and (ℚ, ℚ + ℒ)
(`dalag_cor_11_15_rat`) credited to DALAG Corollary 11.15 and [Roy]'s Remark (i), p. 37.

### C4. [DALAG] p. 435 — slip: "the subspace of ℒ spanned by 1 and the entries of M"

**Printed.** For M with entries in ℚ + ℒ: "let 1, λ₁, …, λ_m is a basis over ℚ of the subspace of ℒ spanned by 1
and the entries of M", then M = M₀ + M₁λ₁ + ⋯ + M_mλ_m with rational Mᵢ.

**What is meant.** 1 is not in ℒ (e¹ is transcendental); read "of the subspace of ℚ + ℒ spanned by 1 and the
entries of M", with λ₁, …, λ_m ∈ ℒ. The rest of the paragraph (Baker's theorem makes 1, λ₁, …, λ_m Q̄-free, so the
structural ranks over ℚ and over Q̄ agree) is correct with this reading.

**Already corrected in print.** Not in the sources consulted. **Formal version.** Corollary 12.22 is stated with
presentations M = Σ eₖNₖ (eₖ Q̄-free, Nₖ algebraic), and the ℚ + ℒ corollary 12.23 (`dalag_cor_12_23`) with
ℚ-presentations (eₖ ∈ ℚ + ℒ ℚ-free, Nₖ rational), so no basis containing 1 has to be chosen. The step of this
paragraph that Baker's theorem gives, read for ℚ + ℒ, is `baker_rat_add_logAlg_free`: elements of ℚ + ℒ that are
ℚ-free are Q̄-free.

### C5. [FV] p. 6 — slip (citation): "Proposition 11.19 or Theorem 12.19 in [7]"

**Printed.** "Finally Theorem 4 in [5] (which is Proposition 11.19 or Theorem 12.19 in [7]) shows that the rank r of
a d × ℓ matrix M with entries in ℒ̃ satisfies r ≥ dθ/(1 + θ)" ([5] = [Roy], [7] = [DALAG]).

**What is meant.** The matrix form of [DALAG] Proposition 11.19 is Theorem 12.20 (p. 435: "nothing else than
Proposition 11.19"). Theorem 12.19 (p. 434) is the matrix reformulation of Theorem 11.5 (1), a different statement.
The bound r ≥ dθ/(1 + θ) itself is [Roy] Corollary 1, p. 38, deduced there from Theorem 4.

**Already corrected in print.** Not in the sources consulted. **Formal version.** Uses [Roy] Corollary 1 in the
form of Theorem 12.20.

### C6. [FV] p. 7, proof of (3.1) — slip: "dim_Q̄((X ∩ V)/V)" for dim_Q̄(X/(X ∩ V))

**Printed.** For a line V = ker p in ℂ²: "dim_Q̄((X ∩ V)/V) = dim_Q̄ p(X) ≥ 2".

**What is meant.** dim_Q̄(X/(X ∩ V)) = dim_Q̄ p(X), which is what the definition of μ needs. Also, the proof treats
only lines V; the remaining case V = {0} is immediate (dim X / dim ℂ² = 5/2 ≥ 2).

**Already corrected in print.** Not in the sources consulted. **Formal version.** The proof of Theorem 1.2 checks
the needed inequality at V = {0} and at every line.

### C7. [FV] p. 8, Remark after the proof of Theorem 1.2 — slip: indices repeated

**Printed.** "v₄ = (Λ₁₂, 0), v₄ = (Λ₁₃, 0)" and "v′₄ = (0, Λ₁₂), v′₄ = (0, Λ₁₃)".

**What is meant.** The second vectors are v₅ and v′₅.

**Already corrected in print.** Not in the sources consulted. **Formal version.** The remark is not formalised.

### C8. [FV] §4 and [Role] p. 10 — slip (page): Corollary 2.12 of [Var] is cited as being on p. 347

**Printed.** "Corollary 2.12 p. 347 of [8]" ([FV] p. 8); "Corollary 2.12, p. 347 of [14]" ([Role] p. 10).

**What is meant.** [Var] Corollary 2.12 is on p. 346 (its proof ends on p. 346; Corollary 2.13's proof is on
p. 347).

### C9. [DALAG] p. 394, the table Ψ — slip: Ψ(0, 0) is not defined, although Corollaries 11.10 and 11.15 use it

**Printed.** "For d and n positive integers satisfying 0 ≤ n < d, define Ψ(n, d) = …", four rows for 0 < n < d,
and Ψ(0, d) = 0 for d > 0.

**What is meant.** The introduction contradicts itself at n = 0, which it then treats separately, and the case
d = 0 is missing. Corollaries 11.10 (p. 394) and 11.15 (p. 398) allow V = {0}, where d_min = 0, so their bound is
Ψ(0, 0). The intended value is 0, which makes the bound trivially true. Read: for integers 0 ≤ n < d, with
Ψ(0, d) = 0 for every d ≥ 0.

**Already corrected in print.** Not in the sources consulted. **Formal version.** `dalag_cor_11_15_psi` encodes
the table with Ψ(0, d) = 0 for every d, and proves dim V < d_min whenever V ≠ {0}, so the table is evaluated only
at n = 0 or at 0 < n < d_min.

---

### C10. [DALAG] proof of Proposition 12.7, p. 426 — slip: "k-vector subspace" for "K-vector subspace"

**Printed.** The inductive assertion concerns "a k-vector subspace of K^r such that V₁ ∩ k^r = {0}", and V₁ is
then chosen as "the k-vector space spanned by the columns of B".

**What is meant.** K in both places: the assertion is the Proposition in dimension r. With k it fails already at
r = 1 (k = ℚ, E = ℚ + ℚπ, V₁ = ℚπ, where V₁ ∩ E^1 has dimension 1 > 0). Also tacit: "V contains V₁ × {0}^{d−r}"
holds for P·V, where P ∈ GL_d(k) is the left factor of the k-equivalence; P·V satisfies the same hypotheses as V,
and P·(V ∩ E^d) = P·V ∩ E^d. The Proposition is correct.

**Already corrected in print.** Not in the sources consulted. **Formal version.** Not affected (Proposition 12.7 is
not formalised).

### C11. [DALAG] Remark before Lemma 12.9, p. 427 — slip: "If M is a r × r matrix"

**Printed.** The Remark says that if M is "a r × r matrix" with entries in a space with Property (A B; C 0), then
the rank of M is at least r.

**What is meant.** M is k-equivalent to a matrix (12.1) whose block A is a regular r × r matrix; then rank M ≥ r
and the structural rank of M is at most 2r. As printed, every square matrix over such a space would be regular,
which fails for E = k and M = diag(1, 0). The boxed consequence is correct. The Remark also prints a doubled comma
after "Property (A B; C 0)".

**Already corrected in print.** Not in the sources consulted. **Formal version.** Not affected.

## D. Checked and not counted as errors

These places leave a step to the reader or state a side remark without proof. Each was checked and is correct,
or is plainly announced as unproved.

- **[DALAG] proof of Proposition 11.19, p. 403, case (Q̄, ℒ̃).** The proof applies Theorem 11.5 (3′) "thanks to
  Lemma 11.18" and reads off the inequality for G* = {e} without saying that {e} is the subgroup that (3′) selects.
  For 𝕂 = Q̄ it is, and Lemma 11.18 (3) is exactly what shows it. Let G* ≠ {e} in G = 𝔾ₐ^d × 𝔾ₘ^{md} with
  d′ > n′ (the quantities of this auxiliary group, underlined in the book) and T = Υ(T_e(G*)). If 0 < dim T < d, then d₁′ ≥ m·codim T and the first case (n′/d′ > n/d, see C1) give a ratio
  strictly larger than md/(d − n). T = ℂ^d is excluded by d′ > n′. If T = {0}, then T_e(G*) ⊂ ker Υ forces
  G* = {e}, because ω₁, …, ω_m is a ℚ-basis. Also ℓ₁′ = ℓ₁ ≥ mℓ > 0. **Not an error** (terse) for 𝕂 = Q̄. The
  argument applies the first case to T, which Lemma 11.18 (3) makes rational over Q̄ only, so it is valid for 𝕂 = Q̄
  only; in the (ℚ, ℚ + ℒ) case the first case speaks only of T rational over ℚ, and {e} need not be selected (B9).
- **[Roy] p. 37.** "One can show θ(M) = ϑ(M) for any matrix M with coefficients in L, but we will not do it here."
  This is an announced omission in a side remark. Corollary 1 uses ϑ only. **Not an error.**
- **[GDL] Lemme 5.1, p. 106.** The proof is a reference ("Voir [7] lemme 1.3.1"). The statement gives n′ > 0, while
  Lemme 5.2 uses n₁ < n. That follows at once: W = V would give Γ′ ⊂ Γ, so ℓ′/n ≤ ℓ/n. **Not an error.**
- **[GDL] Lemme 5.2, second case, p. 107.** The induction gives d′/n′ ≥ d₂/n₂ for the projection X₂ of rank d₂. The
  needed d₂/n₂ ≥ d/n comes from d₂/n₂ ≥ μ(X₂, K^{n₂}) ≥ d/n (take λ = ρ = 0 in the definition of μ), which is left
  implicit. **Not an error.**
- **[Fis] p. 183, proof of Proposition 5.5.** V = T* ⊕ K Id must be defined over Q̄. This holds because T is
  defined over Q̄ and the form Trace(XY) is defined over ℚ, but the text does not say so. **Not an error.**
- **[Fis] p. 182, N.B. after Lemma 5.6.** The equality case (dim U + dim V = n² + 1 ⇒ U = K Id or V = K Id) is
  announced ("it is possible to prove") without proof and is not used. **Not an error.**
- **[Var], other proofs.** Theorem 3.1 is not proved separately; it is presented as a special case of [Roy]
  Theorem 5 and [DALAG] Corollary 11.15, and it is one (the hull of a hyperplane V with V ∩ Q̄^d = {0} is ℂ^d). The
  proof of Corollary 2.14 is a sketch ("using the full force of Baker's Theorem"). The proof of Theorem 2.11 asserts
  that the columns of the auxiliary matrix are Q̄-free, which follows by projection. **Not errors.**
- **[Roy] proof of Theorem 5, pp. 39–40.** Two routine points are left implicit: that the injection i has a left
  inverse rational over Q̄ (needed for i⁻¹ to map ℒ̃^d into ℒ̃^{d*}), and the existence of the smallest rational
  subspace T₁ (rational subspaces are closed under intersection). **Not errors.**
- **[DALAG] (11.12), p. 394.** On the page the bound is Ψ(n, d) ≥ [nd/(d − n)] with integer-part brackets, which
  is correct. Read without the brackets it would be false already at (n, d) = (1, 3), where Ψ = 1 < 3/2.
  **Not an error.**

---

## Checked how

- These notes were written and checked by Claude agents (Anthropic's Claude, run through Claude Code), working
  for the maintainer of this repository, as part of the formalisation; two independent checks were made before
  publication.
- Every printed passage above was read on page images rendered from the source PDFs (pdftoppm, 100–250 dpi), not
  on text layers, which drop overlines and brackets. The exceptions are two phrases with no overline or bracket in
  them, read on the text layer: "Following [Roy 1992b]" ([DALAG] p. 398) and the use of Z* in [Roy] p. 40. Page numbers are the printed ones. In the copies used, for [DALAG], printed page =
  PDF page − 20 (checked on pp. 382–436 against the running heads). For [Var], printed = PDF + 336. For [FV],
  printed = PDF − 1. For [Roy], printed = PDF + 21. For [GDL], p. 106 = PDF p. 10. For [Fis], p. 182 = PDF p. 16.
  For [Role], printed = PDF.
- Line numbers count text lines from the top of the page, without displays. Elsewhere passages are located by
  statement or paragraph.
- Counterexamples were checked by hand against each printed hypothesis. Q̄-independence of logarithms always comes
  from Baker's theorem plus ℚ-independence, the latter by unique factorisation in ℤ or ℤ[i]. Numerical values
  (B1, and the identities Λ₂ = Log(2 + i), Λ₃ = Log(3 + 2i) in A2) were recomputed with a short Python script.
  So were the Ψ table of [DALAG] p. 394, its monotonicity in d, and the comparison of the Lemma 11.20 lower bound
  with nd/(d − n) for d < 16 (B2).
- For B6, Roy's Lemma was compared with the maximum over all decompositions, by brute force, for every
  0 < n < d ≤ 22; the decompositions with three or more parts that obey the printed conditions were enumerated for
  n, d − n ≤ 8 (91 of them, none a maximiser); and Ψ = ⌊φ⌋ was checked against the table of [DALAG] p. 394 for
  d ≤ 80. For B5, the finite approximation was run with finite fields in place of (Q̄, ℂ), every subspace V
  enumerated: (𝔽₂, 𝔽₄), (𝔽₂, 𝔽₈) and (𝔽₃, 𝔽₉), n ≤ 3. Each check was written twice, independently, as a short
  Python script. For B8 and C11 the examples (determinants, ranks, structural ranks) were recomputed by two short
  Python scripts, one written with the item and one by an independent referee; so were, for B9, the dimensions in
  the example and the monotonicity in d of the Ψ table for d < 60.
- Corrections in print were looked for in [FV] (all nine pages, on images) and [Role] (text search, then §6 on
  images), and on the author's publications page (webusers.imj-prg.fr/~michel.waldschmidt/texts.html, read on
  14 November 2026). That page gives one erratum for [Var]: Corollary 2.12, p. 346, with the hypothesis that
  1, Λ₁₁, Λ₂₁ are linearly independent over Q̄. It lists none for Corollary 2.13 and none for [DALAG]; the
  [DALAG] copy used here is the one hosted on that page. A web search found no errata list for [DALAG].
- "Formal version" refers to the Lean 4 library in this repository. All theorems named there are proved, using
  only Lean's three standard axioms (`propext`, `Classical.choice`, `Quot.sound`).
