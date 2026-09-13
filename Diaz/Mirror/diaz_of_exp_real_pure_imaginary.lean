/-
Mirrored from Prove2Me: `DiazModulus.diaz_of_exp_real_pure_imaginary`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_of_exp_real_pure_imaginary__0040c771.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.diaz_on_axes_of_hermite_lindemann
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

theorem diaz_of_exp_real_pure_imaginary :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Complex.exp u ≠ 1 → u.re = 0 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ _ _ hre
  exact diaz_on_axes_of_hermite_lindemann hermite_lindemann_holds u hu (Or.inr hre) hmod

end Diaz
