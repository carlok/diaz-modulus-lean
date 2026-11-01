/-
Mirrored from Prove2Me: `DiazModulus.exp_mul_or_exp_sq_mul_transcendental`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exp_mul_or_exp_sq_mul_transcendental__a09a6ab6.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.HermiteLindemann
import Diaz.Mirror.five_exponentials

namespace Diaz

open Complex ComplexConjugate

/-! # DALAG Exercise 11.8 (b)

Apply the five exponentials theorem to `x = (1, βλ₀)`, `y = (λ₁, βλ₀λ₁)` and `η = β⁻¹`. The five
exponentials are `e^{λ₁}`, `e^{βλ₀λ₁}` (twice), `e^{(βλ₀)²λ₁}` and `e^{η βλ₀} = e^{λ₀}`, so
`e^{βλ₀λ₁}` and `e^{(βλ₀)²λ₁}` cannot both be algebraic.

Both `x` and `y = λ₁ x` are `ℚ`-independent: `βλ₀ = q ∈ ℚ` would make `λ₀ = q / β` a nonzero algebraic
number with `e^{λ₀}` algebraic, against Hermite–Lindemann. -/

theorem exp_mul_or_exp_sq_mul_transcendental :
    ∀ l₀ l₁ β : ℂ, l₀ ∈ LogAlg → l₁ ∈ LogAlg → l₀ ≠ 0 → l₁ ≠ 0 →
      IsAlgebraic ℚ β → β ≠ 0 →
      Transcendental ℚ (Complex.exp (β * l₀ * l₁)) ∨
        Transcendental ℚ (Complex.exp ((β * l₀) ^ 2 * l₁)) := by
  intro l₀ l₁ β h₀ h₁ hl₀ hl₁ hβ hβ0
  by_contra hcon
  rw [not_or, Transcendental, Transcendental, not_not, not_not] at hcon
  -- `β λ₀` is not rational
  have hirr : ∀ q : ℚ, (q : ℂ) ≠ β * l₀ := by
    intro q hq
    have : l₀ ∈ Qbar := by
      rw [show l₀ = q / β by field_simp; rw [hq]; ring]
      exact div_mem (SubfieldClass.ratCast_mem Qbar q) (mem_Qbar_iff.mpr hβ)
    exact hermite_lindemann_holds l₀ hl₀ (mem_Qbar_iff.mp this) h₀
  have hx : LinearIndependent ℚ ![(1 : ℂ), β * l₀] := by
    rw [LinearIndependent.pair_iff' one_ne_zero]
    intro q hq
    exact hirr q (by simpa [Rat.smul_def] using hq)
  have hy : LinearIndependent ℚ ![l₁, β * l₀ * l₁] := by
    rw [LinearIndependent.pair_iff' hl₁]
    intro q hq
    refine hirr q (mul_right_cancel₀ hl₁ ?_)
    simpa [Rat.smul_def] using hq
  refine five_exponentials ![1, β * l₀] ![l₁, β * l₀ * l₁] β⁻¹ hx hy
    (mem_Qbar_iff.mp (inv_mem (mem_Qbar_iff.mpr hβ))) (inv_ne_zero hβ0) ⟨?_, ?_⟩
  · intro i j
    fin_cases i <;> fin_cases j <;> simp only [Fin.zero_eta, Fin.mk_one, Fin.isValue,
      Matrix.cons_val_zero, Matrix.cons_val_one, one_mul]
    · exact h₁
    · exact hcon.1
    · exact hcon.1
    · rw [show β * l₀ * (β * l₀ * l₁) = (β * l₀) ^ 2 * l₁ by ring]; exact hcon.2
  · simp only [Matrix.cons_val_zero, Matrix.cons_val_one]
    rw [show β⁻¹ * (β * l₀) / 1 = l₀ by field_simp]
    exact h₀

end Diaz
