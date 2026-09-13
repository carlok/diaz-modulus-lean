/-
Mirrored from Prove2Me: `Diaz.sq_eq_zero_of_trace_eq_zero`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.sq_eq_zero_of_trace_eq_zero__5479a461.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open ComplexConjugate

theorem sq_eq_zero_of_trace_eq_zero {R : Type*} [CommRing R] (M : Matrix (Fin 2) (Fin 2) R)
    (htr : Matrix.trace M = 0) (hdet : M.det = 0) : M * M = 0 := by
  rw [Matrix.trace_fin_two] at htr
  rw [Matrix.det_fin_two] at hdet
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.zero_apply, Fin.zero_eta, Fin.mk_one,
      Fin.isValue]
  · linear_combination M 0 0 * htr - hdet
  · linear_combination M 0 1 * htr
  · linear_combination M 1 0 * htr
  · linear_combination M 1 1 * htr - hdet

end Diaz
