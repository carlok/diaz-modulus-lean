/-
Mirrored from Prove2Me: `DiazModulus.diaz_2007_cor2_P_consequences`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_2007_cor2_P_consequences__5e07b11f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.strong_six_exponentials_iff_quotient_form
import Diaz.Mirror.logAlgTilde_conj_stable
import Diaz.Mirror.quadratic_eq_zero_of_not_mem_Qbar
import Diaz.Mirror.diaz_2007_cor1_PQ
import Diaz.Mirror.diaz_2007_cor2_P1

namespace Diaz

open Complex ComplexConjugate

namespace DiazCor2PConsequences

theorem diaz_2007_cor2_P_consequences_one_mem_logAlgTilde : (1 : ℂ) ∈ LogAlgTilde :=
  Submodule.subset_span (Set.mem_insert _ _)

/-- `ℒ̃` in the form `Diaz.diaz_2007_cor2_P1` takes at `K = Q̄`: the logarithms of algebraic
numbers are the `l` with `exp l ∈ Q̄`. -/
theorem logAlgTilde_eq : LogAlgTilde = Submodule.span ↥Qbar
    (insert (1 : ℂ) {l : ℂ | Complex.exp l ∈ Qbar}) := by
  rw [show {l : ℂ | Complex.exp l ∈ Qbar} = LogAlg from
    Set.ext fun _ => mem_Qbar_iff]
  rfl

end DiazCor2PConsequences

