/-
Mirrored from Prove2Me: `DiazModulus.logAlg_adjoin_circle_point_hermite_lindemann_gelfond_schneider`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.logAlg_adjoin_circle_point_hermite_lindemann_gelfond_schneider__ab327c5d.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.logAlg_adjoin_circle_point_baker_linear_forms

namespace Diaz

open Complex ComplexConjugate

/-! # Hermite–Lindemann and Gel'fond–Schneider for `ℒ_u = ℒ + ℚu + ℚū`

Both clauses are special cases of Baker's theorem on linear forms for `ℒ_u`
(`logAlg_adjoin_circle_point_baker_linear_forms`). Hermite–Lindemann is the case `n = 1`: if `z ∈ ℒ_u` is algebraic
and non-zero, then `l = (z)` is `ℚ`-independent, and the form `−z + 1·z = 0` has algebraic coefficients
`b₀ = −z`, `b₁ = 1 ≠ 0`, which Baker forbids. Gel'fond–Schneider is the case `n = 2`, `b₀ = 0`: if `l₀ ≠ 0` and
`βl₀` both lie in `ℒ_u` with `β` algebraic and not rational, then `(l₀, βl₀)` is `ℚ`-independent (a relation
`s l₀ + t βl₀ = 0` with `t ≠ 0` would make `β = −s/t` rational), and `β·l₀ − 1·(βl₀) = 0` is a vanishing form with
algebraic coefficients `(β, −1)`, again forbidden. -/

namespace R19_B3
/-- `(l₀, β l₀)` is `ℚ`-independent when `l₀ ≠ 0` and `β` is not rational. -/
theorem linearIndependent_pair_mul {l₀ β : ℂ} (hl₀ : l₀ ≠ 0) (hβ : ∀ q : ℚ, β ≠ (q : ℂ)) :
    LinearIndependent ℚ ![l₀, β * l₀] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  simp only [Rat.smul_def] at hst
  have h1 : ((s : ℂ) + (t : ℂ) * β) * l₀ = 0 := by rw [← hst]; ring
  have h2 : (s : ℂ) + (t : ℂ) * β = 0 := (mul_eq_zero.1 h1).resolve_right hl₀
  have ht : t = 0 := by
    by_contra ht
    apply hβ (-s / t)
    have ht' : (t : ℂ) ≠ 0 := by exact_mod_cast ht
    push_cast
    field_simp
    linear_combination h2
  subst ht
  refine ⟨?_, rfl⟩
  simpa using h2

end R19_B3

open R19_B3 in
theorem logAlg_adjoin_circle_point_hermite_lindemann_gelfond_schneider
    (u : ℂ) (hρ : IsAlgebraic ℚ (u * conj u))
    (hu : Transcendental (Subfield.closure (LogAlgTilde : Set ℂ)) u) :
    (∀ z ∈ (Submodule.span ℚ LogAlg ⊔ Submodule.span ℚ ({u, conj u} : Set ℂ)), IsAlgebraic ℚ z → z = 0) ∧
    (∀ l₀ β : ℂ, l₀ ∈ (Submodule.span ℚ LogAlg ⊔ Submodule.span ℚ ({u, conj u} : Set ℂ)) → β * l₀ ∈ (Submodule.span ℚ LogAlg ⊔ Submodule.span ℚ ({u, conj u} : Set ℂ)) →
      l₀ ≠ 0 → IsAlgebraic ℚ β → ∃ q : ℚ, β = (q : ℂ)) := by
  constructor
  · -- Hermite–Lindemann: `n = 1`, `l = (z)`, `b₀ = −z`, `b = (1)`
    intro z hz hza
    by_contra hz0
    have hli : LinearIndependent ℚ ![z] := by
      rw [linearIndependent_unique_iff]
      simpa using hz0
    refine logAlg_adjoin_circle_point_baker_linear_forms u hρ hu 1 ![z] hli
      (fun i => by fin_cases i; simpa using hz) (-z) ![1] hza.neg
      (fun i => by fin_cases i; simpa using isAlgebraic_one) (Or.inr ⟨0, by simp⟩) ?_
    simp
  · -- Gel'fond–Schneider: `n = 2`, `l = (l₀, βl₀)`, `b₀ = 0`, `b = (β, −1)`
    intro l₀ β hl₀ hβl₀ hl₀0 hβ
    by_contra hq
    replace hq : ∀ q : ℚ, β ≠ (q : ℂ) := fun q h => hq ⟨q, h⟩
    refine logAlg_adjoin_circle_point_baker_linear_forms u hρ hu 2 ![l₀, β * l₀]
      (linearIndependent_pair_mul hl₀0 hq)
      (fun i => by fin_cases i <;> simpa) 0 ![β, -1] isAlgebraic_zero
      (fun i => by fin_cases i; exacts [hβ, isAlgebraic_one.neg]) (Or.inr ⟨1, by simp⟩) ?_
    simp [Fin.sum_univ_two]

end Diaz
