# Mirror checklist — Diaz

What this repository holds of the Diaz mission's proved results, and what is
left to port. Regenerated from the live Prove2Me board, the platform archive and
the library sources; do not edit rows by hand.

Two tiers.

- **Archive** — `archive/prove2me/`: every accepted submission, verbatim from the
  platform. Complete: 132 of 132 Proved nodes. Not built; see the
  README there.
- **Library** — `Diaz/`: results ported to compile against this repository's
  pinned Mathlib, checked by CI. This checklist tracks it.

Status on 2026-09-12: **58** of 132 in the library.
Of the rest, **27** marked high priority, **27**
normal, **19** low (folklore, scaffolding, or an elementary
case), **1** skipped as defective.

The priority column is a judgement, not a measurement. *High* means a result the
companion note or its manuscript relies on, or a family of results that is the
only formal record of an argument. *Low* means porting it adds little a reader
would miss. Promote anything you disagree with.

The unported *Open* nodes — reductions proved from their children, or
statements deliberately left open — are not listed; they have no accepted proof
to mirror.

| Node | Archived | In library | Priority | Note |
|---|---|---|---|---|
| `Diaz.Exp0_add` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Exp0_ne_zero` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Exp0_pow_eq_one_iff` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Exp0_swap_conj` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.Gmat_projection` | yes | — | normal |  |
| `Diaz.Hmat_pencil_normal_form` | yes | — | normal |  |
| `Diaz.Hmat_real_congr` | yes | — | normal |  |
| `Diaz.Hmat_transfer` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.algebraic_of_axis` | yes | — | low |  |
| `Diaz.axis_triple_indep` | yes | — | normal |  |
| `Diaz.balanced_jet_mem_iff` | yes | — | normal |  |
| `Diaz.binary_form_eq_zero` | yes | — | low |  |
| `Diaz.candidate_indistinguishable` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.candidate_indistinguishable_by_coeff` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.candidate_no_vanishing_coeff_Qbar` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.coeff_transfer` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.coeff_transfer_iff` | yes | — | normal |  |
| `Diaz.conj_combination_off_rays` | yes | — | high |  |
| `Diaz.conj_comm` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.conj_coords` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.conj_mem_hull` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.conj_not_linear_hull` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.conj_not_linear_of_I` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.conj_planes_inter` | yes | — | normal |  |
| `Diaz.conj_planes_mul` | yes | — | normal |  |
| `Diaz.conj_stable_line_generator` | yes | — | normal |  |
| `Diaz.det_Hmat` | yes | `Diaz/Rigidity.lean` | done |  |
| `Diaz.det_add_two` | yes | — | low |  |
| `Diaz.det_pencil_eq_conic` | yes | `Diaz/Pencil.lean` | done |  |
| `Diaz.diaz_2007_cor2_P1` | yes | — | high |  |
| `Diaz.elliptic_axis_alignment` | yes | — | high |  |
| `Diaz.elliptic_chords_norm_one` | yes | — | high |  |
| `Diaz.elliptic_plane_rigidity` | yes | — | high |  |
| `Diaz.elliptic_torsion_excluded` | yes | — | high |  |
| `Diaz.eqOn_hull` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.equal_real_parts` | yes | — | normal |  |
| `Diaz.exists_conj_intertwining` | yes | `Diaz/Transfer.lean` | done |  |
| `Diaz.exists_ringHom_of_transcendental` | yes | `Diaz/Palomar.lean` | done |  |
| `Diaz.exists_transcendental_on_circle` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.exists_transcendental_on_circle_Qbar` | yes | `Diaz/Instantiation.lean` | done |  |
| `Diaz.exp_ratMul_isAlgebraic` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.exp_ratio_pow_eq_one_iff` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.failure_rational_multiple_rigid` | yes | — | normal |  |
| `Diaz.fibre_at_most_two` | yes | `Diaz/Fibre.lean` | done |  |
| `Diaz.fibre_second_point_is_conj` | yes | — | normal |  |
| `Diaz.forced_plane_exhaustion` | yes | — | normal |  |
| `Diaz.four_exp_trdeg_one` | yes | — | high |  |
| `Diaz.four_nodes` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.four_nodes_candidate` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.indep` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.indep_of_algebraic_product` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.indep_of_not_axis` | yes | — | low |  |
| `Diaz.indep_quadruple` | yes | — | normal |  |
| `Diaz.indep_three` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.involution_alignment` | yes | — | normal |  |
| `Diaz.isAlgebraic_two_rpow` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.locus_stable` | yes | — | low |  |
| `Diaz.log_circles_alignment` | yes | — | normal |  |
| `Diaz.log_modulus_forces_independence` | yes | — | normal |  |
| `Diaz.model_falsifies` | yes | `Diaz/Exponential.lean` | done |  |
| `Diaz.no_holo_stab` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.no_vanishing_coeff` | yes | `Diaz/Rigidity.lean` | done |  |
| `Diaz.nonreal_two_point_fibre_pi_sq` | yes | — | high |  |
| `Diaz.norm_mem_iff` | yes | `Diaz/Model.lean` | done |  |
| `Diaz.normal_form` | yes | — | normal |  |
| `Diaz.normalization_not_invariant` | yes | — | normal |  |
| `Diaz.not_on_axes` | yes | `Diaz/Nodes.lean` | done |  |
| `Diaz.orbit_of_candidate` | yes | — | normal |  |
| `Diaz.order_quantisation` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.outer_multiplier_param` | yes | — | normal |  |
| `Diaz.padic_conjugate_planes` | yes | — | high |  |
| `Diaz.pair_dichotomy_exclusive` | yes | — | high |  |
| `Diaz.period_plane_classification` | yes | — | high |  |
| `Diaz.period_plane_norm` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.plane_normSq_algebraic_iff` | yes | — | high |  |
| `Diaz.power_support_interval_bound` | yes | — | normal |  |
| `Diaz.power_support_sumfree` | yes | — | normal |  |
| `Diaz.q_translate_unique` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.quadratic_algebra_distance` | yes | — | high |  |
| `Diaz.quadric_trdeg_two` | yes | — | normal |  |
| `Diaz.quantisation_orbit_iff_re_ne_zero` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.quot_isAlgebraic_of_algebraic_dist` | yes | — | normal |  |
| `Diaz.rank_one_of_det_eq_zero` | yes | — | low |  |
| `Diaz.rank_one_six_exponentials` | yes | — | high |  |
| `Diaz.rational_singular_subspace_classification` | yes | — | high |  |
| `Diaz.rational_subspace_quadric_ratios` | yes | — | high |  |
| `Diaz.real_quantisation` | yes | `Diaz/Quantisation.lean` | done |  |
| `Diaz.roy_conic_implies_empty` | yes | `Diaz/Pencil.lean` | done |  |
| `Diaz.salem_quartic_relations` | yes | — | high |  |
| `Diaz.second_difference_mem` | yes | — | low |  |
| `Diaz.sq_eq_zero_of_trace_eq_zero` | yes | — | low |  |
| `Diaz.torsion_dichotomy` | yes | `Diaz/P21P.lean` | done |  |
| `Diaz.trace_norm_quadratic_algebra` | yes | — | high |  |
| `Diaz.transcendental_of_candidate` | yes | `Diaz/Closure.lean` | done |  |
| `Diaz.two_failures_give_algebraic_log_product` | yes | — | high |  |
| `Diaz.zpow_mem_iff` | yes | — | low |  |
| `DiazModulus.candidate_distance_transcendental` | yes | `Diaz/Distance.lean` | done |  |
| `DiazModulus.candidate_exp_angularTriple_transcendental` | yes | — | normal |  |
| `DiazModulus.candidate_im_transcendental` | yes | `Diaz/Kernel.lean` | done |  |
| `DiazModulus.candidate_multiplier_module` | yes | `Diaz/Multipliers.lean` | done |  |
| `DiazModulus.candidate_no_real_algebraic_line` | yes | `Diaz/CheapLine.lean` | done |  |
| `DiazModulus.candidate_one_log_saturation` | yes | `Diaz/Multipliers.lean` | done |  |
| `DiazModulus.candidate_one_self_conj_linearIndependent` | yes | — | normal |  |
| `DiazModulus.candidate_orbit_and_plane_rigidity` | yes | — | high |  |
| `DiazModulus.candidate_re_transcendental` | yes | `Diaz/Kernel.lean` | done |  |
| `DiazModulus.candidate_vanishing_ideal` | yes | `Diaz/Kernel.lean` | done |  |
| `DiazModulus.conj_eq_norm_sq_div` | yes | `Diaz/Multipliers.lean` | done |  |
| `DiazModulus.diaz_iff_no_candidate` | yes | — | high |  |
| `DiazModulus.diaz_locus_dictionary` | yes | — | high |  |
| `DiazModulus.diaz_of_exp_eq_one` | yes | — | low |  |
| `DiazModulus.diaz_of_exp_not_real_on_axes` | yes | — | low |  |
| `DiazModulus.diaz_of_exp_real_pure_imaginary` | yes | — | low |  |
| `DiazModulus.diaz_of_exp_real_self_real` | yes | — | low |  |
| `DiazModulus.diaz_of_schanuel` | yes | — | high |  |
| `DiazModulus.diaz_of_sfe` | yes | `Diaz/SFE.lean` | done |  |
| `DiazModulus.diaz_of_strongFourExponentials_and_hermite_lindemann` | yes | `Diaz/SFE.lean` | done |  |
| `DiazModulus.diaz_on_axes_of_hermite_lindemann` | yes | — | low |  |
| `DiazModulus.exp_I_transcendental` | yes | — | low |  |
| `DiazModulus.hermite_lindemann_holds` | yes | `Diaz/HermiteLindemann.lean` | done |  |
| `DiazModulus.leaf_iff_one` | yes | `Diaz/Quantisation.lean` | done |  |
| `DiazModulus.logAlg_conj_stable` | yes | `Diaz/Multipliers.lean` | done |  |
| `DiazModulus.no_algebraic_generalized_line` | yes | `Diaz/Line.lean` | done |  |
| `DiazModulus.pi_sq_transcendental` | yes | — | low |  |
| `DiazModulus.pi_sq_transcendental_of_real_gamma` | yes | — | skip (defective) | vacuous: its conclusion is proved unconditionally by pi_sq_transcendental |
| `DiazModulus.pi_transcendental` | yes | — | low |  |
| `DiazModulus.recip_pi_exp_value_not_root_of_unity` | yes | — | high |  |
| `DiazModulus.recip_pi_log_of_period_aligned` | yes | — | high |  |
| `DiazModulus.recip_pi_log_of_pi_im_algebraic` | yes | — | high |  |
| `DiazModulus.recip_pi_not_log_of_sfe` | yes | — | high |  |
| `DiazModulus.ringHom_preserves_linearIndependent` | yes | — | low |  |
| `DiazModulus.sixExponentials_cannot_refute_candidate` | yes | `Diaz/NoGo.lean` | done |  |
| `DiazModulus.six_exponentials` | yes | — | low |  |
