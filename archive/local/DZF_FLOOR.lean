import Definitions.Def_DiazModulus

/-!
# Strength floor: `real_gamma` implies `π²` transcendental

`DiazModulus.recip_pi_not_log_real_gamma` says: every real algebraic
`γ ≠ 0` has `e^{γ/(iπ)}` transcendental. This file proves outright that
this statement alone implies `Transcendental ℚ π²` — no conjecture.

The test point is `γ₀ = π²` itself: *if* `π²` were algebraic, `γ₀` would be
a real nonzero algebraic, while `γ₀/(iπ) = π/i = −iπ` has
`e^{−iπ} = −1`, algebraic — contradicting the hypothesis. In particular a
proof of the real axis half must be at least as strong as `π`-transcendence.

The imaginary axis has no such test point (it would need real `λ ≠ 0` with
both `e^λ` and `iπλ` algebraic; `λ = log 2` fails the second), so this floor
is specific to the real half. Clean build, zero `sorry`.
-/

open Complex ComplexConjugate

namespace DiazModulus

/-- Algebraic numbers: negation closure (`Qbar`-subfield pattern). -/
theorem DZF_alg_neg {z : ℂ} (hz : IsAlgebraic ℚ z) : IsAlgebraic ℚ (-z) := by
  rw [← mem_Qbar_iff] at *
  exact Subfield.neg_mem _ hz

/-- The real-axis half implies `π²` transcendental, unconditionally. -/
theorem DZF_pi_sq_transcendental_of_real_gamma
    (hS : ∀ γ : ℂ, IsAlgebraic ℚ γ → γ ≠ 0 → γ.im = 0 →
      ¬ IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)))) :
    Transcendental ℚ ((((Real.pi : ℝ) : ℂ)) ^ 2) := by
  intro hpi2
  have hpi0 : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  -- the test point `γ₀ = π²`, as a real cast
  have hγ : IsAlgebraic ℚ ((((Real.pi ^ 2 : ℝ))) : ℂ) := by
    have hcast : ((((Real.pi ^ 2) : ℝ)) : ℂ) = (((Real.pi : ℝ) : ℂ)) ^ 2 := by
      push_cast
      ring
    rw [hcast]
    exact hpi2
  have hγ0 : ((((Real.pi ^ 2 : ℝ))) : ℂ) ≠ 0 := by
    have hne : Real.pi ^ 2 ≠ 0 := pow_ne_zero 2 Real.pi_ne_zero
    exact_mod_cast hne
  have him : ((((Real.pi ^ 2 : ℝ))) : ℂ).im = 0 := Complex.ofReal_im _
  have hcon := hS _ hγ hγ0 him
  -- `γ₀/(iπ) = −iπ`, so `e^λ₀ = −1`
  have hlam : ((((Real.pi ^ 2 : ℝ))) : ℂ) / (((Real.pi : ℝ) : ℂ) * Complex.I) =
      -(((Real.pi : ℝ) : ℂ) * Complex.I) := by
    have hI2 : Complex.I ^ 2 = (-1 : ℂ) := by rw [sq, Complex.I_mul_I]
    rw [div_eq_iff (mul_ne_zero hpi0 Complex.I_ne_zero)]
    push_cast
    ring_nf
    rw [hI2]
    ring
  rw [hlam, Complex.exp_neg_pi_mul_I] at hcon
  exact hcon (DZF_alg_neg isAlgebraic_one)

end DiazModulus
