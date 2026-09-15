-- Open on Prove2Me: statement only, not a proof. Node `FourExp.expPoly_zero_count_scaled`, theorem id 0fdacfda-2630-482e-8cf1-f159d6ba6be7.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Finset

namespace FourExp

theorem expPoly_zero_count_scaled
    {l : ℕ} (q : Fin l → ℕ) (ω : Fin l → ℂ) (hω : Function.Injective ω)
    (b : (j : Fin l) → Fin (q j) → ℂ) (hb : ∃ j i, b j i ≠ 0)
    (z₀ : ℂ) (ρ : ℝ) (hρ : 0 ≤ ρ) (S : Finset ℂ) (hS : ∀ z ∈ S, ‖z - z₀‖ ≤ ρ)
    (hΩ : 0 < ⨆ j, ‖ω j‖) :
    ∀ R : ℝ, ρ * (⨆ j, ‖ω j‖) + 1 < R →
      (∑ z ∈ S, (analyticOrderNatAt (fun w : ℂ => ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w)) z : ℝ))
          * Real.log ((R - ρ * (⨆ j, ‖ω j‖)) / (ρ * (⨆ j, ‖ω j‖) + 1))
        ≤ Real.log (((∑ j, q j).factorial : ℝ) * 2 ^ ((∑ j, q j) + 1) * R / (R - 1)) + 2 * R := by
  sorry

end FourExp
