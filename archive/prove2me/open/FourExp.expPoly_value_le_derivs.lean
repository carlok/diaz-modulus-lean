-- Open on Prove2Me: statement only, not a proof. Node `FourExp.expPoly_value_le_derivs`, theorem id aec4da14-b097-4fda-999a-687c2dbecdd4.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Finset

namespace FourExp

theorem expPoly_value_le_derivs
    {l : ℕ} (q : Fin l → ℕ) (w : Fin l → ℂ) (hw : Function.Injective w)
    (P : Fin l → Polynomial ℂ) (hP : ∀ j, P j = 0 ∨ (P j).natDegree < q j)
    (W R D : ℝ) (hW0 : 0 ≤ W) (hW : ∀ j, ‖w j‖ ≤ W) (hR : 0 ≤ R)
    (hD : ∀ s : ℕ, s < ∑ j, q j →
      ‖iteratedDeriv s (fun z : ℂ => ∑ j, (P j).eval z * Complex.exp (w j * z)) 0‖ ≤ D)
    (u : ℂ) (hu : ‖u‖ ≤ R) :
    ‖∑ j, (P j).eval u * Complex.exp (w j * u)‖
      ≤ ((∑ j, q j : ℕ) : ℝ) * (W + 1) ^ ((∑ j, q j) + 1) * Real.exp (R * (W + 1)) * D := by
  sorry

end FourExp
