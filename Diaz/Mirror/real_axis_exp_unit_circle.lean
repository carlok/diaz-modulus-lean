/-
Mirrored from Prove2Me: `DiazModulus.real_axis_exp_unit_circle`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.real_axis_exp_unit_circle__b18a2d59.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

theorem real_axis_exp_unit_circle :
    ∀ γ : ℂ, γ.im = 0 →
      ‖Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))‖ = 1 := by
  intro γ hγ
  have hre : (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)).re = 0 := by
    simp [Complex.div_re, hγ]
  rw [Complex.norm_exp, hre, Real.exp_zero]

end Diaz
