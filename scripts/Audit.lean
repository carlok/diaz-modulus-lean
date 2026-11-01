/-
Axiom audit of the headline results: the theorems `README.md` presents under
"The classical theorems", "What is proved", "Four exponentials in transcendence
degree one" and "What is assumed", and the Palomar surface in `Solution.lean`.

`scripts/check_axioms.py` runs this file and fails unless every theorem below
depends on `propext`, `Classical.choice` and `Quot.sound` only.
-/
import Diaz
import Solution

-- The classical theorems (README table); the five already listed further down
-- (`hermite_lindemann`, `four_exponentials_trdeg_one`, Baker, the Cartesian
-- Schwarz lemma and Schneider–Lang) are not repeated.
#print axioms linearIndependent_exp
#print axioms algebraicIndependent_exp
#print axioms GelfondSchneider.gelfond_schneider
#print axioms Diaz.six_exponentials
#print axioms Diaz.two_algebraically_independent_of_exp_column
#print axioms Transcendence.exp_e_or_exp_e_sq_transcendental
#print axioms Diaz.transcendence_criterion
#print axioms Diaz.expPoly_zero_count
#print axioms Transcendence.singular_matrix_subspace_annihilating_pair
#print axioms Diaz.e_pi_transcendence

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
#print axioms Diaz.cubic_product_eq_square_normal_form
#print axioms Diaz.two_by_three_configuration_forces_progression
#print axioms Diaz.circle_point_extension_carries_two_by_three_configuration
#print axioms Diaz.circle_hull_progression_contains_square_or_reciprocal
#print axioms Diaz.circle_point_extension_two_by_three_configuration_iff
#print axioms Diaz.circle_point_conjugate_pair_extension_carries_two_by_three_configuration
#print axioms Diaz.circle_point_conjugate_pair_extension_excludes_squares_and_reciprocals
#print axioms Diaz.circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.conj_stable_circle_point_extension_no_two_by_three_configuration
#print axioms Diaz.candidate_div_sq_sub_not_mem_logAlgTilde
#print axioms Diaz.polynomial_submodule_trailing_degrees_card
#print axioms Diaz.polynomial_submodule_mul_finrank_ge
#print axioms Diaz.rank_one_config_card_le_finrank_add_one
#print axioms Diaz.rank_one_config_separation_two
#print axioms Diaz.rank_one_config_separation
#print axioms Diaz.circle_point_config_card_le_four
#print axioms Diaz.generic_circle_point_config_is_two_by_two
#print axioms Diaz.circle_point_two_by_two_normal_form
#print axioms Diaz.circle_point_config_constant_matrix_det_ne_zero
#print axioms Diaz.two_by_two_config_critical_progression
#print axioms Diaz.two_sumset_iff_difference_count
#print axioms Diaz.laurent_hull_config_iff
#print axioms Diaz.power_pair_difference_count_iff
#print axioms Diaz.power_pair_hull_two_by_three_iff
#print axioms Diaz.four_pow_hull_no_two_by_three
#print axioms Diaz.algebraic_mem_span_logAlg_eq_zero
#print axioms Diaz.candidate_two_by_two_config_entry_not_mem_span_logAlg
#print axioms Diaz.candidate_power_pair_not_both_mem_logAlgTilde
#print axioms Diaz.circle_point_two_pole_extension_carries_two_by_three_configuration
#print axioms Diaz.circle_point_two_pole_extension_excludes_squares_and_reciprocals
#print axioms Diaz.circle_point_two_pole_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.candidate_two_pole_not_both_mem_logAlgTilde
#print axioms Diaz.candidate_sum_div_sq_sub_not_mem_logAlgTilde
#print axioms Diaz.candidate_im_mem_pi_rat_of_weak_schanuel
#print axioms Diaz.diaz_iff_single_relation_of_weak_schanuel
#print axioms Diaz.involution_pencil_space_carries_two_by_three_configuration
#print axioms Diaz.involution_pencil_space_excludes_squares_and_reciprocals
#print axioms Diaz.involution_pencil_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.laurent_case_two_configuration_invisible
#print axioms Diaz.conj_stable_real_pencil_space_carries_two_by_three_configuration
#print axioms Diaz.real_pencil_quartic_space_excludes_squares_and_reciprocals
#print axioms Diaz.conj_equivariant_degree_one_space_eq_real_pencil_space
#print axioms Diaz.diaz_of_weak_schanuel_and_kernel_schanuel
#print axioms Diaz.mobius_progression_space_contains_square_or_reciprocal
#print axioms Diaz.real_pencil_quartic_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.candidate_real_pencil_not_both_mem_logAlgTilde
#print axioms Diaz.progression_space_ratio_degree_le_two
#print axioms Diaz.quadratic_ratio_progression_space_eq_involution_pencil_space
#print axioms Diaz.progression_space_contains_square_or_reciprocal_or_eq_involution_pencil_space
#print axioms Diaz.laurent_cubic_space_excludes_squares_and_reciprocals
#print axioms Diaz.laurent_cubic_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.laurent_cubic_space_no_mobius_ratio_configuration
#print axioms Diaz.two_orbit_space_excludes_squares_and_reciprocals
#print axioms Diaz.two_orbit_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.conj_stable_two_orbit_space
#print axioms Diaz.quadratic_over_ratio_of_mem_progression_pair_span
#print axioms Diaz.progression_pair_span_ratio_degree_le_two
#print axioms Diaz.laurent_real_pencil_space_excludes_squares_and_reciprocals
#print axioms Diaz.laurent_real_pencil_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.laurent_real_pencil_space_contains_square_of_root
#print axioms Diaz.conj_swapped_two_orbit_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.cyclic_pair_space_excludes_squares_and_reciprocals
#print axioms Diaz.cyclic_pair_configuration_invisible_to_four_dimensional_extensions
#print axioms Diaz.cyclic_pair_space_no_mobius_ratio_configuration
#print axioms Diaz.polynomial_submodule_degrees_card
#print axioms Diaz.five_point_sumset_rigid
#print axioms Diaz.shifted_polynomial_hull_orders
#print axioms Diaz.config_shifted_polynomial_spans
#print axioms Diaz.rank_one_polynomial_matrix_factor
#print axioms Diaz.polynomial_hull_no_two_by_three_configuration
#print axioms Diaz.rank_one_config_inverse_adjoin
#print axioms Diaz.polynomial_hull_two_by_three_configuration_iff
#print axioms Diaz.real_polynomial_hull_no_two_by_three_configuration
#print axioms Diaz.logAlgTilde_adjoin_circle_point_no_two_by_three_configuration
#print axioms Diaz.degree_one_space_visible_to_four_dimensional_extensions_iff_cubic_over_quadratic
#print axioms Diaz.rational_degree_one_space_visible_to_four_dimensional_extensions_iff_natDegree_le
#print axioms Diaz.rational_pencil_space_visible_to_four_dimensional_extensions_iff_natDegree_le
#print axioms Diaz.laurent_conj_hull_two_by_three_configuration_iff
#print axioms Diaz.laurent_conj_hull_large_exponent_configuration_iff_real_pencil_class
#print axioms Diaz.cubic_window_conj_hull_two_by_three_configuration_iff_criterion
#print axioms Diaz.candidate_laurent_conj_hull_class_not_mem_logAlgTilde
#print axioms Diaz.laurent_conj_hull_configuration_classes_disjoint
#print axioms Diaz.logAlg_adjoin_circle_point_theorem_D
#print axioms Diaz.theorem_D_barrier
#print axioms Diaz.span_logAlg_theorem_D_properties
#print axioms Diaz.degree_two_configuration_normal_form
#print axioms Diaz.rational_space_two_by_three_configuration_iff
#print axioms Diaz.rational_conj_hull_two_by_three_configuration_iff
#print axioms Diaz.conj_hull_finrank_four_two_by_three_configuration_iff
#print axioms Diaz.conj_stable_degree_one_multiplier_space_visible_or_real_pencil_space
#print axioms Diaz.laurent_conj_hull_configuration_shape_iff_class
#print axioms Diaz.candidate_rational_conj_hull_criterion_not_mem_logAlgTilde
#print axioms Diaz.degree_two_configuration_multiplier_space_eq

