# Mirror checklist — Diaz

What this repository holds of the Diaz mission's proved results, and what is left
to port. **Generated** by `scripts/refresh_prove2me_archive.py` from the live
Prove2Me board, the archive, the `Diaz/` library and `scripts/mirror_priorities.json`.
Do not edit rows by hand: change the priorities file or port a result, then rerun.

Two tiers.

- **Archive** — `archive/prove2me/`: every accepted submission, verbatim from the
  platform apart from redacted comments. Not built; see the README there.
- **Library** — `Diaz/`: results ported to compile against this repository's pinned
  Mathlib, checked by CI. This checklist tracks it.

As of the latest archived submission (2026-09-24): **212** of 212
Proved nodes are in the library. Of the rest, **0** marked high
priority, **0** normal, **0** low (folklore,
scaffolding, or an elementary case), **0** skipped as defective.

**Every Proved node is to be ported, trivial or not.** The companion note selects
what it presents; the library does not select. The priority column only sets the
order: *high* first — results the note or its manuscript relies on, or the only
formal record of an argument — then *normal*, then *low*. It is a judgement, not a
measurement.

Open nodes are not listed: they have no accepted proof to mirror. The statements and
write-ups of the Open `FourExp.*` nodes, which accepted reductions import, are kept under
`archive/prove2me/open/`. Work that was never published on the platform lives under
`archive/local/`.

