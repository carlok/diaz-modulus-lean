/-
Mirrored from Prove2Me: `DiazModulus.six_exponentials`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.six_exponentials__b4ee3ac8.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Mirror.six_exponentials_of_numberField

namespace Diaz

/-! # Assembly check: the target from rung 2.  Must contain no `sorry`. -/

open Complex ComplexConjugate

theorem six_exponentials (x : Fin 2 → ℂ) (y : Fin 3 → ℂ)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℚ y) :
    ∃ i j, Transcendental ℚ (Complex.exp (x i * y j)) := by
  classical
  by_contra hcon
  simp only [Transcendental, not_exists, not_not] at hcon
  set S : Set ℂ := Set.range (fun q : Fin 2 × Fin 3 => Complex.exp (x q.1 * y q.2)) with hS
  have hSfin : S.Finite := Set.finite_range _
  have : Finite S := hSfin.to_subtype
  have hint : ∀ z ∈ S, IsIntegral ℚ z := by
    rintro z ⟨q, rfl⟩
    exact (hcon q.1 q.2).isIntegral
  have : FiniteDimensional ℚ (IntermediateField.adjoin ℚ S) :=
    IntermediateField.finiteDimensional_adjoin hint
  obtain ⟨i, j, hij⟩ :=
    SX.six_exponentials_of_numberField (d := 2) (l := 3) (by omega) x y hx hy
      (IntermediateField.adjoin ℚ S)
  exact hij (IntermediateField.subset_adjoin ℚ S ⟨(i, j), rfl⟩)

end Diaz
