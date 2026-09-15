-- Open on Prove2Me: statement only, not a proof. Node `FourExp.zero_count_arith`, theorem id 52059e8b-dd9e-404c-ab6e-cd03a25e3a57.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem zero_count_arith
    (n : ℕ) (hn : 2 ≤ n) (x lam : ℝ) (hx : 0 ≤ x) (hlam : 0 < lam) (σ : ℝ) (hσ : 0 ≤ σ)
    (h : ∀ R : ℝ, x + 1 < R →
      σ * Real.log ((R - x) / (x + 1)) ≤ Real.log ((n.factorial : ℝ) * 2 ^ (n + 1) * R / (R - 1)) + 2 * R) :
    σ < (n : ℝ) / lam + 2 * (1 + (n : ℝ) ^ lam) / (lam * Real.log (n : ℝ)) * (1 + x) := by
  sorry

end FourExp
