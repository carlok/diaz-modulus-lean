import Definitions.Def_DiazModulus
import Theorems.Thm_Diaz_algebraic_of_axis

open Complex ComplexConjugate

private theorem dzb_alg_ofReal {x : ℝ} : IsAlgebraic ℚ ((x : ℂ)) ↔ IsAlgebraic ℚ x :=
  isAlgebraic_algebraMap_iff (A := ℂ) (S := ℝ) (R := ℚ) Complex.ofReal_injective

open DiazModulus in
theorem solution (hHL : HermiteLindemann) (u : ℂ) (hu : u ≠ 0)
    (hax : u.im = 0 ∨ u.re = 0) (hmod : IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ)) :
    Transcendental ℚ (Complex.exp u) := by
  have hcu : conj u = u ∨ conj u = -u := by
    rcases hax with h | h
    · exact Or.inl (Complex.conj_eq_iff_im.mpr h)
    · exact Or.inr (by apply Complex.ext <;> simp [h])
  exact hHL u hu (Diaz.algebraic_of_axis hcu (dzb_alg_ofReal.mp hmod))

#print axioms solution
