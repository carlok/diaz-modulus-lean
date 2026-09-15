-- Open on Prove2Me: statement only, not a proof. Node `FourExp.height_dvd_le`, theorem id 5b99493b-fb4c-49c3-8afe-4ed79a8f2bed.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

namespace FourExp

theorem height_dvd_le
    (P Q : Polynomial ℤ) (hP : P ≠ 0) (hQP : Q ∣ P) (H : ℝ)
    (hPH : ∀ i : ℕ, |(P.coeff i : ℝ)| ≤ H) :
    ∀ i : ℕ, |(Q.coeff i : ℝ)| ≤ Real.exp (P.natDegree : ℝ) * H := by
  sorry

end FourExp
