import Mathlib

open ComplexConjugate

theorem solution {R : Type*} [CommRing R] (X Y : Matrix (Fin 2) (Fin 2) R) :
    (X + Y).det = X.det + Y.det + Matrix.trace X * Matrix.trace Y - Matrix.trace (X * Y) := by
  simp [Matrix.det_fin_two, Matrix.trace_fin_two, Matrix.mul_apply, Fin.sum_univ_two]
  ring
