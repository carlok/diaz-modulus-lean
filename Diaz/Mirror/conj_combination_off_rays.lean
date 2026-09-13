/-
Mirrored from Prove2Me: `Diaz.conj_combination_off_rays`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.conj_combination_off_rays__3484bf5b.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

set_option autoImplicit false
open ComplexConjugate

theorem conj_combination_off_rays {u : ℂ}
    (h1 : conj u ≠ u) (h2 : conj u ≠ -u)
    {a b : ℚ} (ha : a ≠ 0) (hb : b ≠ 0) :
    (∀ c : ℚ, (a : ℂ) * u + (b : ℂ) * conj u ≠ (c : ℂ) * u) ∧
      (∀ c : ℚ, (a : ℂ) * u + (b : ℂ) * conj u ≠ (c : ℂ) * conj u) := by
  have hre : u.re ≠ 0 := by
    intro h
    apply h2
    apply Complex.ext <;> simp [h]
  have him : u.im ≠ 0 := by
    intro h
    apply h1
    apply Complex.ext <;> simp [h]
  have ha' : (a : ℝ) ≠ 0 := by exact_mod_cast ha
  have hb' : (b : ℝ) ≠ 0 := by exact_mod_cast hb
  constructor
  · intro c h
    have hr := congrArg Complex.re h
    have hi := congrArg Complex.im h
    simp at hr hi
    have heqr : (a : ℝ) + b = c := mul_right_cancel₀ hre (by nlinarith [hr])
    have heqi : (a : ℝ) - b = c := mul_right_cancel₀ him (by nlinarith [hi])
    exact hb' (by linarith)
  · intro c h
    have hr := congrArg Complex.re h
    have hi := congrArg Complex.im h
    simp at hr hi
    have heqr : (a : ℝ) + b = c := mul_right_cancel₀ hre (by nlinarith [hr])
    have heqi : (a : ℝ) - b = -c := mul_right_cancel₀ him (by nlinarith [hi])
    exact ha' (by linarith)

end Diaz
