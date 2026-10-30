/-
# The multiplicity-estimate hypothesis `hME`

Mirrored from Prove2Me: the definition `MultiplicityEstimateElem` (theorem id
`06d76f73-85da-4674-abc8-c9200d75632e`), archived verbatim as
`archive/prove2me/Def_MultiplicityEstimateElem.lean`. Only the import and the namespace were
rewritten (`DiazModulus` to `Diaz`); the definition is the platform's, byte for byte.

It is a proposition: the case `G⁻ = {e}` of the multiplicity estimate of DALAG Th. 8.1,
written in coordinates. The ported proof of Roy's strong six exponentials theorem,
`Diaz.strong_six_exponentials`, and its two steps that use it (`Diaz.obstruction_1123`,
`Diaz.linear_subgroup_transcendence`) take it as the explicit hypothesis `hME`. The ported
C1.3 node `Diaz.multiplicityEstimateElem` proves it (its vocabulary is `Diaz/Multiplicity.lean`),
so `Diaz.strongSixExponentials` (`Diaz/StrongSixExponentials.lean`) holds with no hypothesis.
The docstring of the definition below is the platform's, written before that proof.
-/
import Mathlib

open Complex ComplexConjugate

namespace Diaz

/-- The elementary multiplicity estimate: the case `G⁻ = {e}`, `G⁺ = G` of Philippon's multiplicity estimate,
DALAG Th. 8.1 (M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Springer 2000, §8.1, p. 232;
chapter 8 by D. Roy), for `G = 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}` over `ℂ`, written in coordinates. It is a proposition, stated
here and not proved.

Data: finite types `A₀, A₁` (coordinates of `𝔾ₐ` and `𝔾ₘ`), `B₀` (a family `wₑ` spanning the subspace `W` of
`ℂ^{A₀} × ℂ^{A₁}` along which one differentiates) and `B₁` (generators `(uₑ j, aₑ j)` of the point set
`Σ = {(Σ_j s_j uₑ j, Π_j (aₑ j)^{s_j}) : |s_j| ≤ M₁}`, with every `aₑ j i ≠ 0`); naturals `D₀, D₁ ≥ 1`, `M₀, M₁`;
and a nonzero coefficient vector `cₑ` on the exponents `(τ, t)`, `τ_h ≤ D₀`, `t_i ∈ [-D₁, D₁]` (entry `t_i + D₁`), that
is, the polynomial `P = Σ cₑ(τ, t) X^τ Y^t`.

Premise: `P` vanishes to order `> d·M₀` along `W` at every point of `Σ[d]`, `d = |A₀| + |A₁|`. In coordinates, for every
`r ≤ d·M₀`, every `k : Fin r → B₀` and every `s` with `|s_j| ≤ d·M₁`,
`Σ_{(τ,t)} cₑ(τ,t) · (Op_{wₑ (k 1)} ⋯ Op_{wₑ (k r)} X^τ)(Σ_j s_j uₑ j) · Π_i (Π_j aₑ j i ^ s_j)^{t_i} = 0`, where
`Op_w = Σ_h w.1 h ∂/∂X_h + (Σ_i w.2 i · t_i) id` is the derivation `D_w` of DALAG §8.1 acting on `X^τ Y^t`.

