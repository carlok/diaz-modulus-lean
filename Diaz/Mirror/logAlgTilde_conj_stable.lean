/-
Mirrored from Prove2Me: `DiazModulus.logAlgTilde_conj_stable`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.logAlgTilde_conj_stable__a9d7aa74.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.logAlg_conj_stable

namespace Diaz

open Complex ComplexConjugate

namespace TildeConj

/-- Complex conjugation as a `ℚ`-algebra map. -/
noncomputable def logAlgTilde_conj_stable_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

/-- Conjugation preserves algebraicity over `ℚ`, so it maps `Qbar` to itself. -/
theorem logAlgTilde_conj_stable_conj_mem_Qbar {a : ℂ} (ha : a ∈ Qbar) : conj a ∈ Qbar := by
  obtain ⟨p, hp0, hp⟩ := mem_Qbar_iff.1 ha
  refine mem_Qbar_iff.2 ⟨p, hp0, ?_⟩
  rw [show (conj a : ℂ) = logAlgTilde_conj_stable_cjQ a from rfl, Polynomial.aeval_algHom_apply, hp, map_zero]

end TildeConj

open TildeConj in
/-- `ℒ̃` is stable under complex conjugation: conjugation fixes `1`, maps `ℒ` to itself, and
sends `c • x` to `conj c • conj x` with `conj c` again in `Qbar`. -/
theorem logAlgTilde_conj_stable (z : ℂ) (h : z ∈ LogAlgTilde) : conj z ∈ LogAlgTilde := by
  unfold LogAlgTilde at h ⊢
  induction h using Submodule.span_induction with
  | mem x hx =>
    rcases hx with rfl | hx
    · rw [map_one]
      exact Submodule.subset_span (Set.mem_insert _ _)
    · exact Submodule.subset_span (Set.mem_insert_of_mem _ (logAlg_conj_stable x hx))
  | zero => rw [map_zero]; exact Submodule.zero_mem _
  | add x y _ _ hx hy => rw [map_add]; exact Submodule.add_mem _ hx hy
  | smul c x _ hx =>
    have hcx : conj (c • x) = (⟨conj (c : ℂ), logAlgTilde_conj_stable_conj_mem_Qbar c.2⟩ : ↥Qbar) • conj x :=
      map_mul conj (c : ℂ) x
    rw [hcx]
    exact Submodule.smul_mem _ _ hx

end Diaz
