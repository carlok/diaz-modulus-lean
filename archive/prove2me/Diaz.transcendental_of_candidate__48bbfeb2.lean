import Mathlib
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

section
open ComplexConjugate
variable (K : Subfield ℂ) (u : ℂ)
variable {K u}

theorem solution (hu : u ≠ 0)
    (hexp : IsAlgebraic ℚ (Complex.exp u)) : Transcendental ℚ u :=
  fun halg => DiazModulus.hermite_lindemann_holds u hu halg hexp
end
