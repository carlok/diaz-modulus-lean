/-
Mirrored from Prove2Me: `DiazModulus.s0_add_mem`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.s0_add_mem__26b82825.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

theorem s0_add_mem :
    ∀ γ₁ γ₂ : ℂ, IsAlgebraic ℚ γ₁ →
      IsAlgebraic ℚ (Complex.exp (γ₁ / (((Real.pi : ℝ) : ℂ) * Complex.I))) →
      IsAlgebraic ℚ γ₂ →
      IsAlgebraic ℚ (Complex.exp (γ₂ / (((Real.pi : ℝ) : ℂ) * Complex.I))) →
      IsAlgebraic ℚ (γ₁ + γ₂) ∧
        IsAlgebraic ℚ (Complex.exp ((γ₁ + γ₂) / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  intro γ₁ γ₂ h1 he1 h2 he2
  refine ⟨h1.add h2, ?_⟩
  rw [add_div, Complex.exp_add]
  exact he1.mul he2

end Diaz
