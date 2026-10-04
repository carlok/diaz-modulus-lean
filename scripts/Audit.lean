/-
Axiom audit of the headline results: the theorems `README.md` presents under
"What is proved", "Four exponentials in transcendence degree one" and "What is
assumed", and the Palomar surface in `Solution.lean`.

`scripts/check_axioms.py` runs this file and fails unless every theorem below
depends on `propext`, `Classical.choice` and `Quot.sound` only.
-/
import Diaz
import Solution

#print axioms Diaz.conj_eq_rho_div
#print axioms Diaz.conj_mem_hull
#print axioms Diaz.eqOn_hull
#print axioms Diaz.model_falsifies
#print axioms Diaz.conj_comm
#print axioms Diaz.exists_conj_intertwining
#print axioms Diaz.candidate_no_vanishing_coeff_Qbar
#print axioms Diaz.candidate_indistinguishable
#print axioms Diaz.four_nodes_candidate
#print axioms Diaz.no_vanishing_coeff_matrix
#print axioms Diaz.candidate_no_vanishing_coeff
#print axioms Diaz.hermite_lindemann
#print axioms Diaz.exists_ringHom_of_transcendental
#print axioms Diaz.four_exponentials_trdeg_one
#print axioms Diaz.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult
#print axioms Diaz.no_first_order_arithmetic_operator
#print axioms Diaz.kronecker_factorisation
#print axioms DiazRigidity.conj_eq_rho_div
#print axioms DiazRigidity.eqOn_hull
#print axioms DiazRigidity.conj_comm
#print axioms DiazRigidity.exists_algHom_of_transcendental
#print axioms DiazRigidity.no_vanishing_coeff_matrix
#print axioms DiazRigidity.coeff_indistinguishable
-- 2026-10-02: Baker's theorem by Schneider–Lang (E12), Diaz's (Qr2) in transcendence degree one (R2),
-- and the unconditional forms of the nodes that had carried Baker as a hypothesis (R3)
#print axioms Transcendence.baker_linear_forms_in_logarithms
#print axioms Transcendence.schneider_lang_cartesian
#print axioms Transcendence.cartesian_schwarz
#print axioms Diaz.baker_two_logs
#print axioms Diaz.diaz_2007_qr2_of_trdeg_one
#print axioms Diaz.candidate_log_mul_real_iff_rat_conj
#print axioms Diaz.no_algebraic_generalized_line_unconditional
#print axioms Diaz.candidate_one_log_saturation_unconditional
#print axioms Diaz.no_first_order_arithmetic_operator_unconditional
#print axioms Diaz.recip_pi_log_of_rational_quadratic_relation
#print axioms Diaz.dilog_half_irrational_or_exp_i_div_pi_transcendental
#print axioms Diaz.generic_circle_point_no_two_by_three_configuration
#print axioms Diaz.candidate_pair_dichotomy
#print axioms Diaz.candidate_axis_ratio
#print axioms Diaz.candidate_mixed_rigidity
