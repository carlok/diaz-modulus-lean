/-
# Hermite–Lindemann, proved

Backup of `DiazModulus.hermite_lindemann_holds`, Proved on Prove2Me, stated with
the library's `HermiteLindemannProp`. The machinery lives in
`Diaz.LindemannWeierstrass`; `Diaz.Axioms` proves the same theorem in contrapositive
form, which is how the rest of the library consumes it.
-/
import Mathlib
import Diaz.LindemannWeierstrass
import Diaz.Multipliers

open Complex ComplexConjugate
open Finset
open scoped Polynomial
open MvPolynomial.symmetricSubalgebra
open scoped AddMonoidAlgebra
open Finset
open Complex
open Polynomial
open scoped Nat
open Complex Finset Polynomial

namespace Diaz

/-- **Hermite--Lindemann**, proved rather than assumed: for non-zero algebraic
`a`, `exp a` is transcendental. This discharges the `Diaz.hermite_lindemann`
form proved in `Diaz.Axioms` from the same machinery. -/
theorem hermite_lindemann_holds : HermiteLindemannProp := by
  intro a ha0 ha hexp
  have h1 : IsIntegral ℚ a := isAlgebraic_iff_isIntegral.mp ha
  have h2 : IsIntegral ℚ (Complex.exp a) := isAlgebraic_iff_isIntegral.mp hexp
  refine by
    simpa [Fin.forall_fin_succ] using
      linearIndependent_exp' ![a, 0] ?_ ?_ ![1, -Complex.exp a] ?_ ?_
  · intro i; fin_cases i
    exacts [h1, isIntegral_zero]
  · intro i j; fin_cases i, j <;> simp [ha0.symm, *]
  · intro i; fin_cases i; exacts [isIntegral_one, h2.neg]
  · simp

end Diaz
