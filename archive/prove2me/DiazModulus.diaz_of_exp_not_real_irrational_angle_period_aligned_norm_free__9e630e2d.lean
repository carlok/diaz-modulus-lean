import Mathlib
import Definitions.Def_DiazModulus
import Theorems.Thm_DiazModulus_recip_pi_log_of_period_aligned
import Theorems.Thm_DiazModulus_recip_pi_not_log

open Complex ComplexConjugate

-- The norm-free half is not an independent difficulty. Its distinguishing hypothesis --
-- that the square of the modulus is NOT a rational multiple of the aligned datum -- is
-- carried and never used. The proof is the period-aligned route lemma composed with (S):
-- the route produces an algebraic gamma /= 0 with exp(gamma/(i*pi)) algebraic, and (S) says
-- no such gamma exists. Everything else in the statement goes unused too.

open DiazModulus in
theorem solution :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im ≠ 0 →
      ¬ (u.im = 0 ∨ u.re = 0) → (¬ ∃ q : ℚ, u.im = (q : ℝ) * Real.pi) →
      (∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ)) →
      (¬ ∃ r : ℚ, r ≠ 0 ∧
        IsAlgebraic ℚ ((Real.pi * (u.im + (r : ℝ) * Real.pi) : ℝ) : ℂ) ∧
        ∃ c : ℚ, (‖u‖ : ℝ) ^ 2 = (c : ℝ) * (Real.pi * (u.im + (r : ℝ) * Real.pi))) →
      Transcendental ℚ (Complex.exp u) := by
  intro u _hu _hnorm _him _hoff htheta haligned _hfree
  show ¬ IsAlgebraic ℚ (Complex.exp u)
  by_contra hcon
  obtain ⟨γ, hγ, hγ0, hγexp⟩ :=
    DiazModulus.recip_pi_log_of_period_aligned u htheta haligned hcon
  exact (DiazModulus.recip_pi_not_log γ hγ hγ0) hγexp
