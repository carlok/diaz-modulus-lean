import Theorems.Thm_DiazModulus_diaz_on_axes_of_hermite_lindemann
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

namespace DiazModulus

-- Child A: u itself real. Should be closable now.
theorem gen2_A :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 → u.im = 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ him
  exact diaz_on_axes_of_hermite_lindemann hermite_lindemann_holds u hu (Or.inl him) hmod

-- Child B: u not real. Open.
theorem gen2_B :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 → u.im ≠ 0 →
      Transcendental ℚ (Complex.exp u) := by
  sorry

-- The reduction to the parent `diaz_of_exp_real`.
theorem gen2_reduction :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hexpim
  by_cases h : u.im = 0
  · exact gen2_A u hu hmod hexpim h
  · exact gen2_B u hu hmod hexpim h

end DiazModulus
