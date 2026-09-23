/-
Mirrored from Prove2Me: `DiazModulus.recip_pi_not_log_real_or_imag`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.recip_pi_not_log_real_or_imag__a59889f9.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.recip_pi_log_rational_line

namespace Diaz

open Complex ComplexConjugate

/-- At least one half of `(S)` holds. If both failed, a real exception and a purely imaginary
one would be rationally proportional by the rational-line theorem, so the real one would be
purely imaginary as well, hence zero. -/
theorem recip_pi_not_log_real_or_imag :
    (∀ γ : ℂ, IsAlgebraic ℚ γ → γ ≠ 0 → γ.im = 0 →
      ¬ IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)))) ∨
    (∀ γ : ℂ, IsAlgebraic ℚ γ → γ ≠ 0 → γ.re = 0 →
      ¬ IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I)))) := by
  by_contra h
  simp only [not_or, not_forall, not_not, exists_prop] at h
  obtain ⟨⟨γ₁, a₁, n₁, i₁, e₁⟩, ⟨γ₂, a₂, n₂, r₂, e₂⟩⟩ := h
  obtain ⟨q, hq⟩ := recip_pi_log_rational_line γ₁ γ₂ a₁ a₂ n₂ e₁ e₂
  have hre := congrArg Complex.re hq
  have him := congrArg Complex.im hq
  simp only [Complex.mul_re, Complex.mul_im, Complex.ratCast_re, Complex.ratCast_im,
    zero_mul, sub_zero, add_zero, r₂, mul_zero] at hre him
  exact n₁ (Complex.ext (by simpa using hre) (by simpa using i₁))

end Diaz
