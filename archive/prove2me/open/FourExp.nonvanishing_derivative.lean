-- Open on Prove2Me: statement only, not a proof. Node `FourExp.nonvanishing_derivative`, theorem id 6b3e7ded-6c39-4625-b4ac-f87189de2224.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem nonvanishing_derivative
    (x₁ x₂ y₁ y₂ : ℂ) (hx : LinearIndependent ℚ ![x₁, x₂]) (hy : LinearIndependent ℚ ![y₁, y₂])
    (S T R₁ R₂ S' : ℕ) (c : Fin S → Fin T → Fin T → ℂ) (hc : ∃ i j k, c i j k ≠ 0)
    (lam : ℝ) (hlam : 0 < lam)
    (hcount : (((S * T * T : ℕ) : ℝ) / lam
              + 2 * (1 + ((S * T * T : ℕ) : ℝ) ^ lam) / (lam * Real.log ((S * T * T : ℕ) : ℝ))
                * (1 + ((R₁ : ℝ) * ‖y₁‖ + (R₂ : ℝ) * ‖y₂‖) * ((T : ℝ) * (‖x₁‖ + ‖x₂‖)))
            ≤ ((R₁ * R₂ * S' : ℕ) : ℝ))) :
    ∃ a b s : ℕ, a < R₁ ∧ b < R₂ ∧ s < S' ∧
      iteratedDeriv s (fun z : ℂ => ∑ i : Fin S, ∑ j : Fin T, ∑ k : Fin T,
              c i j k * z ^ (i : ℕ) * Complex.exp ((((j : ℕ) : ℂ) * x₁ + ((k : ℕ) : ℂ) * x₂) * z))
        ((a : ℂ) * y₁ + (b : ℂ) * y₂) ≠ 0 := by
  sorry

end FourExp
