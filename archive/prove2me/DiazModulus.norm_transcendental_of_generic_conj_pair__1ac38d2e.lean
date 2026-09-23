import Theorems.Thm_DiazModulus_normSq_transcendental_of_generic_conj_pair
import Definitions.Def_DiazModulus

set_option maxRecDepth 100000
set_option maxHeartbeats 400000
set_option linter.all false
open Complex ComplexConjugate

theorem _root_.solution :
    ∀ u : ℂ,
      IsAlgebraic ℚ (Complex.exp u) →
      IsAlgebraic ℚ (Complex.exp ((starRingEnd ℂ) u)) →
      u.re ≠ 0 → u.im ≠ 0 →
      Transcendental ℚ ((u.re : ℝ) : ℂ) →
      Transcendental ℚ ((u.im : ℝ) : ℂ) →
      Transcendental ℚ ((u.re / u.im : ℝ) : ℂ) →
      Transcendental ℚ ((‖u‖ : ℝ) : ℂ) := by
  intro u h1 h2 h3 h4 h5 h6 h7 halg
  have hsq : IsAlgebraic ℚ ((((u.re ^ 2 + u.im ^ 2 : ℝ)) : ℂ)) := by
    have hre : ‖u‖ ^ 2 = u.re ^ 2 + u.im ^ 2 := by
      rw [Complex.sq_norm, Complex.normSq_apply]; ring
    have : ((‖u‖ : ℝ) : ℂ) ^ 2 = (((u.re ^ 2 + u.im ^ 2 : ℝ)) : ℂ) := by
      rw [← Complex.ofReal_pow, hre]
    rw [← this]
    exact halg.pow 2
  exact DiazModulus.normSq_transcendental_of_generic_conj_pair u h1 h2 h3 h4 h5 h6 h7 hsq

#print axioms solution
