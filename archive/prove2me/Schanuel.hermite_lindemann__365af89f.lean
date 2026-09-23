import Mathlib
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

-- `DiazModulus.hermite_lindemann_holds : HermiteLindemann`, Proved on this platform, is this
-- statement with the definition `HermiteLindemann` folded and the two hypotheses swapped.
theorem solution (a : ℂ) (ha : IsAlgebraic ℚ a) (ha0 : a ≠ 0) :
    Transcendental ℚ (Complex.exp a) :=
  DiazModulus.hermite_lindemann_holds a ha0 ha

#print axioms solution
