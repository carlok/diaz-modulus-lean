/-
Mirrored from Prove2Me: `Diaz.salem_quartic_relations_of_logs`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.salem_quartic_relations_of_logs__6ec0a19a.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.salem_quartic_relations
import Diaz.Mirror.gelfond_schneider

namespace Diaz

/-- Gelfond–Schneider discharges the hypothesis `hGS` of `Diaz.salem_quartic_relations` when `t`
and `s` are logarithms of algebraic numbers: if `s / t` were algebraic and irrational, then
`exp s = exp ((s / t) * t)` would be transcendental. -/
theorem salem_quartic_relations_of_logs {t s : ℂ} (ht : t ≠ 0) (hs : s ≠ 0)
    (htR : t.im = 0) (hsI : s.re = 0)
    (het : IsAlgebraic ℚ (Complex.exp t)) (hes : IsAlgebraic ℚ (Complex.exp s))
    {A B C : ℚ} (h : (A : ℂ) * t ^ 2 + (B : ℂ) * (t * s) + (C : ℂ) * s ^ 2 = 0) :
    A = 0 ∧ B = 0 ∧ C = 0 := by
  refine Diaz.salem_quartic_relations ht hs htR hsI ?_ h
  intro halg
  by_contra hrat
  simp only [not_exists] at hrat
  have hT := GelfondSchneider.gelfond_schneider (s / t) t halg hrat het ht
  rw [div_mul_cancel₀ s ht] at hT
  exact hT hes

end Diaz
