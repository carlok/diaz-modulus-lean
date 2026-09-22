/-
Mirrored from Prove2Me: `FourExp.small_polynomials_of_counterexample`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/FourExp.small_polynomials_of_counterexample__25405a3b.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Mirror.auxiliary_construction
import Diaz.Mirror.nonvanishing_derivative

namespace Diaz

open Filter Topology

-- `auxiliary_construction` supplies, for each large `N`, an exponential polynomial whose
-- zero count is exceeded on a grid of points, and turns any non-zero derivative there into a small
-- integer polynomial. `nonvanishing_derivative` supplies that non-zero derivative.
theorem small_polynomials_of_counterexample :
    ∀ l₁₁ l₁₂ l₂₁ l₂₂ : ℂ,
      IsAlgebraic ℚ (Complex.exp l₁₁) → IsAlgebraic ℚ (Complex.exp l₁₂) →
      IsAlgebraic ℚ (Complex.exp l₂₁) → IsAlgebraic ℚ (Complex.exp l₂₂) →
      l₁₁ ≠ 0 → l₁₂ ≠ 0 → l₂₁ ≠ 0 → l₂₂ ≠ 0 →
      l₁₁ * l₂₂ = l₁₂ * l₂₁ →
      Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({l₁₁, l₁₂, l₂₁, l₂₂} : Set ℂ)) ≤ 1 →
      ¬ (∃ a b : ℚ, ¬(a = 0 ∧ b = 0) ∧
          (a : ℂ) * l₁₁ + (b : ℂ) * l₂₁ = 0 ∧ (a : ℂ) * l₁₂ + (b : ℂ) * l₂₂ = 0) →
      ¬ (∃ a b : ℚ, ¬(a = 0 ∧ b = 0) ∧
          (a : ℂ) * l₁₁ + (b : ℂ) * l₁₂ = 0 ∧ (a : ℂ) * l₂₁ + (b : ℂ) * l₂₂ = 0) →
      ∃ ω : ℂ, Transcendental ℚ ω ∧
        ∃ σ₁ σ₂ : ℝ → ℝ, StrictMono σ₁ ∧ StrictMono σ₂ ∧
          Tendsto σ₁ atTop atTop ∧ Tendsto σ₂ atTop atTop ∧
          ∃ a₁ a₂ : ℝ, 1 ≤ a₁ ∧ 1 ≤ a₂ ∧
            (∀ x : ℝ, 0 < x → σ₂ x ≤ σ₁ x) ∧
            (∀ x : ℝ, 0 < x → σ₁ (x + 1) ≤ a₁ * σ₁ x) ∧
            (∀ x : ℝ, 0 < x → σ₂ (x + 1) ≤ a₂ * σ₂ x) ∧
            ∀ C : ℝ, ∃ N₀ : ℕ, ∃ P : ℕ → Polynomial ℤ, ∀ N : ℕ, N₀ < N →
              P N ≠ 0 ∧
              (∀ i : ℕ, |((P N).coeff i : ℝ)| ≤ Real.exp (σ₁ N)) ∧
              ((P N).natDegree : ℝ) ≤ σ₂ N ∧
              ‖Polynomial.aeval ω (P N)‖ < Real.exp (-(C * σ₁ N * σ₂ N)) := by
  intro l₁₁ l₁₂ l₂₁ l₂₂ e₁₁ e₁₂ e₂₁ e₂₂ n₁₁ n₁₂ n₂₁ n₂₂ hdet htr hrows hcols
  obtain ⟨ω, hω, σ₁, σ₂, hm₁, hm₂, ht₁, ht₂, a₁, a₂, ha₁, ha₂, h₂₁, hg₁, hg₂,
      x₁, x₂, y₁, y₂, hx, hy, hC⟩ :=
    auxiliary_construction l₁₁ l₁₂ l₂₁ l₂₂ e₁₁ e₁₂ e₂₁ e₂₂ n₁₁ n₁₂ n₂₁ n₂₂ hdet htr hrows hcols
  refine ⟨ω, hω, σ₁, σ₂, hm₁, hm₂, ht₁, ht₂, a₁, a₂, ha₁, ha₂, h₂₁, hg₁, hg₂, fun C => ?_⟩
  obtain ⟨N₀, hN⟩ := hC C
  have key : ∀ N : ℕ, N₀ < N → ∃ P : Polynomial ℤ, P ≠ 0 ∧
      (∀ i : ℕ, |(P.coeff i : ℝ)| ≤ Real.exp (σ₁ N)) ∧
      (P.natDegree : ℝ) ≤ σ₂ N ∧
      ‖Polynomial.aeval ω P‖ < Real.exp (-(C * σ₁ N * σ₂ N)) := by
    intro N hN'
    obtain ⟨S, T, R₁, R₂, S', c, hc, ⟨lam, hlam, hcount⟩, himp⟩ := hN N hN'
    obtain ⟨a, b, s, ha, hb, hs, hne⟩ :=
      nonvanishing_derivative x₁ x₂ y₁ y₂ hx hy S T R₁ R₂ S' c hc lam hlam hcount
    exact himp a b s ha hb hs hne
  classical
  refine ⟨N₀, fun N => if h : N₀ < N then Classical.choose (key N h) else 0, fun N hN' => ?_⟩
  simp only [dite_eq_left hN']
  exact Classical.choose_spec (key N hN')

end Diaz
