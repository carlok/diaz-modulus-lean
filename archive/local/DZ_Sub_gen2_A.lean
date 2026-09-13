import Theorems.Thm_DiazModulus_diaz_on_axes_of_hermite_lindemann
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im = 0 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ him
  exact diaz_on_axes_of_hermite_lindemann hermite_lindemann_holds u hu (Or.inl him) hmod
