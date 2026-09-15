-- Open on Prove2Me: statement only, not a proof. Node `FourExp.cauchy_estimate_with_zeros`, theorem id 840a447e-cb2b-4bc8-9bc7-4496079c88d7.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Finset

namespace FourExp

theorem cauchy_estimate_with_zeros
    (F : ℂ → ℂ) (hF : Differentiable ℂ F) (c : ℂ) (ρ R M : ℝ) (hρ : 0 ≤ ρ) (hR : ρ + 1 < R)
    (S : Finset ℂ) (hS : ∀ z ∈ S, ‖z - c‖ ≤ ρ)
    (hM : ∀ z : ℂ, ‖z - c‖ = R → ‖F z‖ ≤ M) (s : ℕ) :
    ‖iteratedDeriv s F c‖
      ≤ (s.factorial : ℝ) * (R / (R - 1)) * ((ρ + 1) / (R - ρ)) ^ (∑ z ∈ S, analyticOrderNatAt F z) * M := by
  sorry

end FourExp
