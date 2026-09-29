/-
Mirrored from Prove2Me: `DiazModulus.recip_pi_log_of_torsion_rational_modulus`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.recip_pi_log_of_torsion_rational_modulus__d3bc9123.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.diaz_number_forces_transcendence

namespace Diaz

/-!
# `e^{iγ/π}` at a rational squared modulus

Let `t ≠ 0` be real with `e^t` algebraic and `t² + π² = r` rational, and let `γ ≠ 0` be rational.
Suppose `e^{iγ/π}` were algebraic. Write `r / γ = a / b` with `a ∈ ℤ` and `b ∈ ℕ` positive, so
that `b r = a γ`. Then

  `(e^{ir/π})^b = e^{i b r/π} = e^{i a γ/π} = (e^{iγ/π})^a`

is algebraic, hence so is `e^{ir/π}`, and so is its inverse `e^{-ir/π} = e^{r/(π i)}`.

On the other hand `t² + π² = r` is algebraic, so the transcendence statement for Diaz numbers
says that `e^{(t² + π²)/(π i)} = e^{r/(π i)}` is transcendental. This is a contradiction.
-/

namespace R1_recip_pi_log_of_torsion_rational_modulus

/-- Integer powers of an algebraic number are algebraic. -/
theorem isAlgebraic_zpow {x : ℂ} (hx : IsAlgebraic ℚ x) (n : ℤ) : IsAlgebraic ℚ (x ^ n) := by
  rcases Int.eq_nat_or_neg n with ⟨m, rfl | rfl⟩
  · rw [zpow_natCast]
    exact hx.pow m
  · rw [zpow_neg, zpow_natCast]
    exact (hx.pow m).inv

/-- If `e^{iγ/π}` is algebraic for a rational `γ ≠ 0`, then `e^{ir/π}` is algebraic for every
rational `r`. -/
theorem isAlgebraic_exp_I_mul_div_pi (γ : ℚ) (hγ : γ ≠ 0)
    (hw : IsAlgebraic ℚ (Complex.exp (Complex.I * (γ : ℂ) / ((Real.pi : ℝ) : ℂ)))) (r : ℚ) :
    IsAlgebraic ℚ (Complex.exp (Complex.I * (r : ℂ) / ((Real.pi : ℝ) : ℂ))) := by
  obtain ⟨s, hsγ⟩ : ∃ s : ℚ, s * γ = r := ⟨r / γ, div_mul_cancel₀ r hγ⟩
  have hrs : (s.den : ℚ) * r = s.num * γ := by
    rw [← Rat.mul_den_eq_num, ← hsγ]
    ring
  have hrs' : (s.den : ℂ) * (r : ℂ) = (s.num : ℂ) * (γ : ℂ) := by exact_mod_cast hrs
  have hpow : Complex.exp (Complex.I * (r : ℂ) / ((Real.pi : ℝ) : ℂ)) ^ s.den =
      Complex.exp (Complex.I * (γ : ℂ) / ((Real.pi : ℝ) : ℂ)) ^ s.num := by
    rw [← Complex.exp_nat_mul, ← Complex.exp_int_mul]
    congr 1
    linear_combination (Complex.I / ((Real.pi : ℝ) : ℂ)) * hrs'
  refine IsAlgebraic.of_pow s.den_pos ?_
  rw [hpow]
  exact isAlgebraic_zpow hw s.num

end R1_recip_pi_log_of_torsion_rational_modulus

open R1_recip_pi_log_of_torsion_rational_modulus in
theorem recip_pi_log_of_torsion_rational_modulus (t : ℝ) (ht : t ≠ 0)
    (he : IsAlgebraic ℚ (Complex.exp (t : ℂ))) (r : ℚ) (hr : t ^ 2 + Real.pi ^ 2 = r)
    (γ : ℚ) (hγ : γ ≠ 0) :
    Transcendental ℚ (Complex.exp (Complex.I * (γ : ℂ) / ((Real.pi : ℝ) : ℂ))) := by
  have hρ : IsAlgebraic ℚ (((t ^ 2 + Real.pi ^ 2 : ℝ)) : ℂ) := by
    rw [hr, Complex.ofReal_ratCast]
    exact isAlgebraic_ratCast ℚ r
  have h3 := (diaz_number_forces_transcendence t ht he hρ).2.2
  rw [hr, Complex.ofReal_ratCast] at h3
  intro hw
  apply h3
  have hneg : (r : ℂ) / (((Real.pi : ℝ) : ℂ) * Complex.I) =
      -(Complex.I * (r : ℂ) / ((Real.pi : ℝ) : ℂ)) := by
    rw [div_mul_eq_div_div, Complex.div_I]
    ring
  rw [hneg, Complex.exp_neg]
  exact (isAlgebraic_exp_I_mul_div_pi γ hγ hw r).inv

end Diaz
