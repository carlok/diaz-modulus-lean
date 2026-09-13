/-
Mirrored from Prove2Me: `DiazModulus.diaz_of_exp_not_real_on_axes`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_of_exp_not_real_on_axes__809f9205.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.diaz_on_axes_of_hermite_lindemann
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

theorem diaz_of_exp_not_real_on_axes :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      (u.im = 0 ∨ u.re = 0) → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ hax
  exact diaz_on_axes_of_hermite_lindemann hermite_lindemann_holds u hu hax hmod

end Diaz
