/-
Mirrored from Prove2Me: `Diaz.Hmat_pencil_normal_form`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.Hmat_pencil_normal_form__a04400b4.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Rigidity

namespace Diaz

open ComplexConjugate
open Diaz

theorem Hmat_pencil_normal_form {u r : ℂ} (hr : r ≠ 0) :
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

end Diaz
