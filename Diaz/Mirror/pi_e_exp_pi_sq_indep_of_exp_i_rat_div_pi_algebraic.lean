/-
Mirrored from Prove2Me: `DiazModulus.pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi_algebraic`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi_algebraic__1b2650ea.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.two_algebraically_independent_of_exp_column
import Diaz.Mirror.pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi

namespace Diaz

/-!
# Two of `π`, `e`, `e^{π²}` are algebraically independent when `e^{ir/π}` is algebraic

`pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi` proves this under the hypothesis `hW73`,
Waldschmidt's theorem of 1973. `two_algebraically_independent_of_exp_column` is that
theorem, stated as exactly the proposition `hW73`, so it discharges the hypothesis.
-/

theorem pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi_algebraic
    (r : ℚ) (hr : r ≠ 0)
    (halg : IsAlgebraic ℚ (Complex.exp (Complex.I * (r : ℂ) / ((Real.pi : ℝ) : ℂ)))) :
    ∃ a ∈ ({((Real.pi : ℝ) : ℂ), Complex.exp 1, Complex.exp (((Real.pi : ℝ) : ℂ) ^ 2)} : Set ℂ),
      ∃ b ∈ ({((Real.pi : ℝ) : ℂ), Complex.exp 1, Complex.exp (((Real.pi : ℝ) : ℂ) ^ 2)} : Set ℂ),
        AlgebraicIndependent ℚ ![a, b] := by
  exact pi_e_exp_pi_sq_indep_of_exp_i_rat_div_pi
    two_algebraically_independent_of_exp_column r hr halg

end Diaz