-- Roy's strong six exponentials theorem from the multiplicity estimate `hME` (C1.4, 29 October 2026):
-- the README table row, the headline node and the linear subgroup theorem. `hME` is a hypothesis.
#print axioms Diaz.strongSixExponentials_of_multiplicityEstimateElem
#print axioms Diaz.strong_six_exponentials
#print axioms Diaz.linear_subgroup_transcendence

-- The Hilbert side of the multiplicity estimate (C1.1, 29 October 2026): the chain bound
-- (DALAG Th. 8.8 at finite level), the Hilbert side on hME's boxes, and the translates bound.
-- Unmixedness `hU : UnmixedHeight _` is a hypothesis of the chain bound and of the Hilbert side.
#print axioms Diaz.boxHilb_le_of_height
#print axioms Diaz.torus_hilbert_side
#print axioms Diaz.exists_card_mul_boxHilb_le_translates

-- Macaulay's unmixedness for polynomial rings (C1.2, 29 October 2026): `UnmixedHeight (MvPolynomial σ K)` for K
-- algebraically closed and σ finite, the inequality half (Macaulay 1916; Bruns–Herzog Th. 2.1.6), and the Hilbert
-- side of the multiplicity estimate over ℂ with `hU` supplied by it.
#print axioms Diaz.unmixedHeight_mvPolynomial
#print axioms Diaz.torus_hilbert_side_complex

