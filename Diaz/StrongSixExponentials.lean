/-
# Roy's strong six exponentials theorem from the multiplicity estimate `hME`

The library states Roy's strong six exponentials theorem as the proposition
`Diaz.StrongSixExponentials` (in `Diaz/Multipliers.lean`), and every result that needs it takes
it as a hypothesis `hSSE`, either under that name or with its body written out. Round C1.4 proved
the theorem on Prove2Me from one explicit hypothesis, the elementary multiplicity estimate
`Diaz.MultiplicityEstimateElem` (`Diaz/MultiplicityEstimate.lean`), the case `G⁻ = {e}` of
DALAG Th. 8.1. That hypothesis is not proved here. The 26 ported nodes of the round end in
`Diaz.strong_six_exponentials`, whose conclusion is the body of `StrongSixExponentials`
verbatim; this file only restates it in the library's name.

The theorem is classical: Roy, *Matrices whose coefficients are linear forms in logarithms*
(J. Number Theory 41, 1992), Corollary 2, and DALAG §11.6–11.7. The formal proof follows the
route through Th. 11.21 of DALAG.

The declarations that take Roy's theorem as the hypothesis `hSSE` therefore hold under `hME`
instead, through `strongSixExponentials_of_multiplicityEstimateElem`:
`candidate_multiplier_module` (in `Diaz/Multipliers.lean`), and the mirrored nodes
`algebraic_modulus_log_multiplier_rational`, `candidate_cube_and_axis_multiple_not_mem_logAlgTilde`,
`candidate_div_sq_sub_not_mem_logAlgTilde`, `candidate_laurent_conj_hull_class_not_mem_logAlgTilde`,
`candidate_power_pair_not_both_mem_logAlgTilde`,
`candidate_rational_conj_hull_criterion_not_mem_logAlgTilde`,
`candidate_real_pencil_not_both_mem_logAlgTilde`, `candidate_sum_div_sq_sub_not_mem_logAlgTilde`,
`candidate_two_pole_not_both_mem_logAlgTilde`, `diaz_2007_cor1_PQ`, `diaz_2007_cor2_P_consequences`,
`diaz_2007_cor3_Q`, `diaz_2007_cor4`, `diaz_2007_cor5`, `diaz_2007_cor6`, `diaz_2007_cor7`,
`diaz_2007_th4`, `diaz_2007_th5`, `diaz_2007_th6`, `diaz_2007_th7`,
`logAlgTilde_adjoin_circle_point_no_two_by_three_configuration` and
`pi_powers_not_both_mem_logAlgTilde`. They are not restated: each applies to
`strongSixExponentials_of_multiplicityEstimateElem hME` as it stands.
-/
import Mathlib
import Diaz.Multipliers
import Diaz.MultiplicityEstimate
import Diaz.Mirror.strong_six_exponentials

namespace Diaz

/-- **Roy's strong six exponentials theorem, from the multiplicity estimate.** The elementary
multiplicity estimate `MultiplicityEstimateElem` (the case `G⁻ = {e}` of DALAG Th. 8.1, a
hypothesis that is not proved in this library) implies `StrongSixExponentials`. So every
declaration of the library that assumes `hSSE : StrongSixExponentials`, or its body, now holds
under `hME : MultiplicityEstimateElem` instead of Roy's theorem; the module docstring lists them. -/
theorem strongSixExponentials_of_multiplicityEstimateElem
    (hME : MultiplicityEstimateElem) : StrongSixExponentials :=
  fun x y hx hy => strong_six_exponentials hME x y hx hy

end Diaz
