import Mathlib


section
open ComplexConjugate
open Polynomial
variable {K : Subfield ℂ} {t : ℂ}

theorem solution (t : ℂ) (a b : ℚ) :
    conj ((a : ℂ) * t + (b : ℂ) * conj t) = (b : ℂ) * t + (a : ℂ) * conj t := by
  simp only [map_add, map_mul, Complex.conj_conj, map_ratCast]
  ring
end