-- The multiplicity estimate (C1.3, 30 October 2026): `hME`, the case G⁻ = {e} of DALAG Th. 8.1 for 𝔾ₐ^{A₀} × 𝔾ₘ^{A₁}
-- over ℂ in coordinates (the proof of DALAG §8.4 at finite level), and Roy's strong six exponentials theorem with no
-- hypothesis, as the platform node and as the library's proposition.
#print axioms Diaz.multiplicityEstimateElem
#print axioms Diaz.strong_six_exponentials_unconditional
#print axioms Diaz.strongSixExponentials
-- The results that took Roy's theorem as the hypothesis `hSSE`, with no hypothesis (Diaz/RoyUnconditional.lean).
#print axioms Diaz.span_insert_one_exp_mem_Qbar_eq_logAlgTilde
#print axioms Diaz.strong_six_exponentials_quotient_form_unconditional
#print axioms Diaz.diaz_2007_cor2_P1_unconditional
#print axioms Diaz.nonreal_two_point_fibre_pi_sq_unconditional
#print axioms Diaz.algebraic_modulus_log_multiplier_rational_unconditional
#print axioms Diaz.candidate_cube_and_axis_multiple_not_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_div_sq_sub_not_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_laurent_conj_hull_class_not_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_power_pair_not_both_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_rational_conj_hull_criterion_not_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_real_pencil_not_both_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_sum_div_sq_sub_not_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_two_pole_not_both_mem_logAlgTilde_unconditional
#print axioms Diaz.diaz_2007_cor1_PQ_unconditional
#print axioms Diaz.diaz_2007_cor2_P_consequences_unconditional
#print axioms Diaz.diaz_2007_cor3_Q_unconditional
#print axioms Diaz.diaz_2007_cor4_unconditional
#print axioms Diaz.diaz_2007_cor5_unconditional
#print axioms Diaz.diaz_2007_cor6_unconditional
#print axioms Diaz.diaz_2007_cor7_unconditional
#print axioms Diaz.diaz_2007_th4_unconditional
#print axioms Diaz.diaz_2007_th5_unconditional
#print axioms Diaz.diaz_2007_th6_unconditional
#print axioms Diaz.diaz_2007_th7_unconditional
#print axioms Diaz.logAlgTilde_adjoin_circle_point_no_two_by_three_configuration_unconditional
#print axioms Diaz.pi_powers_not_both_mem_logAlgTilde_unconditional
#print axioms Diaz.candidate_multiplier_module_unconditional
#print axioms Diaz.two_orbit_space_visible_to_four_dimensional_extensions_iff_common_zero
#print axioms Diaz.cyclic_space_visible_to_four_dimensional_extensions_iff_common_zero
#print axioms Diaz.invisible_two_orbit_space_u_multiplier_space_eq
#print axioms Diaz.invisible_cyclic_space_u_multiplier_space_eq
#print axioms Diaz.invisible_two_orbit_space_configuration_ratio_mobius
#print axioms Diaz.invisible_cyclic_space_configuration_ratio_mobius
#print axioms Diaz.conj_stable_invisible_quadratic_space_conj_ratio_mobius
#print axioms Diaz.five_exponentials
#print axioms Diaz.two_pow_pi_or_three_pow_pi_transcendental
#print axioms Diaz.exp_mul_or_exp_sq_mul_transcendental
