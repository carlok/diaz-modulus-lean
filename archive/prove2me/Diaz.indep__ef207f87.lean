/-
`Diaz.indep` is exactly the composition of two published nodes:
`Diaz.not_on_axes` supplies the two axis exclusions, and
`Diaz.indep_of_not_axis` turns them into ℚ-independence of `t` and `t̄`.
-/
import Mathlib
import Theorems.Thm_Diaz_not_on_axes
import Theorems.Thm_Diaz_indep_of_not_axis

open ComplexConjugate
open Polynomial
variable {K : Subfield ℂ} {t : ℂ}

open Diaz in
theorem solution (hT : Transcendental K t) (hρ : t * conj t ∈ K)
    {a b : ℚ} (h : (a : ℂ) * t + (b : ℂ) * conj t = 0) : a = 0 ∧ b = 0 := by
  obtain ⟨h1, h2⟩ := Diaz.not_on_axes hT hρ
  exact Diaz.indep_of_not_axis h1 h2 h
