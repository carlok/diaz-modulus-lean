-- Open on Prove2Me: statement only, not a proof. Node `FourExp.expPoly_ne_zero`, theorem id 62105f9b-bb74-4229-93da-4357e32498b8.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem expPoly_ne_zero
    {l : ℕ} (q : Fin l → ℕ) (ω : Fin l → ℂ) (hω : Function.Injective ω)
    (b : (j : Fin l) → Fin (q j) → ℂ) (hb : ∃ j i, b j i ≠ 0) :
    ∃ w : ℂ, ∑ j, ∑ i : Fin (q j), b j i * w ^ (i : ℕ) * Complex.exp (ω j * w) ≠ 0 := by
  sorry

end FourExp
