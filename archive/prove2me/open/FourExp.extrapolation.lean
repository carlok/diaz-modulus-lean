-- Open on Prove2Me: statement only, not a proof. Node `FourExp.extrapolation`, theorem id 478273e3-7383-4cf2-98e8-dd6ab2db30f3.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem extrapolation
    (x₁ x₂ y₁ y₂ : ℂ) (hy : LinearIndependent ℚ ![y₁, y₂]) (κ : ℝ) (hκ : 0 < κ) :
    ∃ κ' : ℝ, 0 < κ' ∧ ∃ N₀ : ℕ, ∀ N : ℕ, N₀ < N →
      ∀ c : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ → Fin (2 * N) → Fin (2 * N) → ℂ,
      (∀ i j k', ‖c i j k'‖ ≤ Real.exp (κ * ((N : ℝ) ^ 2 * Real.sqrt (Real.log (N : ℝ))))) →
      (∀ a b m : ℕ, a < ⌊(N : ℝ) / Real.sqrt (Real.log (N : ℝ))⌋₊ → b < ⌊(N : ℝ) * Real.sqrt (Real.log (N : ℝ))⌋₊ → m < ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ →
        iteratedDeriv m (fun z : ℂ => ∑ i : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊, ∑ j : Fin (2 * N), ∑ k' : Fin (2 * N),
              c i j k' * z ^ (i : ℕ) * Complex.exp ((((j : ℕ) : ℂ) * x₁ + ((k' : ℕ) : ℂ) * x₂) * z)) ((a : ℂ) * y₁ + (b : ℂ) * y₂) = 0) →
      ∀ s : ℕ, s < ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ / 2 → ∀ a b : ℕ, a < 14 * ⌊(N : ℝ) / Real.sqrt (Real.log (N : ℝ))⌋₊ → b < 14 * ⌊(N : ℝ) * Real.sqrt (Real.log (N : ℝ))⌋₊ →
        ‖iteratedDeriv s (fun z : ℂ => ∑ i : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊, ∑ j : Fin (2 * N), ∑ k' : Fin (2 * N),
              c i j k' * z ^ (i : ℕ) * Complex.exp ((((j : ℕ) : ℂ) * x₁ + ((k' : ℕ) : ℂ) * x₂) * z)) ((a : ℂ) * y₁ + (b : ℂ) * y₂)‖
          ≤ Real.exp (-(((N : ℝ) ^ 4 * Real.sqrt (Real.log (N : ℝ))) / κ')) := by
  sorry

end FourExp
