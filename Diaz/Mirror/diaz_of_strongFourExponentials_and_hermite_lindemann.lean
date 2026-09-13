/-
Mirrored from Prove2Me: `DiazModulus.diaz_of_strongFourExponentials_and_hermite_lindemann`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_of_strongFourExponentials_and_hermite_lindemann__9f0385db.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.conj_eq_norm_sq_div
import Diaz.Mirror.logAlg_conj_stable

namespace Diaz

open Complex ComplexConjugate

theorem diaz_of_strongFourExponentials_and_hermite_lindemann (hS : StrongFourExponentials) (hHL : HermiteLindemann) :
    DiazModulusConjecture := by
  intro u hu hnorm hexp
  set lam : ℂ := ((‖u‖ : ℝ) : ℂ) with hlam_def
  -- scalar action of `Qbar` on `ℂ` is multiplication of the coercion
  have hsmul : ∀ (c : ↥Qbar) (z : ℂ), c • z = (c : ℂ) * z := fun _ _ => rfl
  have hlam0 : lam ≠ 0 := by
    simp [hlam_def, hu]
  have hlamQ : lam ∈ Qbar := mem_Qbar_iff.mpr hnorm
  -- Hermite--Lindemann: `u` cannot be algebraic
  have huQ : u ∉ Qbar := fun h => hHL u hu (mem_Qbar_iff.mp h) hexp
  -- memberships in `ℒ̃`
  have huL : u ∈ LogAlg := hexp
  have hone : (1 : ℂ) ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert _ _)
  have huT : u ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert_of_mem _ huL)
  have hconjT : (conj u) ∈ LogAlgTilde :=
    Submodule.subset_span (Set.mem_insert_of_mem _ (logAlg_conj_stable u huL))
  have hlamT : lam ∈ LogAlgTilde := by
    have h := Submodule.smul_mem LogAlgTilde (⟨lam, hlamQ⟩ : ↥Qbar) hone
    simpa [hsmul] using h
  -- the single reason both independence hypotheses hold
  have key : ∀ s t : ↥Qbar, (s : ℂ) * u + (t : ℂ) * lam = 0 → s = 0 ∧ t = 0 := by
    intro s t h
    by_cases hs : (s : ℂ) = 0
    · rw [hs, zero_mul, zero_add] at h
      have ht : (t : ℂ) = 0 := by
        rcases mul_eq_zero.mp h with h' | h'
        · exact h'
        · exact absurd h' hlam0
      exact ⟨Subtype.ext hs, Subtype.ext ht⟩
    · exact absurd (by
        have hueq : u = -((t : ℂ) * lam) / (s : ℂ) := by
          field_simp
          linear_combination h
        rw [hueq]
        exact Subfield.div_mem _ (Subfield.neg_mem _ (Subfield.mul_mem _ t.2 hlamQ)) s.2) huQ
  have hind1 : LinearIndependent (↥Qbar) ![u, lam] := by
    rw [LinearIndependent.pair_iff]
    intro s t hst
    simp only [hsmul] at hst
    exact key s t hst
  have hind2 : LinearIndependent (↥Qbar) ![(1 : ℂ), lam / u] := by
    rw [LinearIndependent.pair_iff]
    intro s t hst
    simp only [hsmul] at hst
    have h' : (s : ℂ) * u + (t : ℂ) * lam = 0 := by
      field_simp at hst
      linear_combination hst
    exact key s t h'
  refine hS u lam 1 (lam / u) hind1 hind2 ⟨?_, ?_, ?_, ?_⟩
  · simpa using huT
  · have : u * (lam / u) = lam := by field_simp
    rw [this]; exact hlamT
  · simpa using hlamT
  · have : lam * (lam / u) = conj u := by
      rw [conj_eq_norm_sq_div u, ← hlam_def]; field_simp
    rw [this]; exact hconjT

end Diaz
