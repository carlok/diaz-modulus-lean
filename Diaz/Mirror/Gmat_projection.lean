/-
Mirrored from Prove2Me: `Diaz.Gmat_projection`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.Gmat_projection__5598669d.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open ComplexConjugate

theorem Gmat_projection {u r : ℂ} (x y : ℝ) (hu : u = (x : ℂ) + (y : ℂ) * Complex.I)
    (hr : r ≠ 0) (h : u * conj u = r ^ 2) :
    (!![r + (x : ℂ), -(y : ℂ); -(y : ℂ), r - (x : ℂ)]).det = 0
      ∧ Matrix.trace (!![r + (x : ℂ), -(y : ℂ); -(y : ℂ), r - (x : ℂ)]) = 2 * r
      ∧ ((2 * r)⁻¹ • (!![r + (x : ℂ), -(y : ℂ); -(y : ℂ), r - (x : ℂ)]))
          * ((2 * r)⁻¹ • (!![r + (x : ℂ), -(y : ℂ); -(y : ℂ), r - (x : ℂ)]))
        = (2 * r)⁻¹ • (!![r + (x : ℂ), -(y : ℂ); -(y : ℂ), r - (x : ℂ)]) := by
  have hc : conj u = (x : ℂ) - (y : ℂ) * Complex.I := by
    rw [hu]; simp <;> ring
  have hx : (x : ℂ) ^ 2 + (y : ℂ) ^ 2 = r ^ 2 := by
    rw [hc, hu] at h
    linear_combination h + ((y : ℂ) ^ 2) * Complex.I_sq
  refine ⟨?_, ?_, ?_⟩
  · rw [Matrix.det_fin_two]
    simp only [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.of_apply]
    linear_combination -hx
  · rw [Matrix.trace_fin_two]
    simp only [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.of_apply]
    ring
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.smul_apply, smul_eq_mul,
        Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
        Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.of_apply,
        Fin.zero_eta, Fin.mk_one, Fin.isValue] <;>
      field_simp <;> ring_nf <;> linear_combination hx

end Diaz
