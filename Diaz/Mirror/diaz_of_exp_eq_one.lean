/-
Mirrored from Prove2Me: `DiazModulus.diaz_of_exp_eq_one`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_of_exp_eq_one__83e1823c.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.pi_transcendental

namespace Diaz

open Complex ComplexConjugate

theorem diaz_of_exp_eq_one :
    ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → (Complex.exp u).im = 0 → u.im ≠ 0 →
      Complex.exp u = 1 → Transcendental ℚ (Complex.exp u) := by
  intro u hu hmod _ _ h1
  exfalso
  obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp h1
  have hn0 : (n : ℂ) ≠ 0 := by
    intro h
    exact hu (by rw [hn, h, zero_mul])
  have hnR : |(n : ℝ)| ≠ 0 := by
    simpa using (by exact_mod_cast hn0 : (n : ℝ) ≠ 0)
  have hnorm : (‖u‖ : ℝ) = |(n : ℝ)| * (2 * Real.pi) := by
    rw [hn, norm_mul, norm_mul, norm_mul]
    simp [Complex.norm_I, abs_of_nonneg Real.pi_pos.le]
  have hpi : ((Real.pi : ℝ) : ℂ) = ((‖u‖ : ℝ) : ℂ) / (((|(n : ℝ)| * 2 : ℝ)) : ℂ) := by
    rw [hnorm]; push_cast
    have : ((|(n : ℝ)| : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hnR
    field_simp
  apply pi_transcendental
  rw [hpi]
  have hnum : ((‖u‖ : ℝ) : ℂ) ∈ Qbar := mem_Qbar_iff.mpr hmod
  have hden : (((|(n : ℝ)| * 2 : ℝ)) : ℂ) ∈ Qbar := by
    have hcast : (((|(n : ℝ)| * 2 : ℝ)) : ℂ) = ((|n| * 2 : ℤ) : ℂ) := by
      push_cast [← Int.cast_abs]
      norm_num
    rw [hcast]
    exact mem_Qbar_iff.mpr (isAlgebraic_intCast _)
  exact mem_Qbar_iff.mp (div_mem hnum hden)

end Diaz
