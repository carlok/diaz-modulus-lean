import Mathlib

theorem solution :
    ∀ γ : ℂ, γ.re = 0 →
      γ / (((Real.pi : ℝ) : ℂ) * Complex.I) = ((((γ.im / Real.pi : ℝ))) : ℂ) := by
  intro γ hγ
  have hpi : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  have hI : Complex.I ≠ 0 := Complex.I_ne_zero
  rw [div_eq_iff (mul_ne_zero hpi hI)]
  apply Complex.ext
  · simp [hγ]
  · simp
