/-
Mirrored from Prove2Me: `DiazModulus.anisotropic_relation_on_circle`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.anisotropic_relation_on_circle__ac5c909f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.pi_transcendental

namespace Diaz

open ComplexConjugate

namespace P14Rel4

/-- `π` is transcendental over `ℚ` as a real number (from the complex statement). -/
theorem anisotropic_relation_on_circle_pi_real_transcendental : Transcendental ℚ Real.pi := by
  have h := pi_transcendental
  rw [← Complex.coe_algebraMap] at h
  exact (transcendental_algebraMap_iff (algebraMap ℝ ℂ).injective).1 h

/-- An algebraic `ρ` is never `π² (2 q² + 1)` with `q` rational. -/
theorem ne_pi_sq_mul (ρ : ℝ) (hρ : IsAlgebraic ℚ ρ) (q : ℚ)
    (h : ρ = Real.pi ^ 2 * (2 * (q : ℝ) ^ 2 + 1)) : False := by
  have hpos : (2 * (q : ℝ) ^ 2 + 1) ≠ 0 := by positivity
  have hpi2 : Real.pi ^ 2 = ρ * (((2 * q ^ 2 + 1)⁻¹ : ℚ) : ℝ) := by
    push_cast
    rw [h]
    field_simp
  have halg : IsAlgebraic ℚ (Real.pi ^ 2) := by
    rw [hpi2]
    exact hρ.mul (isAlgebraic_ratCast ℚ _)
  exact anisotropic_relation_on_circle_pi_real_transcendental (IsAlgebraic.of_pow two_pos halg)

end P14Rel4

open P14Rel4 in
/-- Take `u = x + i y` with `x² = (ρ + π²)/2`, `y² = (ρ - π²)/2`, `x > 0`. Then `|u|² = ρ`,
`Re (u²) = x² - y² = π²`, and `y = q π` would give `ρ = π² (2q² + 1)`, making `π` algebraic. -/
theorem anisotropic_relation_on_circle (ρ : ℝ) (hρ : IsAlgebraic ℚ ρ)
    (hbig : Real.pi ^ 2 < ρ) :
    ∃ u : ℂ, u * conj u = (ρ : ℂ) ∧ u.re ≠ 0 ∧ (∀ q : ℚ, u.im ≠ (q : ℝ) * Real.pi) ∧
      (1 / 2 : ℂ) * u ^ 2 + (1 / 2 : ℂ) * conj u ^ 2 + (((Real.pi : ℝ) : ℂ) * Complex.I) ^ 2 = 0 := by
  have hpi2 : 0 < Real.pi ^ 2 := by positivity
  have h1 : 0 < (ρ + Real.pi ^ 2) / 2 := by linarith
  have h2 : 0 ≤ (ρ - Real.pi ^ 2) / 2 := by linarith
  obtain ⟨x, hx2, hxpos⟩ : ∃ x : ℝ, x ^ 2 = (ρ + Real.pi ^ 2) / 2 ∧ 0 < x :=
    ⟨Real.sqrt ((ρ + Real.pi ^ 2) / 2), Real.sq_sqrt h1.le, Real.sqrt_pos.2 h1⟩
  obtain ⟨y, hy2⟩ : ∃ y : ℝ, y ^ 2 = (ρ - Real.pi ^ 2) / 2 :=
    ⟨Real.sqrt ((ρ - Real.pi ^ 2) / 2), Real.sq_sqrt h2⟩
  have hu : (⟨x, y⟩ : ℂ) = (x : ℂ) + (y : ℂ) * Complex.I := Complex.mk_eq_add_mul_I x y
  have hcu : conj (⟨x, y⟩ : ℂ) = (x : ℂ) - (y : ℂ) * Complex.I := by
    rw [hu, map_add, map_mul, Complex.conj_ofReal, Complex.conj_ofReal, Complex.conj_I]
    ring
  refine ⟨⟨x, y⟩, ?_, ?_, ?_, ?_⟩
  · have hsum : (x : ℂ) ^ 2 + (y : ℂ) ^ 2 = (ρ : ℂ) := by
      have : x ^ 2 + y ^ 2 = ρ := by rw [hx2, hy2]; ring
      exact_mod_cast this
    rw [hcu, hu]
    linear_combination hsum - (y : ℂ) ^ 2 * Complex.I_sq
  · exact hxpos.ne'
  · intro q hq
    change y = (q : ℝ) * Real.pi at hq
    rw [hq] at hy2
    exact ne_pi_sq_mul ρ hρ q (by linear_combination (-2 : ℝ) * hy2)
  · have hxy : (x : ℂ) ^ 2 - (y : ℂ) ^ 2 - ((Real.pi : ℝ) : ℂ) ^ 2 = 0 := by
      have : x ^ 2 - y ^ 2 - Real.pi ^ 2 = 0 := by rw [hx2, hy2]; ring
      exact_mod_cast this
    rw [hcu, hu]
    linear_combination hxy + ((y : ℂ) ^ 2 + ((Real.pi : ℝ) : ℂ) ^ 2) * Complex.I_sq

end Diaz
