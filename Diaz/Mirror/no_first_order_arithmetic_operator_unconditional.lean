/-
Mirrored from Prove2Me: `DiazModulus.no_first_order_arithmetic_operator_unconditional`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.no_first_order_arithmetic_operator_unconditional__6ba657ea.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.no_first_order_arithmetic_operator
import Diaz.Mirror.candidate_qbar_independent_one_u_conj

namespace Diaz

open ComplexConjugate

/-- `no_first_order_arithmetic_operator` with `hbaker := candidate_qbar_independent_one_u_conj u hu`. -/
theorem no_first_order_arithmetic_operator_unconditional
    (u : ℂ) (hu : IsCandidate u)
    (a b : MvPolynomial (Fin 2) ℂ)
    (ha : ∀ d, IsAlgebraic ℚ (a.coeff d))
    (hb : ∀ d, IsAlgebraic ℚ (b.coeff d))
    (hvalues : ∀ m n : ℤ,
        IsAlgebraic ℚ
          ((MvPolynomial.eval (fun i : Fin 2 => if i = 0 then (m : ℂ) else (n : ℂ)) a * u
              + MvPolynomial.eval (fun i : Fin 2 => if i = 0 then (m : ℂ) else (n : ℂ)) b * conj u)
            * Complex.exp (u * m + conj u * n))) :
    a = 0 ∧ b = 0 := by
  exact no_first_order_arithmetic_operator u hu
    (candidate_qbar_independent_one_u_conj u hu) a b ha hb hvalues

end Diaz
