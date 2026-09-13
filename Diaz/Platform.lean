/-
# Platform vocabulary not otherwise present in the library

The Prove2Me mission preamble names two propositions differently from, or in addition
to, the library. Mirrored proofs are stated in the platform's names, so they are
supplied here. `HermiteLindemann` is definitionally the library's
`HermiteLindemannProp`, so the two are interchangeable.
-/
import Mathlib
import Diaz.Multipliers
import Diaz.SFE
import Diaz.HermiteLindemann

open scoped Cardinal

namespace Diaz

/-- The platform's name for `HermiteLindemannProp`. -/
abbrev HermiteLindemann : Prop := HermiteLindemannProp

/-- **Schanuel's conjecture**, as the platform states it. -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℂ), LinearIndependent ℚ x →
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i => Complex.exp (x i))))

end Diaz
