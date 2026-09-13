import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

private theorem I_alg : IsAlgebraic ℚ Complex.I := by
  refine ⟨Polynomial.X ^ 2 + 1, ?_, ?_⟩
  · intro h
    have := congrArg (Polynomial.coeff · 0) h
    simp at this
  · simp [Polynomial.aeval_def, Complex.I_sq]

open DiazModulus in
theorem solution : Transcendental ℚ (Complex.exp Complex.I) :=
  hermite_lindemann_holds Complex.I Complex.I_ne_zero I_alg
