import Mathlib
import Definitions.Def_DiazModulus

open Polynomial MvPolynomial LaurentPolynomial

#check @MvPolynomial.finSuccEquiv
#check @MvPolynomial.finSuccEquiv_X_zero
#check @MvPolynomial.finSuccEquiv_X_succ
#check @MvPolynomial.eval_eq_eval_mv_eval'
#check @Polynomial.divByMonic
#check @Polynomial.modByMonic_add_div
#check @Polynomial.degree_modByMonic_lt
#check @Polynomial.modByMonic_eq_zero_iff_dvd
#check @Polynomial.exists_eq_X_add_C_of_natDegree_le_one
#check @Polynomial.monic_X_pow_add
#check @Polynomial.monic_X_pow_add_C
#check @Polynomial.eval₂_modByMonic_eq_self_of_root
#check @transcendental_iff
#check @IsAlgebraic.of_pow
#check @Algebra.IsAlgebraic.transcendental_iff
#check @IsAlgebraic.restrictScalars
#check @Polynomial.toLaurent
#check @LaurentPolynomial.eval₂
#check @LaurentPolynomial.isLocalization
#check @Irreducible.not_isSquare
#check @MvPolynomial.eval₂_dvd
#check @DiazModulus.IsCandidate
#check @DiazModulus.HermiteLindemann
#check @DiazModulus.Qbar
#check Complex.re_add_im
#check Complex.normSq_eq_norm_sq
#check Complex.I_mul_I
#check Complex.I_sq
#check Complex.normSq_apply
