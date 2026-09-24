/-
Mirrored from Prove2Me: `DiazModulus.div_not_mem_logAlgTilde_of_sfe`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.div_not_mem_logAlgTilde_of_sfe__255e41f7.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

namespace P17_cons17

/-- A transcendental `z` makes `![1, z]` linearly independent over `Qbar`: a relation
`s + t z = 0` with `t ≠ 0` would put `z = -s/t` in `Qbar`. -/
theorem linInd_one_left (z : ℂ) (hz : Transcendental ℚ z) :
    LinearIndependent (↥Qbar) ![(1 : ℂ), z] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  have hst' : (s : ℂ) + (t : ℂ) * z = 0 := by
    simpa [Subfield.smul_def, smul_eq_mul] using hst
  by_cases ht0 : (t : ℂ) = 0
  · rw [ht0, zero_mul, add_zero] at hst'
    exact ⟨Subtype.ext hst', Subtype.ext ht0⟩
  · exfalso
    apply hz
    have hzeq : z = -(s : ℂ) / (t : ℂ) := by
      field_simp
      linear_combination hst'
    rw [← mem_Qbar_iff, hzeq]
    exact Qbar.div_mem (Qbar.neg_mem s.2) t.2

/-- The same with the entries swapped: `![z, 1]`. -/
theorem linInd_one_right (z : ℂ) (hz : Transcendental ℚ z) :
    LinearIndependent (↥Qbar) ![z, (1 : ℂ)] :=
  LinearIndependent.pair_symm_iff.mp (linInd_one_left z hz)

theorem one_mem_logAlgTilde : (1 : ℂ) ∈ LogAlgTilde :=
  Submodule.subset_span (Set.mem_insert _ _)

end P17_cons17

open P17_cons17 in
theorem div_not_mem_logAlgTilde_of_sfe (hS : StrongFourExponentials) (L₁ L₂ : ℂ)
    (h₁ : L₁ ∈ LogAlgTilde) (h₂ : L₂ ∈ LogAlgTilde)
    (ht₁ : Transcendental ℚ L₁) (ht : Transcendental ℚ (L₂ / L₁)) :
    L₂ / L₁ ∉ LogAlgTilde := by
  intro hq
  have hL₁ : L₁ ≠ 0 := by
    rintro rfl
    exact ht₁ isAlgebraic_zero
  apply hS 1 (L₂ / L₁) L₁ 1 (linInd_one_left _ ht) (linInd_one_right _ ht₁)
  refine ⟨?_, ?_, ?_, ?_⟩
  · rwa [one_mul]
  · rw [one_mul]
    exact one_mem_logAlgTilde
  · rwa [div_mul_cancel₀ _ hL₁]
  · rwa [mul_one]

end Diaz
