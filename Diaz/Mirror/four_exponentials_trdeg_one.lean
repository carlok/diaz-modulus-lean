/-
Mirrored from Prove2Me: `DiazModulus.four_exponentials_trdeg_one`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.four_exponentials_trdeg_one__cebab953.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.transcendence_criterion
import Diaz.Mirror.small_polynomials_of_counterexample

namespace Diaz

open Complex ComplexConjugate

-- Proof by contradiction. If neither the rows nor the columns are ℚ-dependent, the analytic
-- construction `small_polynomials_of_counterexample` produces a transcendental `ω` and
-- integer polynomials that are too small at `ω`; the transcendence criterion
-- `transcendence_criterion` then makes `ω` algebraic.
theorem four_exponentials_trdeg_one :
    ∀ l₁₁ l₁₂ l₂₁ l₂₂ : ℂ,
      IsAlgebraic ℚ (Complex.exp l₁₁) → IsAlgebraic ℚ (Complex.exp l₁₂) →
      IsAlgebraic ℚ (Complex.exp l₂₁) → IsAlgebraic ℚ (Complex.exp l₂₂) →
      l₁₁ ≠ 0 → l₁₂ ≠ 0 → l₂₁ ≠ 0 → l₂₂ ≠ 0 →
      l₁₁ * l₂₂ = l₁₂ * l₂₁ →
      Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({l₁₁, l₁₂, l₂₁, l₂₂} : Set ℂ)) ≤ 1 →
      (∃ a b : ℚ, ¬(a = 0 ∧ b = 0) ∧
          (a : ℂ) * l₁₁ + (b : ℂ) * l₂₁ = 0 ∧ (a : ℂ) * l₁₂ + (b : ℂ) * l₂₂ = 0)
      ∨ (∃ a b : ℚ, ¬(a = 0 ∧ b = 0) ∧
          (a : ℂ) * l₁₁ + (b : ℂ) * l₁₂ = 0 ∧ (a : ℂ) * l₂₁ + (b : ℂ) * l₂₂ = 0) := by
  intro l₁₁ l₁₂ l₂₁ l₂₂ e₁₁ e₁₂ e₂₁ e₂₂ n₁₁ n₁₂ n₂₁ n₂₂ hdet htr
  by_contra hcon
  obtain ⟨hrows, hcols⟩ := not_or.mp hcon
  obtain ⟨ω, hω, σ₁, σ₂, hm₁, hm₂, ht₁, ht₂, a₁, a₂, ha₁, ha₂, h₂₁, hg₁, hg₂, hC⟩ :=
    small_polynomials_of_counterexample l₁₁ l₁₂ l₂₁ l₂₂ e₁₁ e₁₂ e₂₁ e₂₂
      n₁₁ n₁₂ n₂₁ n₂₂ hdet htr hrows hcols
  obtain ⟨N₀, P, hP⟩ := hC (max (10 + 1) ((4 + 1) * (a₁ * a₂)))
  exact hω (transcendence_criterion ω 1 one_pos σ₁ σ₂ hm₁ hm₂ ht₁ ht₂ a₁ a₂ ha₁ ha₂
    h₂₁ hg₁ hg₂ N₀ P (fun N hN => (hP N hN).1) (fun N hN => (hP N hN).2.1)
    (fun N hN => (hP N hN).2.2.1) (fun N hN => (hP N hN).2.2.2))

end Diaz
