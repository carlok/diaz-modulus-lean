/-
Mirrored from Prove2Me: `DiazModulus.real_axis_root_of_unity_implies_pi_sq_rat`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.real_axis_root_of_unity_implies_pi_sq_rat__9ffb6c19.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

theorem real_axis_root_of_unity_implies_pi_sq_rat :
    ∀ γ : ℂ, γ.im = 0 →
      IsOfFinOrder (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) →
      ∃ q : ℚ, γ = (((q : ℚ)) : ℂ) * ((((Real.pi ^ 2 : ℝ))) : ℂ) := by
  intro γ _ hfin
  obtain ⟨n, hn, hpow⟩ := (isOfFinOrder_iff_pow_eq_one).1 hfin
  rw [← Complex.exp_nat_mul, Complex.exp_eq_one_iff] at hpow
  obtain ⟨k, hk⟩ := hpow
  have hpi : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  have hn' : (n : ℂ) ≠ 0 := by exact_mod_cast hn.ne'
  refine ⟨-2 * k / n, ?_⟩
  have hγ : γ = (k * (2 * ((Real.pi : ℝ) : ℂ) * Complex.I)) / n * (((Real.pi : ℝ) : ℂ) * Complex.I) := by
    rw [← hk]; field_simp
  rw [hγ]
  push_cast
  field_simp
  ring_nf
  rw [Complex.I_sq]
  ring

end Diaz
