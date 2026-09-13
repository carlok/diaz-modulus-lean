import Theorems.Thm_DiazModulus_diaz_on_axes_of_hermite_lindemann
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

namespace DiazModulus

theorem gen5_A :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      (u.im = 0 ∨ u.re = 0) → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ hax
  exact diaz_on_axes_of_hermite_lindemann hermite_lindemann_holds u hu hax hmod

theorem gen5_B :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → Transcendental ℚ (Complex.exp u) := by
  sorry

theorem gen5_reduction :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hne
  by_cases h : (u.im = 0 ∨ u.re = 0)
  · exact gen5_A u hu hmod hne h
  · exact gen5_B u hu hmod hne h

end DiazModulus
