/-
Mirrored from Prove2Me: `DiazModulus.exp_abs_transcendental_of_conj_algebraic`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.exp_abs_transcendental_of_conj_algebraic__5f4b5ead.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.exp_abs_transcendental_of_isAlgebraic_adjoin

namespace Diaz

open Complex ComplexConjugate

namespace S7W1_exp_abs_conj_algebraic

/-- Every `x` is algebraic over `ℚ[x]`: it is the image of the generator of `ℚ[x]`. -/
theorem exp_abs_transcendental_of_conj_algebraic_self_isAlgebraic (x : ℂ) : IsAlgebraic ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) x :=
  isAlgebraic_algebraMap (⟨x, Algebra.subset_adjoin rfl⟩ : ↥(Algebra.adjoin ℚ ({x} : Set ℂ)))

end S7W1_exp_abs_conj_algebraic

open S7W1_exp_abs_conj_algebraic in
theorem exp_abs_transcendental_of_conj_algebraic (lam : ℂ)
    (hlam : IsAlgebraic ℚ (Complex.exp lam)) (him : lam.im ≠ 0)
    (hdep : IsAlgebraic (↥(Algebra.adjoin ℚ ({lam} : Set ℂ))) (conj lam)) :
    Transcendental ℚ (Complex.exp ((‖lam‖ : ℝ) : ℂ)) := by
  -- The node with `x := λ`: `λ` is algebraic over `ℚ[λ]`, and `λ̄` is by hypothesis.
  exact exp_abs_transcendental_of_isAlgebraic_adjoin lam lam hlam him
    (exp_abs_transcendental_of_conj_algebraic_self_isAlgebraic lam) hdep

end Diaz
