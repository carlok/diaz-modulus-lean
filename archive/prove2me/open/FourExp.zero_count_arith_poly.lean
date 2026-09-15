-- Open on Prove2Me: statement only, not a proof. Node `FourExp.zero_count_arith_poly`, theorem id 46d2beb4-7606-4504-994b-05af059e4f49.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem zero_count_arith_poly
    (n : ℕ) (x lam : ℝ) (hx : 0 ≤ x) (hlam : 0 < lam) (σ : ℕ) (h : σ + 1 ≤ n) :
    (σ : ℝ) < (n : ℝ) / lam + 2 * (1 + (n : ℝ) ^ lam) / (lam * Real.log (n : ℝ)) * (1 + x) := by
  sorry

end FourExp