Conclusion: there are a subspace `Vₑ ≤ ℂ^{A₀}` and integer vectors `φₑ k ∈ ℤ^{A₁}` with common complex kernel `Lₑ`
(the obstruction subgroup `G* = Vₑ × T_Φ`, recorded only through `(Vₑ, φₑ)`), and `ℓₑ` with
`ℓₑ + dim (W ⊓ Vₑ × Lₑ) = dim W`, such that `dim Vₑ + dim Lₑ < d` and every set `Rₑ` of vectors in the box
`|s_j| ≤ M₁` that are pairwise incongruent modulo `(Vₑ, φₑ)` satisfies
`C(M₀ + ℓₑ, ℓₑ) · |Rₑ| · D₀^{dim Vₑ} · D₁^{dim Lₑ} ≤ 2^{d(d+1)/2} · d! · 2^{|A₁|} · |A₀|^{|A₀|} · D₀^{|A₀|} · D₁^{|A₁|}`.
This is Th. 8.1's inequality `C(S₀ + ℓ₀′, ℓ₀′) · Card((Σ + G*)/G*) · H(G*; D₀, D) ≤ H(G⁺; D₀, D)` with `S₀ = M₀`, the
Hilbert function of `G*` bounded below and that of `G⁺ = G` bounded above (DALAG Prop. 5.14). -/
def MultiplicityEstimateElem : Prop :=
  ∀ (A₀ A₁ B₀ B₁ : Type) [Fintype A₀] [Fintype A₁] [Fintype B₀] [Fintype B₁]
      [DecidableEq A₀] [DecidableEq A₁]
      (wₑ : B₀ → (A₀ → ℂ) × (A₁ → ℂ)) (uₑ : B₁ → A₀ → ℂ) (aₑ : B₁ → A₁ → ℂ) (D₀ D₁ M₀ M₁ : ℕ)
      (cₑ : (A₀ → Fin (D₀ + 1)) × (A₁ → Fin (2 * D₁ + 1)) → ℂ),
      1 ≤ D₀ → 1 ≤ D₁ → (∀ j i, aₑ j i ≠ 0) → cₑ ≠ 0 →
      (∀ (rₑ : ℕ) (kₑ : Fin rₑ → B₀) (sₑ : B₁ → ℤ), rₑ ≤ (Fintype.card A₀ + Fintype.card A₁) * M₀ → (∀ j, |sₑ j| ≤ (((Fintype.card A₀ + Fintype.card A₁) * M₁ : ℕ) : ℤ)) →
        ∑ l, cₑ l * (MvPolynomial.eval (∑ j, ((sₑ j : ℤ) : ℂ) • uₑ j)
          ((List.ofFn fun k : Fin rₑ =>
            ((∑ h, (wₑ (kₑ k)).1 h • (MvPolynomial.pderiv h).toLinearMap
              + (∑ i, (wₑ (kₑ k)).2 i * (((l.2 i : ℕ) : ℂ) - D₁)) • LinearMap.id :
                Module.End ℂ (MvPolynomial A₀ ℂ)))).prod
            (∏ h, MvPolynomial.X h ^ (l.1 h : ℕ)))
        * ∏ i, (∏ j, aₑ j i ^ sₑ j) ^ (((l.2 i : ℕ) : ℤ) - D₁)) = 0) →
      ∃ (Vₑ : Submodule ℂ (A₀ → ℂ)) (qₑ : ℕ) (φₑ : Fin qₑ → A₁ → ℤ) (Lₑ : Submodule ℂ (A₁ → ℂ)) (ℓₑ : ℕ),
        (∀ vₑ, vₑ ∈ Lₑ ↔ ∀ k, ∑ i, (φₑ k i : ℂ) * vₑ i = 0) ∧
        ℓₑ + Module.finrank ℂ ↥(Submodule.span ℂ (Set.range wₑ) ⊓ Vₑ.prod Lₑ)
          = Module.finrank ℂ ↥(Submodule.span ℂ (Set.range wₑ)) ∧
        Module.finrank ℂ ↥Vₑ + Module.finrank ℂ ↥Lₑ < Fintype.card A₀ + Fintype.card A₁ ∧
        ∀ Rₑ : Finset (B₁ → ℤ), (∀ s ∈ Rₑ, ∀ j, |s j| ≤ (M₁ : ℤ)) →
          (∀ s ∈ Rₑ, ∀ s' ∈ Rₑ,
            ((∑ j, ((s j - s' j : ℤ) : ℂ) • uₑ j) ∈ Vₑ ∧
              ∀ k, ∏ i, (∏ j, aₑ j i ^ (s j - s' j)) ^ φₑ k i = 1) → s = s') →
          (M₀ + ℓₑ).choose ℓₑ * Rₑ.card * D₀ ^ Module.finrank ℂ ↥Vₑ * D₁ ^ Module.finrank ℂ ↥Lₑ
            ≤ (2 ^ ((Fintype.card A₀ + Fintype.card A₁) * (Fintype.card A₀ + Fintype.card A₁ + 1) / 2)
            * (Fintype.card A₀ + Fintype.card A₁).factorial * 2 ^ Fintype.card A₁
            * Fintype.card A₀ ^ Fintype.card A₀) * D₀ ^ Fintype.card A₀ * D₁ ^ Fintype.card A₁

end Diaz
