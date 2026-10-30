/-
# Roy's strong six exponentials theorem, with no hypothesis

The library states Roy's strong six exponentials theorem as the proposition
`Diaz.StrongSixExponentials` (in `Diaz/Multipliers.lean`), and every result that needs it takes
it as a hypothesis `hSSE`, either under that name or with its body written out. Round C1.4 proved
the theorem on Prove2Me from one explicit hypothesis, the elementary multiplicity estimate
`Diaz.MultiplicityEstimateElem` (`Diaz/MultiplicityEstimate.lean`), the case `G⁻ = {e}` of
DALAG Th. 8.1. The 26 ported nodes of that round end in `Diaz.strong_six_exponentials`, whose
conclusion is the body of `StrongSixExponentials` verbatim. Rounds C1.1, C1.2 and C1.3 proved the
hypothesis: the 32 ported nodes of C1.3 end in `Diaz.multiplicityEstimateElem`, through the
Hilbert side of C1.1 and Macaulay's unmixedness for polynomial rings of C1.2. This file restates
both in the library's names.

The theorem is classical: Roy, *Matrices whose coefficients are linear forms in logarithms*
(J. Number Theory 41, 1992), Corollary 2, and DALAG §11.6–11.7. The formal proof follows the
route through Th. 11.21 of DALAG, and the multiplicity estimate follows DALAG §8.4 (chapter 8 is
by D. Roy) at finite level; for `G⁻ = {e}` it is a case of Philippon's (1986, Th. 2.1).

The declarations that take Roy's theorem as the hypothesis `hSSE` therefore hold with no
hypothesis, through `strongSixExponentials`; `Diaz/RoyUnconditional.lean` restates each of them
without it: `candidate_multiplier_module` (in `Diaz/Multipliers.lean`), and the mirrored nodes
`algebraic_modulus_log_multiplier_rational`, `candidate_cube_and_axis_multiple_not_mem_logAlgTilde`,
`candidate_div_sq_sub_not_mem_logAlgTilde`, `candidate_laurent_conj_hull_class_not_mem_logAlgTilde`,
`candidate_power_pair_not_both_mem_logAlgTilde`,
`candidate_rational_conj_hull_criterion_not_mem_logAlgTilde`,
`candidate_real_pencil_not_both_mem_logAlgTilde`, `candidate_sum_div_sq_sub_not_mem_logAlgTilde`,
`candidate_two_pole_not_both_mem_logAlgTilde`, `diaz_2007_cor1_PQ`, `diaz_2007_cor2_P1`,
`diaz_2007_cor2_P_consequences`, `diaz_2007_cor3_Q`, `diaz_2007_cor4`, `diaz_2007_cor5`,
`diaz_2007_cor6`, `diaz_2007_cor7`, `diaz_2007_th4`, `diaz_2007_th5`, `diaz_2007_th6`,
`diaz_2007_th7`, `logAlgTilde_adjoin_circle_point_no_two_by_three_configuration`,
`nonreal_two_point_fibre_pi_sq` and `pi_powers_not_both_mem_logAlgTilde`.
-/
import Mathlib
import Diaz.Multipliers
import Diaz.MultiplicityEstimate
import Diaz.Mirror.strong_six_exponentials
import Diaz.Mirror.multiplicityEstimateElem

namespace Diaz

/-- **Roy's strong six exponentials theorem, from the multiplicity estimate.** The elementary
multiplicity estimate `MultiplicityEstimateElem` (the case `G⁻ = {e}` of DALAG Th. 8.1)
implies `StrongSixExponentials`. -/
theorem strongSixExponentials_of_multiplicityEstimateElem
    (hME : MultiplicityEstimateElem) : StrongSixExponentials :=
  fun x y hx hy => strong_six_exponentials hME x y hx hy

/-- **Roy's strong six exponentials theorem** (Roy 1992, Cor. 2; DALAG Cor. 11.16), with no
hypothesis: for `x₁, x₂` and `y₁, y₂, y₃`, each family linearly independent over `Q̄`, some
`xᵢ yⱼ` lies outside `ℒ̃`. It holds in the library with no hypothesis:
`strongSixExponentials_of_multiplicityEstimateElem` applied to `multiplicityEstimateElem`, the
mirrored proof of the multiplicity estimate. Every declaration that assumes
`hSSE : StrongSixExponentials`, or its body, holds without it; `Diaz/RoyUnconditional.lean`
states each so. -/
theorem strongSixExponentials : StrongSixExponentials :=
  strongSixExponentials_of_multiplicityEstimateElem multiplicityEstimateElem

end Diaz
