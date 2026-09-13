/-
Mirrored from Prove2Me: `Diaz.equal_real_parts`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.equal_real_parts__a1f145dc.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem equal_real_parts {μ₁ μ₂ : ℂ} {m : ℚ}
    (hre : μ₂.re = μ₁.re)
    (hm : Complex.normSq μ₂ = (m : ℝ) * Complex.normSq μ₁) :
    (1 - (m : ℝ)) * μ₁.re ^ 2 + μ₂.im ^ 2 - (m : ℝ) * μ₁.im ^ 2 = 0
      ∧ (m = 1 → μ₂ = μ₁ ∨ μ₂ = conj μ₁) := by
  simp only [Complex.normSq_apply] at hm
  rw [hre] at hm
  refine ⟨by linear_combination hm, ?_⟩
  intro hm1
  subst hm1
  push_cast at hm
  have hsq : (μ₂.im - μ₁.im) * (μ₂.im + μ₁.im) = 0 := by linear_combination hm
  rcases mul_eq_zero.1 hsq with h | h
  · left; apply Complex.ext hre (by linarith [sub_eq_zero.1 h])
  · right; apply Complex.ext (by simpa using hre) (by simp; linarith)

end Diaz
