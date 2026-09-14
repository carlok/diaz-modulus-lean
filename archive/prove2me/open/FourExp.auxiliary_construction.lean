-- Open on Prove2Me: statement only, not a proof. Node `FourExp.auxiliary_construction`, theorem id 98a064ef-3a62-440c-94b0-56817780aca6.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Filter Topology

namespace FourExp

theorem auxiliary_construction :
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
          ∃ x₁ x₂ y₁ y₂ : ℂ, LinearIndependent ℚ ![x₁, x₂] ∧ LinearIndependent ℚ ![y₁, y₂] ∧
            ∀ C : ℝ, ∃ N₀ : ℕ, ∀ N : ℕ, N₀ < N →
              ∃ (S T R₁ R₂ S' : ℕ) (c : Fin S → Fin T → Fin T → ℂ), (∃ i j k, c i j k ≠ 0) ∧
              (∃ lam : ℝ, 0 < lam ∧ (((S * T * T : ℕ) : ℝ) / lam
              + 2 * (1 + ((S * T * T : ℕ) : ℝ) ^ lam) / (lam * Real.log ((S * T * T : ℕ) : ℝ))
                * (1 + ((R₁ : ℝ) * ‖y₁‖ + (R₂ : ℝ) * ‖y₂‖) * ((T : ℝ) * (‖x₁‖ + ‖x₂‖)))
            ≤ ((R₁ * R₂ * S' : ℕ) : ℝ))) ∧
              ∀ a b s : ℕ, a < R₁ → b < R₂ → s < S' →
                iteratedDeriv s (fun z : ℂ => ∑ i : Fin S, ∑ j : Fin T, ∑ k : Fin T,
              c i j k * z ^ (i : ℕ) * Complex.exp ((((j : ℕ) : ℂ) * x₁ + ((k : ℕ) : ℂ) * x₂) * z))
                  ((a : ℂ) * y₁ + (b : ℂ) * y₂) ≠ 0 →
                ∃ P : Polynomial ℤ, P ≠ 0 ∧
                  (∀ i : ℕ, |(P.coeff i : ℝ)| ≤ Real.exp (σ₁ N)) ∧
                  (P.natDegree : ℝ) ≤ σ₂ N ∧
                  ‖Polynomial.aeval ω P‖ < Real.exp (-(C * σ₁ N * σ₂ N)) := by
  sorry

end FourExp
