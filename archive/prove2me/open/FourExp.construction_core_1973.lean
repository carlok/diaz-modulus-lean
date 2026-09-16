-- Open on Prove2Me: statement only, not a proof. Node `FourExp.construction_core_1973`, theorem id 41291ef0-fcbe-4551-92c0-bddd04ee2f84.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem construction_core_1973
    (x₁ x₂ y₁ y₂ : ℂ) (hx : LinearIndependent ℚ ![x₁, x₂]) (hy : LinearIndependent ℚ ![y₁, y₂])
    (hexp : ∀ i j : Fin 2, IsAlgebraic ℚ (Complex.exp (![x₁, x₂] i * ![y₁, y₂] j)))
    (htr : Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({x₁, x₂, y₁, y₂} : Set ℂ)) ≤ 1) :
    ∃ ω : ℂ, Transcendental ℚ ω ∧ ∃ k : ℝ, 0 < k ∧
      ∀ C : ℝ, ∃ N₀ : ℕ, ∀ N : ℕ, N₀ < N →
        ∃ c : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ → Fin (2 * N) → Fin (2 * N) → ℂ, (∃ i j k', c i j k' ≠ 0) ∧
          ∀ a b s : ℕ, a < (14 * ⌊(N : ℝ) / Real.sqrt (Real.log (N : ℝ))⌋₊) → b < (14 * ⌊(N : ℝ) * Real.sqrt (Real.log (N : ℝ))⌋₊) → s < (⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊ / 2) →
            iteratedDeriv s (fun z : ℂ => ∑ i : Fin ⌊(N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))⌋₊, ∑ j : Fin (2 * N), ∑ k' : Fin (2 * N),
              c i j k' * z ^ (i : ℕ) * Complex.exp ((((j : ℕ) : ℂ) * x₁ + ((k' : ℕ) : ℂ) * x₂) * z))
              ((a : ℂ) * y₁ + (b : ℂ) * y₂) ≠ 0 →
            ∃ P : Polynomial ℤ, P ≠ 0 ∧
              (∀ i : ℕ, |(P.coeff i : ℝ)| ≤ Real.exp (k * (if (N : ℝ) ≤ 3 then (N : ℝ) - 3 + 9 * Real.sqrt (Real.log 3) else (N : ℝ) ^ 2 * Real.sqrt (Real.log (N : ℝ))))) ∧
              (P.natDegree : ℝ) ≤ k * (if (N : ℝ) ≤ 3 then (N : ℝ) - 3 + 9 / Real.sqrt (Real.log 3) else (N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ))) ∧
              ‖Polynomial.aeval ω P‖ < Real.exp (-(C * (k * (if (N : ℝ) ≤ 3 then (N : ℝ) - 3 + 9 * Real.sqrt (Real.log 3) else (N : ℝ) ^ 2 * Real.sqrt (Real.log (N : ℝ)))) * (k * (if (N : ℝ) ≤ 3 then (N : ℝ) - 3 + 9 / Real.sqrt (Real.log 3) else (N : ℝ) ^ 2 / Real.sqrt (Real.log (N : ℝ)))))) := by
  sorry

end FourExp
