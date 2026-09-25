import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_Schanuel_lindemann_weierstrass

open Complex ComplexConjugate

open DiazModulus in
theorem solution : HermiteLindemann := by
  intro a ha0 ha he
  refine Schanuel.lindemann_weierstrass 2 ![a, 0] ![1, -Complex.exp a] ?_ ?_ ?_ ⟨0, by simp⟩ ?_
  · intro i; fin_cases i
    exacts [ha, isAlgebraic_zero]
  · intro i j; fin_cases i, j <;> simp [ha0, ha0.symm]
  · intro i; fin_cases i
    exacts [isAlgebraic_one, he.neg]
  · simp [Fin.sum_univ_two]

#print axioms solution
