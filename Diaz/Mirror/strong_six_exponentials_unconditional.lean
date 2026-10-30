/-
Mirrored from Prove2Me: `DiazModulus.strong_six_exponentials_unconditional`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.strong_six_exponentials_unconditional__d5d6dd10.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.strong_six_exponentials
import Diaz.Mirror.multiplicityEstimateElem

namespace Diaz

open Complex ComplexConjugate

/-! # Roy's strong six exponentials theorem, unconditional

The node `strong_six_exponentials` proves Roy's strong six exponentials theorem under the hypothesis
`MultiplicityEstimateElem`, and the node `multiplicityEstimateElem` proves that proposition. Applying the first
to the second gives the theorem with no hypothesis: for `x ∈ ℂ²` and `y ∈ ℂ³`, each linearly independent over the
algebraic numbers, some product `x_i y_j` lies outside the `Q̄`-span `ℒ̃` of `1` and the logarithms of algebraic
numbers. -/

theorem strong_six_exponentials_unconditional :
    ∀ x : Fin 2 → ℂ, ∀ y : Fin 3 → ℂ, LinearIndependent (↥Qbar) x → LinearIndependent (↥Qbar) y →
      ¬ ∀ i j, x i * y j ∈ LogAlgTilde := by
  exact strong_six_exponentials multiplicityEstimateElem

end Diaz
