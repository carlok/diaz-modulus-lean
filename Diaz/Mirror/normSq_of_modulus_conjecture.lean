/-
Mirrored from Prove2Me: `DiazModulus.normSq_of_modulus_conjecture`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.normSq_of_modulus_conjecture__fde85ba6.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

set_option autoImplicit false

open Complex ComplexConjugate in
theorem normSq_of_modulus_conjecture (hC : DiazModulusConjecture) (u : ℂ)
    (hu : u ≠ 0) (he : IsAlgebraic ℚ (Complex.exp u)) :
    Transcendental ℚ (((u.re ^ 2 + u.im ^ 2 : ℝ)) : ℂ) := by
  intro halg
  have h1 : (((u.re ^ 2 + u.im ^ 2 : ℝ)) : ℂ) = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
    rw [← Complex.ofReal_pow, Complex.sq_norm, Complex.normSq_apply]
    push_cast
    ring
  rw [h1] at halg
  have h2 : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) := halg.of_pow two_pos
  exact hC u hu h2 he

end Diaz
