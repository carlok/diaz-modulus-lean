import Mathlib
import Definitions.Def_Diaz_Rigidity

open ComplexConjugate
open Diaz

open Diaz in
theorem solution {u r : ℂ} (hr : r ≠ 0) :
    !![0, r; r, 0] *
        ((1 : Matrix (Fin 2) (Fin 2) ℂ) + u • !![0, 0; r⁻¹, 0] + (conj u) • !![0, r⁻¹; 0, 0])
        = Hmat u r
      ∧ (!![0, 0; r⁻¹, 0] : Matrix (Fin 2) (Fin 2) ℂ) * !![0, 0; r⁻¹, 0] = 0
      ∧ (!![0, r⁻¹; 0, 0] : Matrix (Fin 2) (Fin 2) ℂ) * !![0, r⁻¹; 0, 0] = 0
      ∧ Matrix.trace ((!![0, 0; r⁻¹, 0] : Matrix (Fin 2) (Fin 2) ℂ) * !![0, r⁻¹; 0, 0])
          = (r ^ 2)⁻¹ := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp [Hmat, Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply] <;> field_simp
  · ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]
  · ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]
  · rw [Matrix.trace_fin_two]
    simp [Matrix.mul_apply, Fin.sum_univ_two]
    field_simp
