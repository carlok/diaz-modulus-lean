-- Open on Prove2Me: statement only, not a proof. Node `FourExp.small_irreducible_factor`, theorem id 0d10482b-a0ff-46c6-a565-57809008dcf0.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem small_irreducible_factor
    (α : ℂ) (hα : Transcendental ℚ α) (P : Polynomial ℤ) (hprim : P.IsPrimitive)
    (H n lam : ℝ) (hPH : ∀ i : ℕ, |(P.coeff i : ℝ)| ≤ H)
    (hlog : n ≤ Real.log H) (hdeg : (P.natDegree : ℝ) ≤ n) (hlam : 6 < lam)
    (hsmall : ‖Polynomial.aeval α P‖ < H ^ (-(lam * n))) :
    ∃ Q : Polynomial ℤ, Q ∣ P ∧ Q.IsPrimitive ∧ Irreducible Q ∧
      ∃ s : ℕ, 0 < s ∧
        ‖Polynomial.aeval α Q‖ < H ^ (-((lam - 6) * n / s)) ∧
        (∀ i : ℕ, |(Q.coeff i : ℝ)| ≤ H ^ ((1 : ℝ) / s) * Real.exp (2 * n / s)) ∧
        (Q.natDegree : ℝ) ≤ n / s := by
  sorry

end FourExp
