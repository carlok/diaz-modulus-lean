/-
Mirrored from Prove2Me: `DiazModulus.logAlg_conj_stable`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.logAlg_conj_stable__34218734.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

/-- Algebraicity over `ℚ` survives complex conjugation: a rational polynomial killing `z`
has coefficients fixed by `conj`, so it kills `conj z` too. -/
private theorem logAlg_conj_stable_isAlgebraic_conj {z : ℂ} (h : IsAlgebraic ℚ z) :
    IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hpz⟩ := h
  refine ⟨p, hp0, ?_⟩
  have hc := congrArg (starRingEnd ℂ) hpz
  simpa [Polynomial.aeval_def, Polynomial.eval₂_eq_sum, map_sum, Polynomial.sum]
    using hc

theorem logAlg_conj_stable (u : ℂ) (h : u ∈ LogAlg) : conj u ∈ LogAlg := by
  show IsAlgebraic ℚ (Complex.exp (conj u))
  rw [Complex.exp_conj]
  exact logAlg_conj_stable_isAlgebraic_conj h

end Diaz
