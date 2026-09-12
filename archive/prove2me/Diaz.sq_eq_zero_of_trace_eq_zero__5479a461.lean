import Mathlib

open ComplexConjugate

theorem solution {R : Type*} [CommRing R] (M : Matrix (Fin 2) (Fin 2) R)
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
