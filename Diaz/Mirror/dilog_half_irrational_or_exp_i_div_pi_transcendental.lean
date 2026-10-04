/-
Mirrored from Prove2Me: `DiazModulus.dilog_half_irrational_or_exp_i_div_pi_transcendental`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.dilog_half_irrational_or_exp_i_div_pi_transcendental__dba5c08c.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.recip_pi_log_of_rational_quadratic_relation

namespace Diaz

open Complex ComplexConjugate

/-- If `π²/12 - (log 2)²/2 = s` is rational, then `-(1/2) (log 2)² + (1/12) π² = s`, and
`recip_pi_log_of_rational_quadratic_relation` applies to `t = log 2`, since `e^{log 2} = 2`. -/
theorem dilog_half_irrational_or_exp_i_div_pi_transcendental :
    Irrational (Real.pi ^ 2 / 12 - Real.log 2 ^ 2 / 2) ∨
      ∀ γ : ℚ, γ ≠ 0 →
        Transcendental ℚ (Complex.exp (Complex.I * (γ : ℂ) / ((Real.pi : ℝ) : ℂ))) := by
  by_cases h : Irrational (Real.pi ^ 2 / 12 - Real.log 2 ^ 2 / 2)
  · exact Or.inl h
  obtain ⟨s, hs⟩ := not_not.mp h
  refine Or.inr fun γ hγ => recip_pi_log_of_rational_quadratic_relation (Real.log 2)
    (Real.log_pos one_lt_two).ne' ?_ (-1 / 2) (1 / 12) s (by norm_num) ?_ γ hγ
  · rw [← Complex.ofReal_exp, Real.exp_log two_pos]
    exact_mod_cast isAlgebraic_natCast (R := ℚ) (A := ℂ) 2
  · rw [hs]
    push_cast
    ring

end Diaz
