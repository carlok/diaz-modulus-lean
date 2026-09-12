/-
# The ceiling: strong four exponentials settles the question

Backup of `DiazModulus.diaz_of_sfe` (`0148ccca-b726-4238-8cb8-48eba0967a85`),
Proved on Prove2Me.

The conjecture follows from the strong four exponentials conjecture by a
single instantiation. Take `x = (u, |u|)` and `y = (1, |u|/u)`; the four
products are `u`, `|u|`, `|u|` and `conj u`, all four of them in `ℒ̃`, and
the two pairs are `Q̄`-independent because `u` is transcendental. So the
strong four exponentials conjecture is violated unless no candidate exists.

This is the ceiling of the whole problem: everything else in the
development is an attempt to ask for less than this.

Conventions as in `Diaz.Multipliers`.
-/
import Mathlib
import Diaz.Multipliers

open Complex ComplexConjugate

namespace Diaz

/-- **Diaz's modulus conjecture**, in the direction the statement runs: for
every non-zero `u` with algebraic modulus, `exp u` is transcendental. -/
def DiazModulusConjecture : Prop :=
  ∀ u : ℂ, u ≠ 0 → IsAlgebraic ℚ ((‖u‖ : ℝ) : ℂ) → Transcendental ℚ (Complex.exp u)

/-- **The strong four exponentials conjecture** (Waldschmidt). For
`Q̄`-linearly independent pairs `x₁,x₂` and `y₁,y₂`, at least one of the
four products `xᵢyⱼ` falls outside `ℒ̃`. -/
def StrongFourExponentials : Prop :=
  ∀ x₁ x₂ y₁ y₂ : ℂ,
    LinearIndependent (↥Qbar) ![x₁, x₂] → LinearIndependent (↥Qbar) ![y₁, y₂] →
    ¬ (x₁ * y₁ ∈ LogAlgTilde ∧ x₁ * y₂ ∈ LogAlgTilde ∧
       x₂ * y₁ ∈ LogAlgTilde ∧ x₂ * y₂ ∈ LogAlgTilde)

/-- **Strong four exponentials implies the modulus conjecture**, given
Hermite–Lindemann. -/
theorem diaz_of_sfe_hl (hS : StrongFourExponentials) (hHL : HermiteLindemannProp) :
    DiazModulusConjecture := by
  intro u hu hnorm hexp
  set lam : ℂ := ((‖u‖ : ℝ) : ℂ) with hlam_def
  have hsmul : ∀ (c : ↥Qbar) (z : ℂ), c • z = (c : ℂ) * z := fun _ _ => rfl
  have hlam0 : lam ≠ 0 := by simp [hlam_def, hu]
  have hlamQ : lam ∈ Qbar := mem_Qbar_iff.mpr hnorm
  have huQ : u ∉ Qbar := fun h => hHL u hu (mem_Qbar_iff.mp h) hexp
  have huL : u ∈ LogAlg := hexp
  have hone : (1 : ℂ) ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert _ _)
  have huT : u ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert_of_mem _ huL)
  have hconjT : (conj u) ∈ LogAlgTilde :=
    Submodule.subset_span (Set.mem_insert_of_mem _ (logAlg_conj huL))
  have hlamT : lam ∈ LogAlgTilde := by
    have h := Submodule.smul_mem LogAlgTilde (⟨lam, hlamQ⟩ : ↥Qbar) hone
    simpa [hsmul] using h
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
      rw [conj_eq_normSq_div u, ← hlam_def]; field_simp
    rw [this]; exact hconjT

/-- **Strong four exponentials implies the modulus conjecture.**
Hermite–Lindemann is discharged from `Diaz.hermite_lindemann`, the imported
axiom; on the platform it is a proved node. -/
theorem diaz_of_sfe (hS : StrongFourExponentials) : DiazModulusConjecture :=
  diaz_of_sfe_hl hS (fun a ha halg hexp => hermite_lindemann (u := a) (by
    simpa using ha) (by simpa using hexp) halg)

end Diaz
