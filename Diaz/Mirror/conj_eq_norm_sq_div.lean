/-
Mirrored from Prove2Me: `DiazModulus.conj_eq_norm_sq_div`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.conj_eq_norm_sq_div__0a869173.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

theorem conj_eq_norm_sq_div (u : ℂ) :
    conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 / u := by
  rcases eq_or_ne u 0 with rfl | hu
  · simp
  · rw [eq_div_iff hu, mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]
    push_cast
    ring

end Diaz