open DiazCor2PConsequences in
/-- Diaz (2007), Corollaire 2 (P), 2), and its three consequences: (P2) is part 1) of
Corollaire 1 (PQ) with `l₀ = 1`; the consequences are Corollaire 2 (P), 1)
(`Diaz.diaz_2007_cor2_P1` at `K = Q̄`) on `(l, l, l̄)` and on `(l₁, l₂, l₁ l₂)`. -/
theorem diaz_2007_cor2_P_consequences
    (hSSE : ∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
      LinearIndependent (↥Qbar) x → LinearIndependent (↥Qbar) y →
      ¬ (∀ i j, x i * y j ∈ LogAlgTilde)) :
    -- Corollaire 2 (P), 2)
    (∀ l₁ l₂ : ℂ, l₁ ∈ LogAlgTilde → l₂ ∈ LogAlgTilde →
      (l₁.im = 0 ∨ l₁.re = 0) → l₁ ∉ Qbar →
      (∀ a b c : ℂ, a ∈ Qbar → b ∈ Qbar → c ∈ Qbar → a + b * l₂ + c * conj l₂ = 0 →
        a = 0 ∧ b = 0 ∧ c = 0) →
      l₁ * l₂ ∉ LogAlgTilde) ∧
    -- Conséquence 1)
    (∀ l : ℂ, l ∈ LogAlgTilde →
      (∀ a b c : ℂ, a ∈ Qbar → b ∈ Qbar → c ∈ Qbar → a + b * l + c * conj l = 0 →
        a = 0 ∧ b = 0 ∧ c = 0) →
      ¬ (l ^ 2 ∈ LogAlgTilde ∧ ((‖l‖ : ℝ) : ℂ) ^ 2 ∈ LogAlgTilde)) ∧
    -- Conséquence 2)
    (∀ l₁ l₂ : ℂ, l₁ ∈ LogAlgTilde → l₂ ∈ LogAlgTilde →
      (∀ a b c : ℂ, a ∈ Qbar → b ∈ Qbar → c ∈ Qbar → a + b * l₂ + c * (l₁ * l₂) = 0 →
        a = 0 ∧ b = 0 ∧ c = 0) →
      ¬ (l₁ * l₂ ∈ LogAlgTilde ∧ l₁ ^ 2 * l₂ ∈ LogAlgTilde)) ∧
    -- Conséquence 3)
    (∀ l : ℂ, l ∈ LogAlgTilde → l ∉ Qbar → ¬ (l ^ 2 ∈ LogAlgTilde ∧ l ^ 3 ∈ LogAlgTilde)) := by
  -- Corollaire 2 (P), 1) at `K = Q̄`, `aLog = ℒ̃`, fed with version 3 of strong six exponentials
  have hV3 := strong_six_exponentials_iff_quotient_form.mp hSSE
  have hP1 := @Diaz.diaz_2007_cor2_P1 Qbar LogAlgTilde logAlgTilde_eq hV3
  -- (P2): Corollaire 1 (PQ), 1) with `l₀ = 1`
  have hP2 : ∀ l₁ l₂ : ℂ, l₁ ∈ LogAlgTilde → l₂ ∈ LogAlgTilde →
      (l₁.im = 0 ∨ l₁.re = 0) → l₁ ∉ Qbar →
      (∀ a b c : ℂ, a ∈ Qbar → b ∈ Qbar → c ∈ Qbar → a + b * l₂ + c * conj l₂ = 0 →
        a = 0 ∧ b = 0 ∧ c = 0) →
      l₁ * l₂ ∉ LogAlgTilde := by
    intro l₁ l₂ h₁ h₂ hr hq hfree
    have := (diaz_2007_cor1_PQ hSSE).1 1 l₁ l₂ diaz_2007_cor2_P_consequences_one_mem_logAlgTilde h₁ h₂
      (fun a b c ha hb hc h => hfree a b c ha hb hc (by rwa [mul_one] at h))
      (by rwa [div_one]) (by rwa [div_one])
    rwa [div_one] at this
  -- (C1): `(l, l, l̄)`, and `l l̄ = |l|²`
  have hC1 : ∀ l : ℂ, l ∈ LogAlgTilde →
      (∀ a b c : ℂ, a ∈ Qbar → b ∈ Qbar → c ∈ Qbar → a + b * l + c * conj l = 0 →
        a = 0 ∧ b = 0 ∧ c = 0) →
      ¬ (l ^ 2 ∈ LogAlgTilde ∧ ((‖l‖ : ℝ) : ℂ) ^ 2 ∈ LogAlgTilde) := by
    rintro l hl hfree ⟨hsq, hnorm⟩
    have n1 : l ∉ Qbar := fun h =>
      one_ne_zero (hfree (-l) 1 0 (neg_mem h) (one_mem _) (zero_mem _) (by ring)).2.1
    have n2 : conj l ∉ Qbar := fun h =>
      one_ne_zero (hfree (-conj l) 0 1 (neg_mem h) (zero_mem _) (one_mem _) (by ring)).2.2
    exact hP1 hl n1 hl n1 (logAlgTilde_conj_stable l hl) n2 hfree
      ⟨by rwa [← sq], by rwa [mul_conj']⟩
  -- (C2): `(l₁, l₂, l₁ l₂)`; all three lie outside `Q̄` by the freeness of `(1, l₂, l₁ l₂)`
  have hC2 : ∀ l₁ l₂ : ℂ, l₁ ∈ LogAlgTilde → l₂ ∈ LogAlgTilde →
      (∀ a b c : ℂ, a ∈ Qbar → b ∈ Qbar → c ∈ Qbar → a + b * l₂ + c * (l₁ * l₂) = 0 →
        a = 0 ∧ b = 0 ∧ c = 0) →
      ¬ (l₁ * l₂ ∈ LogAlgTilde ∧ l₁ ^ 2 * l₂ ∈ LogAlgTilde) := by
    rintro l₁ l₂ h₁ h₂ hfree ⟨h12, h112⟩
    have n1 : l₁ ∉ Qbar := fun h =>
      one_ne_zero (hfree 0 (-l₁) 1 (zero_mem _) (neg_mem h) (one_mem _) (by ring)).2.2
    have n2 : l₂ ∉ Qbar := fun h =>
      one_ne_zero (hfree (-l₂) 1 0 (neg_mem h) (one_mem _) (zero_mem _) (by ring)).2.1
    have n3 : l₁ * l₂ ∉ Qbar := fun h =>
      one_ne_zero (hfree (-(l₁ * l₂)) 0 1 (neg_mem h) (zero_mem _) (one_mem _) (by ring)).2.2
    exact hP1 h₁ n1 h₂ n2 h12 n3 hfree
      ⟨h12, by rwa [show l₁ * (l₁ * l₂) = l₁ ^ 2 * l₂ by ring]⟩
  -- (C3): (C2) with `l₁ = l₂ = l`; `(1, l, l²)` is free since `l` is not quadratic over `Q̄`
  have hC3 : ∀ l : ℂ, l ∈ LogAlgTilde → l ∉ Qbar →
      ¬ (l ^ 2 ∈ LogAlgTilde ∧ l ^ 3 ∈ LogAlgTilde) := by
    rintro l hl hlq ⟨h2, h3⟩
    refine hC2 l l hl hl (fun a b c ha hb hc h => ?_)
      ⟨by rwa [← sq], by rwa [show l ^ 2 * l = l ^ 3 by ring]⟩
    have := quadratic_eq_zero_of_not_mem_Qbar hlq hc hb ha (by linear_combination h)
    exact ⟨this.2.2, this.2.1, this.1⟩
  exact ⟨hP2, hC1, hC2, hC3⟩

end Diaz
