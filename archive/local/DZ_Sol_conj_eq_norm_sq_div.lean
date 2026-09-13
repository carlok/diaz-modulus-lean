import Definitions.Def_DiazModulus

open Complex ComplexConjugate

open DiazModulus in
theorem solution (u : ℂ) :
    conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 / u := by
  rcases eq_or_ne u 0 with rfl | hu
  · simp
  · rw [eq_div_iff hu, mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]
    push_cast
    ring
