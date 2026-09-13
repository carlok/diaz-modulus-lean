/-
Mirrored from Prove2Me: `Diaz.period_plane_classification`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.period_plane_classification__1b2f4b75.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.plane_normSq_algebraic_iff

namespace Diaz

open ComplexConjugate

private theorem period_plane_classification_polar2_sub_conj_eq (v : ℂ) : v - conj v = ((2 * v.im : ℝ) : ℂ) * Complex.I := by
  refine Complex.ext ?_ ?_
  · simp
  · simp
    ring

theorem period_plane_classification {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b c : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u
        + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I) : ℝ) : ℂ)
      ↔ (c = -(a * (k : ℚ)) ∨ c = b * (k : ℚ)) := by
  have hkQ : ((k : ℚ)) ≠ 0 := Int.cast_ne_zero.mpr hk
  have hper : (a : ℂ) * u + (b : ℂ) * conj u
      + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I
      = (((a + c / (k : ℚ) : ℚ)) : ℂ) * u + (((b - c / (k : ℚ) : ℚ)) : ℂ) * conj u := by
    have hs : u - conj u = ((2 * ((k : ℝ) * Real.pi) : ℝ) : ℂ) * Complex.I := by
      rw [period_plane_classification_polar2_sub_conj_eq, him]
    have hexp : (((a + c / (k : ℚ) : ℚ)) : ℂ) * u + (((b - c / (k : ℚ) : ℚ)) : ℂ) * conj u
        = (a : ℂ) * u + (b : ℂ) * conj u
          + (((c / (k : ℚ) : ℚ)) : ℂ) * (u - conj u) := by
      push_cast
      ring
    rw [hexp, hs]
    push_cast
    field_simp
  rw [hper, Diaz.plane_normSq_algebraic_iff hk him hn]
  constructor
  · rintro (h | h)
    · left
      have h2 : c / (k : ℚ) = -a := by linarith
      rw [div_eq_iff hkQ] at h2
      linarith
    · right
      have h2 : c / (k : ℚ) = b := by linarith
      rw [div_eq_iff hkQ] at h2
      linarith
  · rintro (h | h)
    · left
      rw [h]
      field_simp
      ring
    · right
      rw [h]
      field_simp
      ring

end Diaz
