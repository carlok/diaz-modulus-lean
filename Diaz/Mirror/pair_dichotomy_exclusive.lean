/-
Mirrored from Prove2Me: `Diaz.pair_dichotomy_exclusive`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.pair_dichotomy_exclusive__05cfa456.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

set_option autoImplicit false
open ComplexConjugate

theorem pair_dichotomy_exclusive {u v : ℂ}
    (hq : IsAlgebraic ℚ (u * conj u))
    (h : (∃ c : ℚ, c ≠ 0 ∧ v = (c : ℂ) * u) ∨
         (∃ c : ℚ, c ≠ 0 ∧ v = (c : ℂ) * conj u)) :
    ¬ AlgebraicIndependent ℚ ![u, v] := by
  intro hi
  let E : MvPolynomial (Fin 2) ℚ →ₐ[ℚ] ℂ := MvPolynomial.aeval ![u, v]
  have hinj : Function.Injective E := hi
  rcases h with ⟨c, hc, hv⟩ | ⟨c, hc, hv⟩
  · have heq : (MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ) =
        MvPolynomial.C c * MvPolynomial.X 0 := hinj (by simpa [E] using hv)
    have hn := congrArg (MvPolynomial.aeval ![(0 : ℚ), 1]) heq
    norm_num at hn
  · have huv : IsAlgebraic ℚ (u * v) := by
      convert hq.smul c using 1
      simp [hv, Algebra.smul_def, mul_left_comm]
    have hp : IsAlgebraic ℚ
        (MvPolynomial.X 0 * MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ) :=
      (isAlgebraic_algHom_iff E hinj).mp (by simpa [E] using huv)
    have ht := hp.algHom (MvPolynomial.aeval ![(Polynomial.X : Polynomial ℚ), 1])
    simp only [map_mul, MvPolynomial.aeval_X, Matrix.cons_val_zero,
      Matrix.cons_val_one, mul_one] at ht
    exact Polynomial.transcendental_X ℚ ht

end Diaz
