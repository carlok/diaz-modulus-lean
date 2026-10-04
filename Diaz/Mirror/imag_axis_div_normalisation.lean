/-
Mirrored from Prove2Me: `DiazModulus.imag_axis_div_normalisation`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.imag_axis_div_normalisation__247dcd4a.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

theorem imag_axis_div_normalisation :
    ∀ γ : ℂ, γ.re = 0 →
      γ / (((Real.pi : ℝ) : ℂ) * Complex.I) = ((((γ.im / Real.pi : ℝ))) : ℂ) := by
  intro γ hγ
  have hpi : ((Real.pi : ℝ) : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  have hI : Complex.I ≠ 0 := Complex.I_ne_zero
  rw [div_eq_iff (mul_ne_zero hpi hI)]
  apply Complex.ext
  · simp [hγ]
  · simp

end Diaz
