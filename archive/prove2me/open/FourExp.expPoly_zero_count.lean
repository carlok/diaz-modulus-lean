-- Open on Prove2Me: statement only, not a proof. Node `FourExp.expPoly_zero_count`, theorem id 4d055466-a546-41a8-a433-78e09b040998.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Finset

namespace FourExp

theorem expPoly_zero_count
    {l : ℕ} (q : Fin l → ℕ) (ω : Fin l → ℂ) (hω : Function.Injective ω)
    (b : (j : Fin l) → Fin (q j) → ℂ) (hb : ∃ j i, b j i ≠ 0)
    (z₀ : ℂ) (ρ : ℝ) (hρ : 0 ≤ ρ) (lam : ℝ) (hlam : 0 < lam)
    (S : Finset ℂ) (hS : ∀ z ∈ S, ‖z - z₀‖ ≤ ρ) :
    (∑ z ∈ S, (analyticOrderNatAt
        (fun w : ℂ => ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w)) z : ℝ))
      < ((∑ j, q j : ℕ) : ℝ) / lam
        + 2 * (1 + ((∑ j, q j : ℕ) : ℝ) ^ lam) / (lam * Real.log ((∑ j, q j : ℕ) : ℝ))
          * (1 + ρ * ⨆ j, ‖ω j‖) := by
  sorry

end FourExp
