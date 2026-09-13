/-
Mirrored from Prove2Me: `Diaz.plane_normSq_algebraic_iff`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.plane_normSq_algebraic_iff__f5aefc43.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.P21P
import Diaz.Mirror.pi_sq_transcendental

namespace Diaz

open ComplexConjugate

private theorem plane_normSq_algebraic_iff_polar2_isAlgebraic_ratCast (q : ℚ) : IsAlgebraic ℚ ((q : ℂ)) := by
  have h := isAlgebraic_algebraMap (R := ℚ) (A := ℂ) q
  rwa [show (algebraMap ℚ ℂ) q = ((q : ℂ)) from rfl] at h

/-- The `c = 0` case of `Diaz.period_plane_norm`. -/
private theorem polar2_normSq_plane (a b : ℝ) (u : ℂ) :
    Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u)
      = (a + b) ^ 2 * Complex.normSq u - 4 * a * b * u.im ^ 2 := by
  have h := Diaz.period_plane_norm u a b 0
  simp only [Complex.ofReal_zero, mul_zero, zero_mul, add_zero, zero_sub] at h
  rw [h]; ring

theorem plane_normSq_algebraic_iff {u : ℂ} {k : ℤ} (hk : k ≠ 0)
    (him : u.im = (k : ℝ) * Real.pi)
    (hn : IsAlgebraic ℚ ((Complex.normSq u : ℝ) : ℂ)) (a b : ℚ) :
    IsAlgebraic ℚ ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ)
      ↔ a = 0 ∨ b = 0 := by
  have hcastA : ((a : ℂ)) = (((a : ℝ) : ℂ)) := by push_cast; ring
  have hcastB : ((b : ℂ)) = (((b : ℝ) : ℂ)) := by push_cast; ring
  have hkeyR : Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u)
      = ((a : ℝ) + (b : ℝ)) ^ 2 * Complex.normSq u
        - 4 * (a : ℝ) * (b : ℝ) * (k : ℝ) ^ 2 * Real.pi ^ 2 := by
    rw [hcastA, hcastB, polar2_normSq_plane, him]
    ring
  have hkey : ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ)
      = ((((a + b) ^ 2 : ℚ)) : ℂ) * ((Complex.normSq u : ℝ) : ℂ)
        - (((4 * a * b * (k : ℚ) ^ 2 : ℚ)) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ) := by
    rw [hkeyR]
    push_cast
    ring
  constructor
  · intro halg
    by_contra hcon
    rw [not_or] at hcon
    obtain ⟨ha, hb⟩ := hcon
    apply pi_sq_transcendental
    set q : ℚ := 4 * a * b * (k : ℚ) ^ 2 with hqdef
    have hq0 : q ≠ 0 := by
      rw [hqdef]
      exact mul_ne_zero (mul_ne_zero (mul_ne_zero (by norm_num) ha) hb)
        (pow_ne_zero 2 (Int.cast_ne_zero.mpr hk))
    have h1 : IsAlgebraic ℚ (((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)) := by
      have hrw : ((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)
          = ((((a + b) ^ 2 : ℚ)) : ℂ) * ((Complex.normSq u : ℝ) : ℂ)
            - ((Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u) : ℝ) : ℂ) := by
        rw [hkey, hqdef]
        ring
      rw [hrw]
      exact IsAlgebraic.sub (IsAlgebraic.mul (plane_normSq_algebraic_iff_polar2_isAlgebraic_ratCast _) hn) halg
    have h2 : ((Real.pi ^ 2 : ℝ) : ℂ)
        = ((q⁻¹ : ℚ) : ℂ) * (((q : ℚ) : ℂ) * ((Real.pi ^ 2 : ℝ) : ℂ)) := by
      rw [← mul_assoc, ← Rat.cast_mul, inv_mul_cancel₀ hq0, Rat.cast_one, one_mul]
    rw [h2]
    exact IsAlgebraic.mul (plane_normSq_algebraic_iff_polar2_isAlgebraic_ratCast _) h1
  · intro h
    have hz : (((4 * a * b * (k : ℚ) ^ 2 : ℚ)) : ℂ) = 0 := by
      rcases h with h | h <;> subst h <;> push_cast <;> ring
    rw [hkey, hz, zero_mul, sub_zero]
    exact IsAlgebraic.mul (plane_normSq_algebraic_iff_polar2_isAlgebraic_ratCast _) hn

end Diaz
