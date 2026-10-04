/-
Mirrored from Prove2Me: `DiazModulus.s0_rat_scale_mem`.

Proof by the Prove2Me contributor Nickrobbins95, credited in the README.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.s0_rat_scale_mem__dc870d74.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

set_option autoImplicit false

lemma diazS0_alg_zpow {x : ℂ} (hx : IsAlgebraic ℚ x) (n : ℤ) : IsAlgebraic ℚ (x ^ n) := by
  rcases Int.eq_nat_or_neg n with ⟨m, rfl | rfl⟩
  · rw [zpow_natCast]; exact hx.pow m
  · rw [zpow_neg, zpow_natCast]; exact (hx.pow m).inv

lemma diazS0_exp_qmul (q : ℚ) (w : ℂ) (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp ((q : ℂ) * w)) := by
  have hden : 0 < q.den := q.den_pos
  apply IsAlgebraic.of_pow hden
  have hq : ((q.den : ℂ) * (q : ℂ)) = (q.num : ℂ) := by
    have h := Rat.mul_den_eq_num q
    have h2 : ((q * q.den : ℚ) : ℂ) = ((q.num : ℚ) : ℂ) := by rw [h]
    push_cast at h2
    rw [mul_comm]; exact h2
  rw [← Complex.exp_nat_mul, ← mul_assoc, hq, Complex.exp_int_mul]
  exact diazS0_alg_zpow hw _

theorem s0_rat_scale_mem :
    ∀ (q : ℚ) (γ : ℂ), IsAlgebraic ℚ γ →
      IsAlgebraic ℚ (Complex.exp (γ / (((Real.pi : ℝ) : ℂ) * Complex.I))) →
      IsAlgebraic ℚ (((q : ℚ) : ℂ) * γ) ∧
        IsAlgebraic ℚ (Complex.exp ((((q : ℚ) : ℂ) * γ) / (((Real.pi : ℝ) : ℂ) * Complex.I))) := by
  intro q γ hγ hexp
  refine ⟨?_, ?_⟩
  · have h1 : IsAlgebraic ℚ ((q : ℂ)) := by
      have := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) q
      simpa using this
    exact h1.mul hγ
  · rw [mul_div_assoc]
    exact diazS0_exp_qmul q _ hexp

end Diaz
