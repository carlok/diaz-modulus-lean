import Mathlib

theorem solution :
    ∀ γ : ℂ, γ.im = 0 →
      ‖Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))‖ = 1 := by
  intro γ hγ
  have hre : (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)).re = 0 := by
    simp [Complex.div_re, hγ]
  rw [Complex.norm_exp, hre, Real.exp_zero]
