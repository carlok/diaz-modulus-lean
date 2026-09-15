-- Open on Prove2Me: statement only, not a proof. Node `FourExp.zero_count_degenerate`, theorem id e7bb8de6-eb16-421c-a71b-a457db838e41.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Finset

namespace FourExp

theorem zero_count_degenerate
    {l : ℕ} (q : Fin l → ℕ) (ω : Fin l → ℂ) (hω : Function.Injective ω)
    (b : (j : Fin l) → Fin (q j) → ℂ) (hb : ∃ j i, b j i ≠ 0)
    (S : Finset ℂ) (hdeg : (∑ j, q j) ≤ 1 ∨ (⨆ j, ‖ω j‖) = 0) :
    (∑ z ∈ S, analyticOrderNatAt (fun w : ℂ => ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w)) z) + 1 ≤ ∑ j, q j := by
  sorry

end FourExp
