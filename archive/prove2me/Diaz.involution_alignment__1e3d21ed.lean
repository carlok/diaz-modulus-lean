import Mathlib
import Definitions.Def_Diaz_Closure
import Definitions.Def_Diaz_Instantiation

open ComplexConjugate
open Diaz

theorem solution {R : Type*} [Field R] (σ : R →+* R) (hσ : ∀ x, σ (σ x) = x)
    {u c : R} (hu : u ≠ 0) (hc : σ c = c) (h : σ u = c * u) :
    c = 1 ∨ c = -1 := by
  have h2 : u = c * (c * u) := by
    conv_lhs => rw [← hσ u]
    rw [h, map_mul, hc, h]
  have hc2 : (c - 1) * (c + 1) * u = 0 := by linear_combination -h2
  rcases mul_eq_zero.1 hc2 with h3 | h3
  · rcases mul_eq_zero.1 h3 with h4 | h4
    · left; linear_combination h4
    · right; linear_combination h4
  · exact absurd h3 hu