| Node | Archived | In library | Priority | Note |
|---|---|---|---|---|
| `Diaz.Exp0_add` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Exp0_ne_zero` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Exp0_pow_eq_one_iff` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Exp0_swap_conj` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Gmat_projection` | yes | `Diaz/Mirror/Gmat_projection.lean` | done |  |
| `Diaz.Hmat_pencil_normal_form` | yes | `Diaz/Mirror/Hmat_pencil_normal_form.lean` | done |  |
| `Diaz.Hmat_real_congr` | yes | `Diaz/Mirror/Hmat_real_congr.lean` | done |  |
| `Diaz.Hmat_transfer` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.algebraic_of_axis` | yes | `Diaz/Mirror/algebraic_of_axis.lean` | done |  |
| `Diaz.axis_triple_indep` | yes | `Diaz/Mirror/axis_triple_indep.lean` | done |  |
| `Diaz.balanced_jet_mem_iff` | yes | `Diaz/Mirror/balanced_jet_mem_iff.lean` | done |  |
| `Diaz.binary_form_eq_zero` | yes | `Diaz/Mirror/binary_form_eq_zero.lean` | done |  |
| `Diaz.candidate_indistinguishable` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.candidate_indistinguishable_by_coeff` | yes | `Diaz/Mirror/candidate_indistinguishable_by_coeff.lean` | done |  |
| `Diaz.candidate_no_vanishing_coeff_Qbar` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.coeff_transfer` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.coeff_transfer_iff` | yes | `Diaz/Mirror/coeff_transfer_iff.lean` | done |  |
| `Diaz.conj_combination_off_rays` | yes | `Diaz/Mirror/conj_combination_off_rays.lean` | done |  |
| `Diaz.conj_comm` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.conj_coords` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.conj_mem_hull` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.conj_not_linear_hull` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.conj_not_linear_of_I` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.conj_planes_inter` | yes | `Diaz/Mirror/conj_planes_inter.lean` | done |  |
| `Diaz.conj_planes_mul` | yes | `Diaz/Mirror/conj_planes_mul.lean` | done |  |
| `Diaz.conj_stable_line_generator` | yes | `Diaz/Mirror/conj_stable_line_generator.lean` | done |  |
| `Diaz.det_Hmat` | yes | `Diaz/Rigidity.lean` | done |  |
| `Diaz.det_add_two` | yes | `Diaz/Mirror/det_add_two.lean` | done |  |
| `Diaz.det_pencil_eq_conic` | yes | `Diaz/Pencil.lean` | done |  |
| `Diaz.diaz_2007_cor2_P1` | yes | `Diaz/Mirror/diaz_2007_cor2_P1.lean` | done |  |
| `Diaz.elliptic_axis_alignment` | yes | `Diaz/Mirror/elliptic_axis_alignment.lean` | done |  |
| `Diaz.elliptic_chords_norm_one` | yes | `Diaz/Mirror/elliptic_chords_norm_one.lean` | done |  |
| `Diaz.elliptic_plane_rigidity` | yes | `Diaz/Mirror/elliptic_plane_rigidity.lean` | done |  |
| `Diaz.elliptic_torsion_excluded` | yes | `Diaz/Mirror/elliptic_torsion_excluded.lean` | done |  |
| `Diaz.eqOn_hull` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.equal_real_parts` | yes | `Diaz/Mirror/equal_real_parts.lean` | done |  |
| `Diaz.exists_conj_intertwining` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.exists_ringHom_of_transcendental` | yes | `Diaz/Axioms.lean` | done |  |
| `Diaz.exists_transcendental_on_circle` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.exists_transcendental_on_circle_Qbar` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.exp_ratMul_isAlgebraic` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.exp_ratio_pow_eq_one_iff` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.failure_rational_multiple_rigid` | yes | `Diaz/Mirror/failure_rational_multiple_rigid.lean` | done |  |
| `Diaz.fibre_at_most_two` | yes | `Diaz/Fibre.lean` | done |  |
| `Diaz.fibre_second_point_is_conj` | yes | `Diaz/Mirror/fibre_second_point_is_conj.lean` | done |  |
| `Diaz.forced_plane_exhaustion` | yes | `Diaz/Mirror/forced_plane_exhaustion.lean` | done |  |
| `Diaz.four_exp_trdeg_one` | yes | `Diaz/Mirror/four_exp_trdeg_one.lean` | done |  |
| `Diaz.four_nodes` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.four_nodes_candidate` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.indep` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.indep_of_algebraic_product` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.indep_of_not_axis` | yes | `Diaz/Mirror/indep_of_not_axis.lean` | done |  |
| `Diaz.indep_quadruple` | yes | `Diaz/Mirror/indep_quadruple.lean` | done |  |
| `Diaz.indep_three` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.involution_alignment` | yes | `Diaz/Mirror/involution_alignment.lean` | done |  |
| `Diaz.isAlgebraic_two_rpow` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.locus_stable` | yes | `Diaz/Mirror/locus_stable.lean` | done |  |
| `Diaz.log_circles_alignment` | yes | `Diaz/Mirror/log_circles_alignment.lean` | done |  |
| `Diaz.log_modulus_forces_independence` | yes | `Diaz/Mirror/log_modulus_forces_independence.lean` | done |  |
| `Diaz.model_falsifies` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.no_holo_stab` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.no_vanishing_coeff` | yes | `Diaz/Rigidity.lean` | done |  |
| `Diaz.nonreal_two_point_fibre_pi_sq` | yes | `Diaz/Mirror/nonreal_two_point_fibre_pi_sq.lean` | done |  |
| `Diaz.norm_mem_iff` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.normal_form` | yes | `Diaz/Mirror/normal_form.lean` | done |  |
| `Diaz.normalization_not_invariant` | yes | `Diaz/Mirror/normalization_not_invariant.lean` | done |  |
| `Diaz.not_on_axes` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.orbit_of_candidate` | yes | `Diaz/Mirror/orbit_of_candidate.lean` | done |  |
| `Diaz.order_quantisation` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.outer_multiplier_param` | yes | `Diaz/Mirror/outer_multiplier_param.lean` | done |  |
| `Diaz.padic_conjugate_planes` | yes | `Diaz/Mirror/padic_conjugate_planes.lean` | done |  |
| `Diaz.pair_dichotomy_exclusive` | yes | `Diaz/Mirror/pair_dichotomy_exclusive.lean` | done |  |
| `Diaz.period_plane_classification` | yes | `Diaz/Mirror/period_plane_classification.lean` | done |  |
| `Diaz.period_plane_norm` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.plane_normSq_algebraic_iff` | yes | `Diaz/Mirror/plane_normSq_algebraic_iff.lean` | done |  |
| `Diaz.power_support_interval_bound` | yes | `Diaz/Mirror/power_support_interval_bound.lean` | done |  |
| `Diaz.power_support_sumfree` | yes | `Diaz/Mirror/power_support_sumfree.lean` | done |  |
| `Diaz.q_translate_unique` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.quadratic_algebra_distance` | yes | `Diaz/Mirror/quadratic_algebra_distance.lean` | done |  |
| `Diaz.quadric_trdeg_two` | yes | `Diaz/Mirror/quadric_trdeg_two.lean` | done |  |
| `Diaz.quantisation_orbit_iff_re_ne_zero` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.quot_isAlgebraic_of_algebraic_dist` | yes | `Diaz/Mirror/quot_isAlgebraic_of_algebraic_dist.lean` | done |  |
| `Diaz.rank_one_of_det_eq_zero` | yes | `Diaz/Mirror/rank_one_of_det_eq_zero.lean` | done |  |
| `Diaz.rank_one_six_exponentials` | yes | `Diaz/Mirror/rank_one_six_exponentials.lean` | done |  |
| `Diaz.rational_singular_subspace_classification` | yes | `Diaz/Mirror/rational_singular_subspace_classification.lean` | done |  |
| `Diaz.rational_subspace_quadric_ratios` | yes | `Diaz/Mirror/rational_subspace_quadric_ratios.lean` | done |  |
| `Diaz.real_quantisation` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.roy_conic_implies_empty` | yes | `Diaz/Pencil.lean` | done |  |
| `Diaz.salem_quartic_relations` | yes | `Diaz/Mirror/salem_quartic_relations.lean` | done |  |
| `Diaz.salem_quartic_relations_of_logs` | yes | `Diaz/Mirror/salem_quartic_relations_of_logs.lean` | done |  |
| `Diaz.second_difference_mem` | yes | `Diaz/Mirror/second_difference_mem.lean` | done |  |
| `Diaz.sq_eq_zero_of_trace_eq_zero` | yes | `Diaz/Mirror/sq_eq_zero_of_trace_eq_zero.lean` | done |  |
| `Diaz.torsion_dichotomy` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.trace_norm_quadratic_algebra` | yes | `Diaz/Mirror/trace_norm_quadratic_algebra.lean` | done |  |
| `Diaz.transcendental_of_candidate` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.two_failures_give_algebraic_log_product` | yes | `Diaz/Mirror/two_failures_give_algebraic_log_product.lean` | done |  |
| `Diaz.zpow_mem_iff` | yes | `Diaz/Mirror/zpow_mem_iff.lean` | done |  |
| `DiazModulus.aligned_norm_free_no_rational_log_matrix` | yes | `Diaz/Mirror/aligned_norm_free_no_rational_log_matrix.lean` | done |  |
| `DiazModulus.anisotropic_relation_four_exp_barrier` | yes | `Diaz/Mirror/anisotropic_relation_four_exp_barrier.lean` | done |  |
| `DiazModulus.anisotropic_relation_on_circle` | yes | `Diaz/Mirror/anisotropic_relation_on_circle.lean` | done |  |
| `DiazModulus.candidate_conj_product_rational` | yes | `Diaz/Mirror/candidate_conj_product_rational.lean` | done |  |
| `DiazModulus.candidate_distance_transcendental` | yes | `Diaz/Distance.lean` | done |  |
| `DiazModulus.candidate_exp_angularTriple_transcendental` | yes | `Diaz/Mirror/candidate_exp_angularTriple_transcendental.lean` | done |  |
| `DiazModulus.candidate_harmonic_not_log` | yes | `Diaz/Mirror/candidate_harmonic_not_log.lean` | done |  |
| `DiazModulus.candidate_im_transcendental` | yes | `Diaz/Kernel.lean` | done |  |
| `DiazModulus.candidate_monomial_not_log` | yes | `Diaz/Mirror/candidate_monomial_not_log.lean` | done |  |
| `DiazModulus.candidate_multiplier_module` | yes | `Diaz/Multipliers.lean` | done |  |
| `DiazModulus.candidate_neg_one_pow_ratio` | yes | `Diaz/Mirror/candidate_neg_one_pow_ratio.lean` | done |  |
| `DiazModulus.candidate_no_real_algebraic_line` | yes | `Diaz/CheapLine.lean` | done |  |
| `DiazModulus.candidate_nongeneric_four_exp_barrier` | yes | `Diaz/Mirror/candidate_nongeneric_four_exp_barrier.lean` | done |  |
| `DiazModulus.candidate_one_log_saturation` | yes | `Diaz/Multipliers.lean` | done |  |
| `DiazModulus.candidate_one_self_conj_linearIndependent` | yes | `Diaz/Mirror/candidate_one_self_conj_linearIndependent.lean` | done |  |
| `DiazModulus.candidate_orbit_and_plane_rigidity` | yes | `Diaz/Mirror/candidate_orbit_and_plane_rigidity.lean` | done |  |
| `DiazModulus.candidate_product_relation_trivial` | yes | `Diaz/Mirror/candidate_product_relation_trivial.lean` | done |  |
| `DiazModulus.candidate_quotient_rigid` | yes | `Diaz/Mirror/candidate_quotient_rigid.lean` | done |  |
| `DiazModulus.candidate_re_transcendental` | yes | `Diaz/Kernel.lean` | done |  |
| `DiazModulus.candidate_vanishing_ideal` | yes | `Diaz/Kernel.lean` | done |  |
| `DiazModulus.circle_points_indistinguishable` | yes | `Diaz/Mirror/circle_points_indistinguishable.lean` | done |  |
| `DiazModulus.conj_eq_norm_sq_div` | yes | `Diaz/Mirror/conj_eq_norm_sq_div.lean` | done |  |
| `DiazModulus.conj_pair_quadratic_relation_iff` | yes | `Diaz/Mirror/conj_pair_quadratic_relation_iff.lean` | done |  |
| `DiazModulus.conj_ratio_multiplier_relation` | yes | `Diaz/Mirror/conj_ratio_multiplier_relation.lean` | done |  |
| `DiazModulus.det_linear_forms_isotropic` | yes | `Diaz/Mirror/det_linear_forms_isotropic.lean` | done |  |
| `DiazModulus.det_zero_linear_forms_rank_one` | yes | `Diaz/Mirror/det_zero_linear_forms_rank_one.lean` | done |  |
| `DiazModulus.det_zero_linear_forms_rank_one_field` | yes | `Diaz/Mirror/det_zero_linear_forms_rank_one_field.lean` | done |  |
| `DiazModulus.diaz_iff_no_candidate` | yes | `Diaz/Mirror/diaz_iff_no_candidate.lean` | done |  |
| `DiazModulus.diaz_locus_dictionary` | yes | `Diaz/Mirror/diaz_locus_dictionary.lean` | done |  |
| `DiazModulus.diaz_number_forces_transcendence` | yes | `Diaz/Mirror/diaz_number_forces_transcendence.lean` | done |  |
| `DiazModulus.diaz_of_exp_eq_one` | yes | `Diaz/Mirror/diaz_of_exp_eq_one.lean` | done |  |
| `DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult` | yes | `Diaz/Mirror/diaz_of_exp_not_real_irrational_angle_period_aligned_norm_rat_mult.lean` | done |  |
| `DiazModulus.diaz_of_exp_not_real_on_axes` | yes | `Diaz/Mirror/diaz_of_exp_not_real_on_axes.lean` | done |  |
| `DiazModulus.diaz_of_exp_real_pure_imaginary` | yes | `Diaz/Mirror/diaz_of_exp_real_pure_imaginary.lean` | done |  |
| `DiazModulus.diaz_of_exp_real_self_real` | yes | `Diaz/Mirror/diaz_of_exp_real_self_real.lean` | done |  |
| `DiazModulus.diaz_of_schanuel` | yes | `Diaz/Mirror/diaz_of_schanuel.lean` | done |  |
| `DiazModulus.diaz_of_sfe` | yes | `Diaz/SFE.lean` | done |  |
| `DiazModulus.diaz_of_strongFourExponentials_and_hermite_lindemann` | yes | `Diaz/Mirror/diaz_of_strongFourExponentials_and_hermite_lindemann.lean` | done |  |
| `DiazModulus.diaz_on_axes_of_hermite_lindemann` | yes | `Diaz/Mirror/diaz_on_axes_of_hermite_lindemann.lean` | done |  |
| `DiazModulus.exists_noncandidate_transcendental_on_circle` | yes | `Diaz/Mirror/exists_noncandidate_transcendental_on_circle.lean` | done |  |
| `DiazModulus.exp_I_transcendental` | yes | `Diaz/Mirror/exp_I_transcendental.lean` | done |  |
| `DiazModulus.exp_i_div_pi_or_exp_i_pi_cube_transcendental` | yes | `Diaz/Mirror/exp_i_div_pi_or_exp_i_pi_cube_transcendental.lean` | done |  |
| `DiazModulus.exp_pi_sq_or_exp_i_pi_cube_transcendental` | yes | `Diaz/Mirror/exp_pi_sq_or_exp_i_pi_cube_transcendental.lean` | done |  |
| `DiazModulus.four_exponentials_trdeg_one` | yes | `Diaz/Mirror/four_exponentials_trdeg_one.lean` | done |  |
| `DiazModulus.generic_conj_pair_four_exp_barrier` | yes | `Diaz/Mirror/generic_conj_pair_four_exp_barrier.lean` | done |  |
| `DiazModulus.generic_conj_pair_no_quadratic_relation` | yes | `Diaz/Mirror/generic_conj_pair_no_quadratic_relation.lean` | done |  |
| `DiazModulus.generic_indistinguishable_over_pi` | yes | `Diaz/Mirror/generic_indistinguishable_over_pi.lean` | done |  |
| `DiazModulus.generic_no_strong_six_exp_configuration` | yes | `Diaz/Mirror/generic_no_strong_six_exp_configuration.lean` | done |  |
| `DiazModulus.generic_period_never_enters` | yes | `Diaz/Mirror/generic_period_never_enters.lean` | done |  |
| `DiazModulus.generic_qbar_homogeneous_four_exp_barrier` | yes | `Diaz/Mirror/generic_qbar_homogeneous_four_exp_barrier.lean` | done |  |
| `DiazModulus.generic_quadratic_relation_is_norm` | yes | `Diaz/Mirror/generic_quadratic_relation_is_norm.lean` | done |  |
| `DiazModulus.geometric_triple_not_logs` | yes | `Diaz/Mirror/geometric_triple_not_logs.lean` | done |  |
| `DiazModulus.hermite_lindemann_holds` | yes | `Diaz/HermiteLindemann.lean` | done |  |
| `DiazModulus.kronecker_factorisation` | yes | `Diaz/Mirror/kronecker_factorisation.lean` | done |  |
| `DiazModulus.leaf_iff_one` | yes | `Diaz/Quantisation.lean` | done |  |
| `DiazModulus.logAlg_conj_stable` | yes | `Diaz/Mirror/logAlg_conj_stable.lean` | done |  |
| `DiazModulus.log_pair_rigid_of_trdeg_one` | yes | `Diaz/Mirror/log_pair_rigid_of_trdeg_one.lean` | done |  |
| `DiazModulus.log_ratio_multipliers` | yes | `Diaz/Mirror/log_ratio_multipliers.lean` | done |  |
| `DiazModulus.log_square_duality` | yes | `Diaz/Mirror/log_square_duality.lean` | done |  |
| `DiazModulus.log_two_diaz_or_transcendental` | yes | `Diaz/Mirror/log_two_diaz_or_transcendental.lean` | done |  |
| `DiazModulus.no_algebraic_generalized_line` | yes | `Diaz/Mirror/no_algebraic_generalized_line.lean` | done |  |
| `DiazModulus.no_first_order_arithmetic_operator` | yes | `Diaz/Mirror/no_first_order_arithmetic_operator.lean` | done |  |
| `DiazModulus.period_free_split_nondegenerate` | yes | `Diaz/Mirror/period_free_split_nondegenerate.lean` | done |  |
| `DiazModulus.pi_log_two_or_pi_log_three_transcendental` | yes | `Diaz/Mirror/pi_log_two_or_pi_log_three_transcendental.lean` | done |  |
| `DiazModulus.pi_sq_transcendental` | yes | `Diaz/Mirror/pi_sq_transcendental.lean` | done |  |
| `DiazModulus.pi_sq_transcendental_of_real_gamma` | yes | `Diaz/Mirror/pi_sq_transcendental_of_real_gamma.lean` | done | vacuous: its conclusion is proved unconditionally by pi_sq_transcendental |
| `DiazModulus.pi_transcendental` | yes | `Diaz/Mirror/pi_transcendental.lean` | done |  |
| `DiazModulus.recip_pi_exp_axis_shape` | yes | `Diaz/Mirror/recip_pi_exp_axis_shape.lean` | done |  |
| `DiazModulus.recip_pi_exp_value_not_root_of_unity` | yes | `Diaz/Mirror/recip_pi_exp_value_not_root_of_unity.lean` | done |  |
| `DiazModulus.recip_pi_log_four_exp_barrier` | yes | `Diaz/Mirror/recip_pi_log_four_exp_barrier.lean` | done |  |
| `DiazModulus.recip_pi_log_of_period_aligned` | yes | `Diaz/Mirror/recip_pi_log_of_period_aligned.lean` | done |  |
| `DiazModulus.recip_pi_log_of_pi_im_algebraic` | yes | `Diaz/Mirror/recip_pi_log_of_pi_im_algebraic.lean` | done |  |
| `DiazModulus.recip_pi_log_on_axis` | yes | `Diaz/Mirror/recip_pi_log_on_axis.lean` | done |  |
| `DiazModulus.recip_pi_log_rational_line` | yes | `Diaz/Mirror/recip_pi_log_rational_line.lean` | done |  |
| `DiazModulus.recip_pi_not_log_of_sfe` | yes | `Diaz/Mirror/recip_pi_not_log_of_sfe.lean` | done |  |
| `DiazModulus.recip_pi_not_log_real_or_imag` | yes | `Diaz/Mirror/recip_pi_not_log_real_or_imag.lean` | done |  |
| `DiazModulus.recip_pi_or_pi_cube` | yes | `Diaz/Mirror/recip_pi_or_pi_cube.lean` | done |  |
| `DiazModulus.ringHom_preserves_linearIndependent` | yes | `Diaz/Mirror/ringHom_preserves_linearIndependent.lean` | done |  |
| `DiazModulus.sixExponentials_cannot_refute_candidate` | yes | `Diaz/NoGo.lean` | done |  |
| `DiazModulus.six_exponentials` | yes | `Diaz/Mirror/six_exponentials.lean` | done |  |
| `DiazModulus.transfer_breaks_exactly` | yes | `Diaz/Mirror/transfer_breaks_exactly.lean` | done |  |
| `DiazModulus.two_pow_log_three_or_three_pow_log_two` | yes | `Diaz/Mirror/two_pow_log_three_or_three_pow_log_two.lean` | done |  |
| `DiazModulus.two_three_five_pow_pi_transcendental` | yes | `Diaz/Mirror/two_three_five_pow_pi_transcendental.lean` | done |  |
| `FourExp.aux_linear_system` | yes | `Diaz/Mirror/aux_linear_system.lean` | done |  |
| `FourExp.auxiliary_construction` | yes | `Diaz/Mirror/auxiliary_construction.lean` | done |  |
| `FourExp.auxiliary_function_alg` | yes | `Diaz/Mirror/auxiliary_function_alg.lean` | done |  |
| `FourExp.cauchy_estimate_with_zeros` | yes | `Diaz/Mirror/cauchy_estimate_with_zeros.lean` | done |  |
| `FourExp.construction_core` | yes | `Diaz/Mirror/construction_core.lean` | done |  |
| `FourExp.construction_core_1973` | yes | `Diaz/Mirror/construction_core_1973.lean` | done |  |
| `FourExp.construction_count` | yes | `Diaz/Mirror/construction_count.lean` | done |  |
| `FourExp.construction_count_1973` | yes | `Diaz/Mirror/construction_count_1973.lean` | done |  |
| `FourExp.construction_growth` | yes | `Diaz/Mirror/construction_growth.lean` | done |  |
| `FourExp.dvd_of_small_values` | yes | `Diaz/Mirror/dvd_of_small_values.lean` | done |  |
| `FourExp.expPoly_ne_zero` | yes | `Diaz/Mirror/expPoly_ne_zero.lean` | done |  |
| `FourExp.expPoly_value_le_derivs` | yes | `Diaz/Mirror/expPoly_value_le_derivs.lean` | done |  |
| `FourExp.expPoly_zero_count` | yes | `Diaz/Mirror/expPoly_zero_count.lean` | done |  |
| `FourExp.expPoly_zero_count_scaled` | yes | `Diaz/Mirror/expPoly_zero_count_scaled.lean` | done |  |
| `FourExp.extrapolation` | yes | `Diaz/Mirror/extrapolation.lean` | done |  |
| `FourExp.height_dvd_le` | yes | `Diaz/Mirror/height_dvd_le.lean` | done |  |
| `FourExp.nonvanishing_derivative` | yes | `Diaz/Mirror/nonvanishing_derivative.lean` | done |  |
| `FourExp.norm_to_polynomial_alg` | yes | `Diaz/Mirror/norm_to_polynomial_alg.lean` | done |  |
| `FourExp.rank_one_parametrization` | yes | `Diaz/Mirror/rank_one_parametrization.lean` | done |  |
| `FourExp.siegel_aux` | yes | `Diaz/Mirror/siegel_aux.lean` | done |  |
| `FourExp.small_irreducible_factor` | yes | `Diaz/Mirror/small_irreducible_factor.lean` | done |  |
| `FourExp.small_polynomials_of_counterexample` | yes | `Diaz/Mirror/small_polynomials_of_counterexample.lean` | done |  |
| `FourExp.transcendence_criterion` | yes | `Diaz/Mirror/transcendence_criterion.lean` | done |  |
| `FourExp.transcendence_criterion_continuous` | yes | `Diaz/Mirror/transcendence_criterion_continuous.lean` | done |  |
| `FourExp.trdeg_one_presentation` | yes | `Diaz/Mirror/trdeg_one_presentation.lean` | done |  |
| `FourExp.zero_count_arith` | yes | `Diaz/Mirror/zero_count_arith.lean` | done |  |
| `FourExp.zero_count_arith_poly` | yes | `Diaz/Mirror/zero_count_arith_poly.lean` | done |  |
| `FourExp.zero_count_degenerate` | yes | `Diaz/Mirror/zero_count_degenerate.lean` | done |  |
| `Schanuel.gelfond_schneider` | yes | `Diaz/Mirror/gelfond_schneider.lean` | done |  |
| `Schanuel.hermite_lindemann` | yes | `Diaz/Axioms.lean` | done |  |
| `Schanuel.lindemann_weierstrass` | yes | `Diaz/LindemannWeierstrass.lean` | done |  |
| `Schanuel.six_exponentials` | yes | `Diaz/Mirror/six_exponentials.lean` | done |  |
