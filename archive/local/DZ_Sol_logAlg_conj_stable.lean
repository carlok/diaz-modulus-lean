import Definitions.Def_DiazModulus

open Complex ComplexConjugate

/-- Algebraicity over `ℚ` survives complex conjugation: a rational polynomial killing `z`
has coefficients fixed by `conj`, so it kills `conj z` too. -/
private theorem isAlgebraic_conj {z : ℂ} (h : IsAlgebraic ℚ z) :
    IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hpz⟩ := h
  refine ⟨p, hp0, ?_⟩
  have hc := congrArg (starRingEnd ℂ) hpz
  simpa [Polynomial.aeval_def, Polynomial.eval₂_eq_sum, map_sum, Polynomial.sum]
    using hc

open DiazModulus in
theorem solution (u : ℂ) (h : u ∈ LogAlg) : conj u ∈ LogAlg := by
  show IsAlgebraic ℚ (Complex.exp (conj u))
  rw [Complex.exp_conj]
  exact isAlgebraic_conj h
