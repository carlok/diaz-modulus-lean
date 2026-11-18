/-
Mirrored from Prove2Me: `DiazModulus.fv_cor_1_3`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fv_cor_1_3__31ad5e0e.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.strong_six_exponentials_unconditional

namespace Diaz

open Complex ComplexConjugate

/-! # Waldschmidt, *Further variations*, Cor. 1.3

Suppose both `Λ₁Λ₂` and `Λ₁Λ₃` lie in `ℒ̃`. Put `x = (1, Λ₁)` and `y = (1, Λ₂, Λ₃)`. The six products `xᵢyⱼ`
are `1, Λ₂, Λ₃, Λ₁, Λ₁Λ₂, Λ₁Λ₃`, all in `ℒ̃` (`1 ∈ ℒ̃` by definition of `ℒ̃`). The triple `y` is `Q̄`-free by
hypothesis. The pair `x` is `Q̄`-free: a relation `s + tΛ₁ = 0` with `t ≠ 0` would give `Λ₁ = −s/t ∈ Q̄`,
against the transcendence of `Λ₁`, and `t = 0` forces `s = 0`. Roy's strong six exponentials theorem, in product
form, says that a `Q̄`-free pair and a `Q̄`-free triple never have all six products in `ℒ̃`: contradiction. -/

theorem fv_cor_1_3 (Λ₁ Λ₂ Λ₃ : ℂ) (h₁ : Λ₁ ∈ LogAlgTilde) (h₂ : Λ₂ ∈ LogAlgTilde)
    (h₃ : Λ₃ ∈ LogAlgTilde) (htr : Transcendental ℚ Λ₁)
    (hfree : LinearIndependent (↥Qbar) ![1, Λ₂, Λ₃]) :
    Λ₁ * Λ₂ ∉ LogAlgTilde ∨ Λ₁ * Λ₃ ∉ LogAlgTilde := by
  by_contra h
  push Not at h
  obtain ⟨h12, h13⟩ := h
  have h1 : (1 : ℂ) ∈ LogAlgTilde := Submodule.subset_span (Set.mem_insert 1 _)
  have hx : LinearIndependent (↥Qbar) ![(1 : ℂ), Λ₁] := by
    rw [LinearIndependent.pair_iff]
    intro s t hst
    by_cases ht : t = 0
    · subst ht
      simpa using hst
    · exfalso
      apply htr
      have hΛ : Λ₁ = -((s : ℂ) / t) := by
        rw [Subfield.smul_def, Subfield.smul_def, smul_eq_mul, smul_eq_mul, mul_one] at hst
        have ht' : (t : ℂ) ≠ 0 := by exact_mod_cast ht
        field_simp
        linear_combination hst
      rw [hΛ, ← mem_Qbar_iff]
      exact Qbar.neg_mem (Qbar.div_mem s.2 t.2)
  refine strong_six_exponentials_unconditional ![1, Λ₁] ![1, Λ₂, Λ₃] hx hfree fun i j => ?_
  fin_cases i <;> fin_cases j <;> simpa

end Diaz
