-- Open on Prove2Me: statement only, not a proof. Node `FourExp.dvd_of_small_values`, theorem id 94ad0017-5959-42e3-8dbb-5279735f4026.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem dvd_of_small_values
    (P Q : Polynomial ℤ) (hQ : Irreducible Q) (α : ℂ) (H h : ℝ) (hH : 1 ≤ H) (hh : 1 ≤ h)
    (hPH : ∀ i : ℕ, |(P.coeff i : ℝ)| ≤ H) (hQh : ∀ i : ℕ, |(Q.coeff i : ℝ)| ≤ h)
    (hsmall : ((1 + ‖α‖) * ((P.natDegree + Q.natDegree : ℕ) : ℝ)) ^ (P.natDegree + Q.natDegree)
        * H ^ Q.natDegree * h ^ P.natDegree
        * (‖Polynomial.aeval α P‖ + ‖Polynomial.aeval α Q‖) < 1) :
    Q ∣ P := by
  sorry

end FourExp
