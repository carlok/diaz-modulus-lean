/-
Mirrored from Prove2Me: `DiazModulus.theorem_D_barrier`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.theorem_D_barrier__8d6f5d8a.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.exists_circle_point_transcendental_over_logAlgTilde_closure
import Diaz.Mirror.logAlg_adjoin_circle_point_theorem_D

namespace Diaz

open Complex ComplexConjugate

/-! # Theorem D as a barrier

`exists_circle_point_transcendental_over_logAlgTilde_closure` at `ρ = 1` gives `u` on the unit circle,
`u ū = 1`, transcendental over `F = ℚ(ℒ̃)`; its hypothesis `u ū` algebraic is `isAlgebraic_one`.
`logAlg_adjoin_circle_point_theorem_D` then gives every Theorem D property for
`L = ℒ_u = span ℚ ℒ ⊔ span ℚ {u, ū}`, together with `ℒ ⊆ L`, `u ∈ L`, `u ≠ 0` and `|u|` algebraic.
So `L` contains ℒ, has all the properties, and contains a non-zero element of algebraic modulus. -/

theorem theorem_D_barrier :
    ∃ L : Submodule ℚ ℂ, (∀ z ∈ LogAlg, z ∈ L) ∧
      /- conjugation -/
      (∀ z ∈ L, conj z ∈ L) ∧
      /- (D2) Baker -/
      (∀ (n : ℕ) (l : Fin n → ℂ), (∀ i, l i ∈ L) → LinearIndependent ℚ l →
        ∀ (b₀ : ℂ) (b : Fin n → ℂ), IsAlgebraic ℚ b₀ → (∀ i, IsAlgebraic ℚ (b i)) →
          (b₀ ≠ 0 ∨ ∃ i, b i ≠ 0) → b₀ + ∑ i, b i * l i ≠ 0) ∧
      /- (D2) Hermite-Lindemann -/
      (∀ z ∈ L, IsAlgebraic ℚ z → z = 0) ∧
      /- (D2) Gel'fond-Schneider -/
      (∀ l₀ β : ℂ, l₀ ∈ L → β * l₀ ∈ L → l₀ ≠ 0 → IsAlgebraic ℚ β →
        ∃ q : ℚ, β = (q : ℂ)) ∧
      /- (D3) Roy, relative to ℒ: strong six exponentials for ℒ̃ gives it for span Q̄ (insert 1 L) -/
      ((∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
          LinearIndependent (↥Qbar) x → LinearIndependent (↥Qbar) y →
          ¬ (∀ i j, x i * y j ∈ LogAlgTilde)) →
        ∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
          LinearIndependent (↥Qbar) x → LinearIndependent (↥Qbar) y →
          ¬ (∀ i j, x i * y j ∈ Submodule.span Qbar (insert 1 (L : Set ℂ)))) ∧
      /- (D3) six exponentials -/
      (∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ), LinearIndependent ℚ x → LinearIndependent ℚ y →
        ¬ (∀ i j, x i * y j ∈ L)) ∧
      /- (D4) four exponentials in transcendence degree one -/
      (∀ l₁₁ l₁₂ l₂₁ l₂₂ : ℂ, l₁₁ ∈ L → l₁₂ ∈ L → l₂₁ ∈ L → l₂₂ ∈ L →
        l₁₁ ≠ 0 → l₁₂ ≠ 0 → l₂₁ ≠ 0 → l₂₂ ≠ 0 → l₁₁ * l₂₂ = l₁₂ * l₂₁ →
        Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({l₁₁, l₁₂, l₂₁, l₂₂} : Set ℂ)) ≤ 1 →
        (∃ a b : ℚ, ¬(a = 0 ∧ b = 0) ∧ (a : ℂ) * l₁₁ + (b : ℂ) * l₂₁ = 0 ∧ (a : ℂ) * l₁₂ + (b : ℂ) * l₂₂ = 0) ∨
        (∃ a b : ℚ, ¬(a = 0 ∧ b = 0) ∧ (a : ℂ) * l₁₁ + (b : ℂ) * l₁₂ = 0 ∧ (a : ℂ) * l₂₁ + (b : ℂ) * l₂₂ = 0)) ∧
      ∃ u ∈ L, u ≠ 0 ∧ IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := by
  obtain ⟨-, u, hu1, hu⟩ :=
    exists_circle_point_transcendental_over_logAlgTilde_closure 1 one_pos
  have hρ : IsAlgebraic ℚ (u * conj u) := by
    rw [hu1, Complex.ofReal_one]
    exact isAlgebraic_one
  obtain ⟨hL, huL, -, hu0, hnorm, hconj, hB, hHL, hGS, hRoy, h6, h4⟩ :=
    logAlg_adjoin_circle_point_theorem_D u hρ hu
  exact ⟨Submodule.span ℚ LogAlg ⊔ Submodule.span ℚ ({u, conj u} : Set ℂ), hL, hconj, hB, hHL,
    hGS, hRoy, h6, h4, u, huL, hu0, hnorm⟩

end Diaz
