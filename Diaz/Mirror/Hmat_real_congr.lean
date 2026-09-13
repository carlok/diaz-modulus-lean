/-
Mirrored from Prove2Me: `Diaz.Hmat_real_congr`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.Hmat_real_congr__9fc9018a.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Rigidity

namespace Diaz

open ComplexConjugate
open Diaz

theorem Hmat_real_congr (u r : ℂ) (x y : ℝ) (hu : u = (x : ℂ) + (y : ℂ) * Complex.I) :
    Matrix.transpose (((Real.sqrt 2 : ℝ) : ℂ)⁻¹ • !![1, Complex.I; 1, -Complex.I]) *
        Hmat u r * (((Real.sqrt 2 : ℝ) : ℂ)⁻¹ • !![1, Complex.I; 1, -Complex.I])
      = !![r + (x : ℂ), -(y : ℂ); -(y : ℂ), r - (x : ℂ)] := by
  have h2 : ((Real.sqrt 2 : ℝ) : ℂ) * ((Real.sqrt 2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num : (0:ℝ) ≤ 2)]
    norm_num
  have hhalf : ((Real.sqrt 2 : ℝ) : ℂ)⁻¹ * ((Real.sqrt 2 : ℝ) : ℂ)⁻¹ = 2⁻¹ := by
    rw [← mul_inv, h2]
  have hc : conj u = (x : ℂ) - (y : ℂ) * Complex.I := by
    rw [hu]
    simp [Complex.ext_iff]
  simp only [Matrix.transpose_smul, Matrix.smul_mul, Matrix.mul_smul, smul_smul, hhalf]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp only [Hmat, Matrix.smul_apply, smul_eq_mul, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.transpose_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one,
      Matrix.head_fin_const, Fin.zero_eta, Fin.mk_one, Fin.isValue, hu, map_add, map_mul,
      Complex.conj_ofReal, Complex.conj_I] <;>
    field_simp <;> ring_nf <;> rw [Complex.I_sq] <;> ring

end Diaz
