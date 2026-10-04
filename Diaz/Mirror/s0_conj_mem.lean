/-
Mirrored from Prove2Me: `DiazModulus.s0_conj_mem`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.s0_conj_mem__b35dac39.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

theorem dm1afabb12_conj_alg {x : ℂ} (h : IsAlgebraic ℚ x) : IsAlgebraic ℚ (starRingEnd ℂ x) :=
  h.algHom (starRingEnd ℂ).toRatAlgHom

theorem dm1afabb12_key (γ : ℂ) :
    Complex.exp ((starRingEnd ℂ γ) / (((Real.pi : ℝ) : ℂ) * Complex.I)) =
      (starRingEnd ℂ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))))⁻¹ := by
  rw [← Complex.exp_conj, ← Complex.exp_neg, map_div₀, map_mul, Complex.conj_ofReal,
    Complex.conj_I]
  congr 1
  rw [mul_neg, div_neg, neg_neg]

theorem s0_conj_mem :
    ∀ γ : ℂ, IsAlgebraic ℚ γ →
      IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) →
      IsAlgebraic ℚ (starRingEnd ℂ γ) ∧
        IsAlgebraic ℚ (Complex.exp ((starRingEnd ℂ γ) / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  intro γ hγ he
  refine ⟨dm1afabb12_conj_alg hγ, ?_⟩
  rw [dm1afabb12_key]
  exact (dm1afabb12_conj_alg he).inv

end Diaz
