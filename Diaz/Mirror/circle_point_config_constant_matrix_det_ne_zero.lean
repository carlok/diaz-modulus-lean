/-
Mirrored from Prove2Me: `DiazModulus.circle_point_config_constant_matrix_det_ne_zero`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.circle_point_config_constant_matrix_det_ne_zero__34ba373f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.generic_circle_point_config_is_two_by_two
import Diaz.Mirror.circle_point_two_by_two_normal_form

namespace Diaz

open Complex ComplexConjugate

/-!
# The constant part of a generic `2 × 2` configuration is invertible

Assume `u, w₁, …, w_m` algebraically independent over `K` and `ρ = u ū ∈ K`. By
`generic_circle_point_config_is_two_by_two` (with `p = q = 2`) every product `x i y j` lies in
`K + Ku + Kū`; `u` is transcendental over `K`. The normal form
`circle_point_two_by_two_normal_form` gives `μ ≠ 0` and invertible `P, Q` over `K` with
`x i = μ (P i 0 + P i 1 u)` and `y j = μ⁻¹ (Q 0 j + Q 1 j ū)`. Expanding with `u ū = ρ`,
`x i y j = c i j + P i 1 Q 0 j u + P i 0 Q 1 j ū` where `c = P · diag(1, ρ) · Q`, and
`det c = ρ · det P · det Q ≠ 0` since `ρ ≠ 0` (as `u ≠ 0`).
-/

namespace R6_circleConst

theorem circle_point_config_constant_matrix_det_ne_zero_smul_eq {K : Subfield ℂ} (c : K) (z : ℂ) : c • z = (c : ℂ) * z := rfl

end R6_circleConst

open R6_circleConst in
theorem circle_point_config_constant_matrix_det_ne_zero (K : Subfield ℂ) (u : ℂ)
    (hρ : u * conj u ∈ K) (m : ℕ) (w : Fin m → ℂ)
    (hgen : AlgebraicIndependent K (Fin.cons u w : Fin (m + 1) → ℂ))
    (x y : Fin 2 → ℂ) (hx : LinearIndependent K x) (hy : LinearIndependent K y)
    (hxy : ∀ i j, x i * y j ∈ Submodule.span K (({1, u, conj u} : Set ℂ) ∪ Set.range w)) :
    ∃ c : Matrix (Fin 2) (Fin 2) K, c.det ≠ 0 ∧
      ∀ i j, x i * y j - (c i j : ℂ) ∈ Submodule.span K ({u, conj u} : Set ℂ) := by
  have hT : Transcendental K u := by simpa using hgen.transcendental 0
  have hu : u ≠ 0 := by
    rintro rfl
    exact hT isAlgebraic_zero
  obtain ⟨-, -, hH⟩ := generic_circle_point_config_is_two_by_two K u hρ m w hgen
    2 2 le_rfl le_rfl x y hx hy hxy
  obtain ⟨μ, P, Q, hμ, hP, hQ, hxP, hyQ⟩ :=
    (circle_point_two_by_two_normal_form K u hT hρ x y).1 ⟨hx, hy, hH⟩
  set ρK : K := ⟨u * conj u, hρ⟩
  have hρK : (ρK : ℂ) = u * conj u := rfl
  have hρ0 : ρK ≠ 0 := by
    intro h0
    have := congrArg Subtype.val h0
    simp only [ZeroMemClass.coe_zero] at this
    exact mul_ne_zero hu ((_root_.map_ne_zero _).mpr hu) this
  refine ⟨P * Matrix.diagonal ![1, ρK] * Q, ?_, fun i j => ?_⟩
  · rw [Matrix.det_mul, Matrix.det_mul, Matrix.det_diagonal, Fin.prod_univ_two]
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one, one_mul]
    exact mul_ne_zero (mul_ne_zero hP hρ0) hQ
  · have hμμ : μ * μ⁻¹ = 1 := mul_inv_cancel₀ hμ
    have : x i * y j - ((P * Matrix.diagonal ![1, ρK] * Q) i j : ℂ) =
        (P i 1 * Q 0 j) • u + (P i 0 * Q 1 j) • conj u := by
      have hc : (P * Matrix.diagonal ![1, ρK] * Q) i j = P i 0 * Q 0 j + P i 1 * ρK * Q 1 j := by
        simp [Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal]
      rw [hc, circle_point_config_constant_matrix_det_ne_zero_smul_eq, circle_point_config_constant_matrix_det_ne_zero_smul_eq]
      push_cast
      rw [hxP, hyQ, hρK]
      linear_combination ((P i 0 + P i 1 * u : ℂ) * (Q 0 j + Q 1 j * conj u)) * hμμ
    rw [this]
    exact add_mem (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))

end Diaz
