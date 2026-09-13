import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

namespace DiazModulus

theorem I_alg : IsAlgebraic ℚ Complex.I := by
  refine ⟨Polynomial.X ^ 2 + 1, ?_, ?_⟩
  · intro h
    have := congrArg (Polynomial.coeff · 0) h
    simp at this
  · simp [Polynomial.aeval_def, Complex.I_sq]

/-- π is transcendental, from the mission's Hermite–Lindemann. -/
theorem pi_transc : Transcendental ℚ ((Real.pi : ℝ) : ℂ) := by
  intro halg
  have hIpi : IsAlgebraic ℚ (Complex.I * ((Real.pi : ℝ) : ℂ)) := I_alg.mul halg
  have hne : Complex.I * ((Real.pi : ℝ) : ℂ) ≠ 0 := by
    simp [Complex.I_ne_zero, Real.pi_ne_zero]
  have hT := hermite_lindemann_holds _ hne hIpi
  apply hT
  rw [show Complex.I * ((Real.pi : ℝ) : ℂ) = ((Real.pi : ℝ) : ℂ) * Complex.I by ring,
    Complex.exp_mul_I]
  simp [Real.cos_pi, Real.sin_pi]
  exact (isAlgebraic_one).neg

/-- Child A: `exp u = 1`. Closable, via transcendence of π. -/
theorem gen3_A :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 → u.im ≠ 0 →
      Complex.exp u = 1 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ _ h1
  exfalso
  obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp h1
  have hn0 : (n : ℂ) ≠ 0 := by
    intro h
    exact hu (by rw [hn, h, zero_mul])
  have hnR : |(n : ℝ)| ≠ 0 := by
    simpa using (by exact_mod_cast hn0 : (n : ℝ) ≠ 0)
  -- ‖u‖ = |n| * (2π)
  have hnorm : (‖u‖ : ℝ) = |(n : ℝ)| * (2 * Real.pi) := by
    rw [hn]
    rw [norm_mul, norm_mul, norm_mul]
    simp [Complex.norm_I, abs_of_nonneg Real.pi_pos.le]
  -- so π = ‖u‖ / (|n| * 2), a Qbar-quotient
  have hpi : ((Real.pi : ℝ) : ℂ) = ((‖u‖ : ℝ) : ℂ) / (((|(n : ℝ)| * 2 : ℝ)) : ℂ) := by
    rw [hnorm]; push_cast
    have : ((|(n : ℝ)| : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hnR
    field_simp
  apply pi_transc
  rw [hpi]
  have hnum : ((‖u‖ : ℝ) : ℂ) ∈ Qbar := mem_Qbar_iff.mpr hmod
  have hden : (((|(n : ℝ)| * 2 : ℝ)) : ℂ) ∈ Qbar := by
    have hcast : (((|(n : ℝ)| * 2 : ℝ)) : ℂ) = ((|n| * 2 : ℤ) : ℂ) := by
      push_cast [← Int.cast_abs]
      norm_num
    rw [hcast]
    exact mem_Qbar_iff.mpr (isAlgebraic_int _)
  exact mem_Qbar_iff.mp (div_mem hnum hden)

end DiazModulus
