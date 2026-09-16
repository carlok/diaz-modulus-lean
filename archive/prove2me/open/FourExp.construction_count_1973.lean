-- Open on Prove2Me: statement only, not a proof. Node `FourExp.construction_count_1973`, theorem id fede9f8c-c982-4629-9b09-f945e6eb22f6.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem construction_count_1973 (X Y₁ Y₂ : ℝ) (hX : 0 ≤ X) (hY₁ : 0 ≤ Y₁) (hY₂ : 0 ≤ Y₂) :
    ∃ N₀ : ℕ, ∀ N : ℕ, N₀ < N →
      ((((⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊) * (2 * N) * (2 * N) : ℕ) : ℝ) / (1 / 20 : ℝ)
              + 2 * (1 + (((⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊) * (2 * N) * (2 * N) : ℕ) : ℝ) ^ (1 / 20 : ℝ)) / ((1 / 20 : ℝ) * Real.log ((((⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊) * (2 * N) * (2 * N) : ℕ) : ℝ)))
                * (1 + (((14 * ⌊(N : ℝ) / Real.sqrt (Real.log (N : ℝ))⌋₊) : ℕ) * Y₁ + ((14 * ⌊(N : ℝ) * Real.sqrt (Real.log (N : ℝ))⌋₊) : ℕ) * Y₂) * (((2 * N) : ℕ) * X))
            ≤ ((((14 * ⌊(N : ℝ) / Real.sqrt (Real.log (N : ℝ))⌋₊)) * ((14 * ⌊(N : ℝ) * Real.sqrt (Real.log (N : ℝ))⌋₊)) * (⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ / 2) : ℕ) : ℝ)) := by
  sorry

end FourExp
