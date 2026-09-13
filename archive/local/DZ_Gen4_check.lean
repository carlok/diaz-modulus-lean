import Theorems.Thm_DiazModulus_diaz_on_axes_of_hermite_lindemann
import Theorems.Thm_DiazModulus_hermite_lindemann_holds

open Complex ComplexConjugate

namespace DiazModulus

-- Child A: u purely imaginary. Should close from diaz_on_axes directly.
theorem gen4_A :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Complex.exp u ≠ 1 → u.re = 0 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ _ _ hre
  exact diaz_on_axes_of_hermite_lindemann hermite_lindemann_holds u hu (Or.inr hre) hmod

-- Child B: u has both parts non-zero. The genuinely open core.
theorem gen4_B :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Complex.exp u ≠ 1 → u.re ≠ 0 → Transcendental ℚ (Complex.exp u) := by
  sorry

theorem gen4_reduction :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 →
      u.im ≠ 0 → Complex.exp u ≠ 1 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod hre him h1
  by_cases h : u.re = 0
  · exact gen4_A u hu hmod hre him h1 h
  · exact gen4_B u hu hmod hre him h1 h

end DiazModulus
