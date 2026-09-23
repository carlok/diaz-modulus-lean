import Mathlib
import Theorems.Thm_DiazModulus_six_exponentials

-- The statement is word for word `DiazModulus.six_exponentials`, Proved on this platform
-- (Lang–Ramachandra's six exponentials theorem, formalised in the Diaz mission).
theorem solution (x : Fin 2 → ℂ) (y : Fin 3 → ℂ)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℚ y) :
    ∃ i j, Transcendental ℚ (Complex.exp (x i * y j)) :=
  DiazModulus.six_exponentials x y hx hy

#print axioms solution
