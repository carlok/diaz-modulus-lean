# Diaz work never published on Prove2Me

Proofs written for the Diaz mission that exist nowhere public except here. Kept so
that nothing lives only on one machine. They are **not** part of the Lean library,
are not built by this repository, and have not been through the platform's checker.

## Status of each file

Every file here was built on 2026-09-12 or 2026-09-13 in the Prove2Me workspace — Lean
v4.33.1, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` — with no errors. None contains
`sorry` of its own; where a build reports one, it comes from an Open node the file imports,
and the table says so.

| File | What it proves | Depends on |
|---|---|---|
| `DZ_Transfer_check.lean` | A ring homomorphism of `ℂ` fixing `Q̄` pointwise preserves `Q̄`-linear independence, in both directions (`indep_transfer`). It carries a six-exponentials template at `u` to one at `Φ u`. | the mission definitions |
| `DZ_Sol_freering.lean` | A no-go theorem about a free polynomial ring in the two-variable cut-down `K[X, T]`. Pure polynomial algebra: it makes no claim about `ℂ`, about the conjecture, or about candidates. | Mathlib |
| `DZ_LEAFSPLIT_core.lean` | Elementary period split of the irrational-angle leaf, and the degeneracy of the same split on the real-generic leaf. Its own header says nothing in it is new. | the mission definitions |
| `DZ_ALIGNED_core.lean` | Splits the period-aligned leaf at the four-exponentials boundary, with an explicit witness `wC` on the norm-free side. | `DZ_LEAFSPLIT_core` |
| `DZ_FREE_core.lean` | On the period-aligned norm-free half, no admissible matrix exists, so the four-exponentials route is unavailable there (`no_admissible_matrix`, `fourExp_hypotheses_unsatisfiable`). | `DZ_LEAFSPLIT_core`, `DZ_ALIGNED_core` |
| `DZ_TRDEG_core.lean` | The transcendence-degree-one certificate for the period-aligned `norm_rat_mult` half. | `DZ_LEAFSPLIT_core`, `DZ_ALIGNED_core` |
| `DZ_TRDEG_solution.lean` | The period-aligned `norm_rat_mult` half, **from** four exponentials in transcendence degree one. | the Open node `DiazModulus.four_exponentials_trdeg_one` |
| `DZ_SPLITS_core.lean` | Splits (S) — no non-zero algebraic `γ` has `γ/(iπ)` a logarithm of an algebraic number — along the two coordinate axes of `γ`. | the mission definitions |
| `DZ_SPLITS_sub.lean` | The same split as a reduction: `recip_pi_not_log` from its real and imaginary halves. | the Open nodes `recip_pi_not_log_real_gamma`, `recip_pi_not_log_imag_gamma` |
| `DZ_Sol_offaxes_split.lean` | The off-axes leaf split on whether `Im u / π` is rational. | the mission definitions |
| `DZ_Sub_irrpi_reduction.lean` | The same split as a reduction to its two children. | the Open nodes `diaz_of_exp_real_generic`, `diaz_of_exp_not_real_irrational_angle` |
| `DZ_PIT_core.lean` | The residual leaf `…_period_free_pi_im_transcendental` is subsumed by the conjugate-pair crux. | `DZ_LEAFSPLIT_core` |
| `DZ_Sol_struct.lean` | The one genuine case split of the conjecture — whether `exp u` is real — and a reduction through reciprocals. | the mission definitions |
| `DZ_Sol_realgeneric.lean` | The real-generic leaf in arithmetic normal form. | the mission definitions |
| `DZ_LEAF2_normalform.lean` | A second, independently derived normal form of the same leaf. | `DZ_Sol_realgeneric`, `DZH_Sol_hermite_lindemann_holds` |
| `DZ_XCHECK_normalforms.lean` | Cross-check that the two normal forms agree. Evidence, not a result. | `DZ_LEAFSPLIT_core`, `DZ_LEAF2_normalform` |
| `DZH_Sol_hermite_lindemann_holds.lean` | The local copy of the Hermite–Lindemann proof, archived because `DZ_LEAF2_normalform` imports it. The library has its own port in `Diaz/HermiteLindemann.lean`. | the mission definitions |

Two of these need a word.

**`DZ_TRDEG_solution.lean` is conditional.** It imports the statement of
`DiazModulus.four_exponentials_trdeg_one`, which is Open on the platform, and its
`#print axioms` includes `sorryAx` for that reason alone: the file has no `sorry` of
its own. It proves that half *given* that theorem — a theorem of the literature,
due to Brownawell and Waldschmidt, that has never been formalised.

**`DZ_FREE_core.lean` proves a node held open on purpose.** A wrapper stating
`DiazModulus.aligned_norm_free_no_rational_log_matrix` verbatim and applying
`DiazFree.no_admissible_matrix` compiled on 2026-09-13 with axioms `propext`,
`Classical.choice`, `Quot.sound`. The two statements differ only in packaging: four
matrix entries against a `Fin 2 → Fin 2 → ℂ` matrix, and a named predicate `MemL3`
against its unfolding. Whether to submit it, and so close the node, is a decision that
has not been taken.

**`DZ_SPLITS_sub.lean` and `DZ_Sub_irrpi_reduction.lean` are reductions.** They prove a
parent from its children, and the children are Open; that is where their `sorryAx` comes
from. They close nothing until the children are proved.

## Building them

They target the platform's workspace, not this repository: they import
`Definitions.Def_DiazModulus` and, in one case, `Theorems.Thm_*`, neither of which
exists here, and they import each other as `Solutions.*`.

```bash
git clone https://github.com/prove2me/prove2me_workspace.git
cd prove2me_workspace
lake exe cache get
cp /path/to/archive/local/*.lean Solutions/
lake build Solutions.DZ_FREE_core
```

The mission definitions file comes from the platform's definition node for the
Diaz mission.

## One deviation from verbatim

`DZ_Sol_freering.lean` cited a private working document by file name in a comment.
That phrase now reads "an unpublished decomposition draft". The Lean code is
unchanged; that was checked mechanically before the file was written.

## What happens to these next

Each should end in one of three states: published on Prove2Me and then mirrored into
the library, ported into the library directly, or removed as having no value. They
are here so that the decision can be made later without anything being lost first.

## Everything else from the working folder

Added 2026-09-13 so that nothing from the mission exists only on one machine: every
remaining Lean file from the working folder, 177 of them. None is built here. Where a
comment named a private working document or path it was redacted; code was checked
unchanged. Sorted the same day by comparing each file's code, with comments and
whitespace removed, against `archive/prove2me/` and by reading the rest. No `sorry`
appears in code in any of them; the mentions a text search finds are in comments.

| Group | Files | What they are | Proposed fate |
|---|---:|---|---|
| E1 | 122 | code identical to an archived platform submission | remove |
| E2 | 17 | near-copies of an archived submission (an earlier draft, or a core file the submission inlined) | remove after a diff check |
| E3 | 3 | reductions of an Open node to its children, not archived anywhere else | keep; candidates to publish |
| E4 | 3 | development found nowhere else | keep; candidates to publish or port |
| E5 | 8 | statement stubs, every declaration `sorry` | remove |
| E6 | 13 | `#print axioms` audits of other files | remove |
| E7 | 11 | probes and type-checks of statements | remove |

Nothing has been removed. The proposals wait for a decision.

### E3 — reductions

| File | Reduces |
|---|---|
| `DZ_Rep_C_exp_not_real.lean` | `diaz_of_exp_not_real`, via the off-axes leaf, the six-exponentials no-go and Hermite–Lindemann |
| `DZ_SPLITS_reduction.lean` | `recip_pi_not_log`, from its real-γ and imaginary-γ halves |
| `DZ_TRDEG_submission.lean` | the rationally aligned case, from `four_exponentials_trdeg_one` (imports the local `DZ_TRDEG_core`) |

### E4 — development found nowhere else

| File | Content |
|---|---|
| `DZ_Sol_obstruction_shape.lean` | what a transfer homomorphism Φ : ℂ → ℂ must fail to do: rigidity of ring endomorphisms fixing ℝ, and which candidate hypotheses survive Φ (460 lines) |
| `DZG_gamma_shape.lean` | elementary shape facts for the two axis halves of `recip_pi_not_log`: modulus one and not a root of unity on the real half, positive real ≠ 1 on the imaginary half |
| `DZ_L2F_core.lean` | one more generation under the period-free child of the irrational-angle leaf, dropping the `r ≠ 0` clause from period alignment (354 lines; imports the local `DZ_LEAFSPLIT_core`) |

### E2 — near-copies

| File | Closest archived submission |
|---|---|
| `DZF_FLOOR.lean` | `pi_sq_transcendental_of_real_gamma` |
| `DZF_SUB_floor.lean` | `pi_sq_transcendental_of_real_gamma` |
| `DZG_not_root_of_unity.lean` | `recip_pi_exp_value_not_root_of_unity` |
| `DZ_BRIDGE_angular.lean` | `candidate_exp_angularTriple_transcendental` |
| `DZ_BRIDGE_axes.lean` | `diaz_on_axes_of_hermite_lindemann` |
| `DZ_BRIDGE_dict.lean` | `diaz_locus_dictionary` |
| `DZ_BRIDGE_indep3.lean` | `candidate_one_self_conj_linearIndependent` |
| `DZ_FB2_angular.lean` | `candidate_exp_angularTriple_transcendental` |
| `DZ_FB2_rigidity.lean` | `candidate_orbit_and_plane_rigidity` |
| `DZ_LINE_core.lean` | `no_algebraic_generalized_line` |
| `DZ_MULT_core.lean` | `candidate_multiplier_module` |
| `DZ_SAT_core.lean` | `candidate_one_log_saturation` |
| `DZ_Sol_indep.lean` | `candidate_one_self_conj_linearIndependent` |
| `DZ_Sol_indep_platform.lean` | `candidate_one_self_conj_linearIndependent` |
| `DZ_Sol_nogo.lean` | `sixExponentials_cannot_refute_candidate` |
| `DZ_Sol_transfer_general.lean` | `candidate_indistinguishable_by_coeff` |
| `XX_KERNEL_core.lean` | `candidate_vanishing_ideal` |

### E5, E6, E7

Stubs: `DZ_ALIGNED_stmts`, `DZ_BRIDGE_stmt`, `DZ_L2F_stmts`, `DZ_LEAFSPLIT_stmts`, `DZ_MINE_stmts`, `DZ_POLAR2_stmts_diaz`, `DZ_POLAR2_stmts_dm`, `DZ_SPLITS_stmts`.

Axiom audits: `DZF_FLOOR_axioms`, `DZG_gamma_shape_axioms`, `DZ_ALIGNED_axioms`, `DZ_Chk_offaxes`, `DZ_FREE_axioms`, `DZ_L2F_axioms`, `DZ_LEAF2_check`, `DZ_LEAFSPLIT_axioms`, `DZ_LINE_axioms`, `DZ_PIT_check`, `DZ_SFEROOT_axioms`, `DZ_TRDEG_axioms`, `XX_KERNEL_axioms`.

Probes and checks: `DZ_BRIDGE_axcheck`, `DZ_FREE_stmt`, `DZ_Gen2_check`, `DZ_Gen3_check`, `DZ_Gen4_check`, `DZ_Gen5_check`, `DZ_POLAR2_check`, `DZ_POLAR2_work`, `DZ_SFEROOT_probe`, `DZ_Split_check`, `XX_probe`.

### E1 — identical to an archived submission

<details><summary>122 files</summary>

| File | Identical to |
|---|---|
| `DZC_Sol_exists_transcendental_on_circle.lean` | `archive/prove2me/Diaz.exists_transcendental_on_circle__e5b16731.lean` |
| `DZI_Sol_candidate_indistinguishable.lean` | `archive/prove2me/Diaz.candidate_indistinguishable__7f16a044.lean` |
| `DZN_Sol_four_nodes_candidate.lean` | `archive/prove2me/Diaz.four_nodes_candidate__23318a9a.lean` |
| `DZQ_Sol_exists_transcendental_on_circle_Qbar.lean` | `archive/prove2me/Diaz.exists_transcendental_on_circle_Qbar__c0e6edef.lean` |
| `DZT_Sol_transcendental_of_candidate.lean` | `archive/prove2me/Diaz.transcendental_of_candidate__ee5abf42.lean` |
| `DZV_Sol_candidate_no_vanishing_coeff_Qbar.lean` | `archive/prove2me/Diaz.candidate_no_vanishing_coeff_Qbar__5ba6e7fa.lean` |
| `DZ_ALIGNED_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned__604912e1.lean` |
| `DZ_BRIDGE_sub_angular.lean` | `archive/prove2me/DiazModulus.candidate_exp_angularTriple_transcendental__9b47d154.lean` |
| `DZ_BRIDGE_sub_axes.lean` | `archive/prove2me/DiazModulus.diaz_on_axes_of_hermite_lindemann__e99565af.lean` |
| `DZ_BRIDGE_sub_dict.lean` | `archive/prove2me/DiazModulus.diaz_locus_dictionary__8338c3f3.lean` |
| `DZ_BRIDGE_sub_indep3.lean` | `archive/prove2me/DiazModulus.candidate_one_self_conj_linearIndependent__6a11752a.lean` |
| `DZ_CLASS_Sol_classification.lean` | `archive/prove2me/Diaz.rational_singular_subspace_classification__b04197c2.lean` |
| `DZ_CLASS_Sol_quadric.lean` | `archive/prove2me/Diaz.rational_subspace_quadric_ratios__a8a85140.lean` |
| `DZ_EP_S1.lean` | `archive/prove2me/Diaz.elliptic_axis_alignment__4bef96a1.lean` |
| `DZ_EP_S2.lean` | `archive/prove2me/Diaz.elliptic_torsion_excluded__0102f922.lean` |
| `DZ_EP_S3.lean` | `archive/prove2me/Diaz.elliptic_plane_rigidity__2216a8e9.lean` |
| `DZ_EP_S4.lean` | `archive/prove2me/Diaz.elliptic_chords_norm_one__eb6bdba8.lean` |
| `DZ_EP_S5.lean` | `archive/prove2me/Diaz.rank_one_six_exponentials__786986c5.lean` |
| `DZ_EP_S6.lean` | `archive/prove2me/Diaz.padic_conjugate_planes__ce4d5028.lean` |
| `DZ_FB2_sub_angular.lean` | `archive/prove2me/DiazModulus.candidate_exp_angularTriple_transcendental__b96ecb31.lean` |
| `DZ_FB2_sub_rigidity.lean` | `archive/prove2me/DiazModulus.candidate_orbit_and_plane_rigidity__7e5d1c32.lean` |
| `DZ_FREE_submit.lean` | `archive/prove2me/DiazModulus.aligned_norm_free_no_rational_log_matrix__ecd73626.lean` |
| `DZ_L2F_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle_period_free__b97bcc8a.lean` |
| `DZ_LEAFSPLIT_proofC.lean` | `archive/prove2me/DiazModulus.recip_pi_log_of_period_aligned__2e41ba37.lean` |
| `DZ_LEAFSPLIT_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle__e876b4ed.lean` |
| `DZ_LEGACY_Sol_cor2.lean` | `archive/prove2me/Diaz.diaz_2007_cor2_P1__e13b75b0.lean` |
| `DZ_LEGACY_Sol_four_exp.lean` | `archive/prove2me/Diaz.four_exp_trdeg_one__9add7c18.lean` |
| `DZ_LEGACY_Sol_log_modulus.lean` | `archive/prove2me/Diaz.log_modulus_forces_independence__06461702.lean` |
| `DZ_LEGACY_Sol_pi_sq.lean` | `archive/prove2me/Diaz.nonreal_two_point_fibre_pi_sq__676710c4.lean` |
| `DZ_LEGACY_Sol_quadric.lean` | `archive/prove2me/Diaz.quadric_trdeg_two__f3bad266.lean` |
| `DZ_LINE_sub.lean` | `archive/prove2me/DiazModulus.no_algebraic_generalized_line__4e2d5085.lean` |
| `DZ_MULT_sub.lean` | `archive/prove2me/DiazModulus.candidate_multiplier_module__9c460adb.lean` |
| `DZ_NF_sub.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned_norm_free__9e630e2d.lean` |
| `DZ_P20D_S1.lean` | `archive/prove2me/Diaz.trace_norm_quadratic_algebra__5a95accc.lean` |
| `DZ_P20D_S2.lean` | `archive/prove2me/Diaz.involution_alignment__1e3d21ed.lean` |
| `DZ_P20D_S3.lean` | `archive/prove2me/Diaz.salem_quartic_relations__11a10a41.lean` |
| `DZ_P20D_S4.lean` | `archive/prove2me/Diaz.equal_real_parts__a1f145dc.lean` |
| `DZ_P20D_S5.lean` | `archive/prove2me/Diaz.log_circles_alignment__8238c9a5.lean` |
| `DZ_P20D_S6.lean` | `archive/prove2me/Diaz.quadratic_algebra_distance__b742c757.lean` |
| `DZ_P20D_S8.lean` | `archive/prove2me/Diaz.indep_quadruple__feeb0e4e.lean` |
| `DZ_P21B_Sol_Gmat_projection.lean` | `archive/prove2me/Diaz.Gmat_projection__5598669d.lean` |
| `DZ_P21B_Sol_Hmat_pencil_normal_form.lean` | `archive/prove2me/Diaz.Hmat_pencil_normal_form__a04400b4.lean` |
| `DZ_P21B_Sol_Hmat_real_congr.lean` | `archive/prove2me/Diaz.Hmat_real_congr__9fc9018a.lean` |
| `DZ_P21B_Sol_balanced_jet_mem_iff.lean` | `archive/prove2me/Diaz.balanced_jet_mem_iff__22a15979.lean` |
| `DZ_P21B_Sol_binary_form_eq_zero.lean` | `archive/prove2me/Diaz.binary_form_eq_zero__9cd387c4.lean` |
| `DZ_P21B_Sol_det_add_two.lean` | `archive/prove2me/Diaz.det_add_two__217872be.lean` |
| `DZ_P21B_Sol_det_pencil_eq_conic.lean` | `archive/prove2me/Diaz.det_pencil_eq_conic__38b756ef.lean` |
| `DZ_P21B_Sol_forced_plane_exhaustion.lean` | `archive/prove2me/Diaz.forced_plane_exhaustion__98def6d7.lean` |
| `DZ_P21B_Sol_outer_multiplier_param.lean` | `archive/prove2me/Diaz.outer_multiplier_param__c153d0e4.lean` |
| `DZ_P21B_Sol_rank_one_of_det_eq_zero.lean` | `archive/prove2me/Diaz.rank_one_of_det_eq_zero__905c582b.lean` |
| `DZ_P21B_Sol_roy_conic_implies_empty.lean` | `archive/prove2me/Diaz.roy_conic_implies_empty__d6e62bc4.lean` |
| `DZ_P21B_Sol_sq_eq_zero_of_trace_eq_zero.lean` | `archive/prove2me/Diaz.sq_eq_zero_of_trace_eq_zero__5479a461.lean` |
| `DZ_P21B_Sol_zpow_mem_iff.lean` | `archive/prove2me/Diaz.zpow_mem_iff__132c3881.lean` |
| `DZ_P21N_Sol_algebraic_of_axis.lean` | `archive/prove2me/Diaz.algebraic_of_axis__74807965.lean` |
| `DZ_P21N_Sol_indep_of_not_axis.lean` | `archive/prove2me/Diaz.indep_of_not_axis__39195b0f.lean` |
| `DZ_P21N_Sol_locus_stable.lean` | `archive/prove2me/Diaz.locus_stable__fc6ee23f.lean` |
| `DZ_P21N_Sol_normal_form.lean` | `archive/prove2me/Diaz.normal_form__0faa3a3f.lean` |
| `DZ_P21N_Sol_normalization.lean` | `archive/prove2me/Diaz.normalization_not_invariant__3b963972.lean` |
| `DZ_P21P_Sol_indep_of_algebraic_product.lean` | `archive/prove2me/Diaz.indep_of_algebraic_product__c497890a.lean` |
| `DZ_P21P_Sol_no_holo_stab.lean` | `archive/prove2me/Diaz.no_holo_stab__6fde44fd.lean` |
| `DZ_P21P_Sol_order_quantisation.lean` | `archive/prove2me/Diaz.order_quantisation__32b58ff3.lean` |
| `DZ_P21P_Sol_period_plane_norm.lean` | `archive/prove2me/Diaz.period_plane_norm__ee4bdc76.lean` |
| `DZ_P21P_Sol_q_translate_unique.lean` | `archive/prove2me/Diaz.q_translate_unique__e77f481c.lean` |
| `DZ_P21P_Sol_real_quantisation.lean` | `archive/prove2me/Diaz.real_quantisation__6a313c32.lean` |
| `DZ_P21P_Sol_torsion_dichotomy.lean` | `archive/prove2me/Diaz.torsion_dichotomy__9d4ab063.lean` |
| `DZ_P21R_Sol_axis.lean` | `archive/prove2me/Diaz.axis_triple_indep__b1a54c1d.lean` |
| `DZ_P21R_Sol_conjline.lean` | `archive/prove2me/Diaz.conj_stable_line_generator__191d4008.lean` |
| `DZ_P21R_Sol_expratmul.lean` | `archive/prove2me/Diaz.exp_ratMul_isAlgebraic__c1dbf720.lean` |
| `DZ_P21R_Sol_fibre.lean` | `archive/prove2me/Diaz.fibre_at_most_two__b59411a9.lean` |
| `DZ_P21R_Sol_orbit.lean` | `archive/prove2me/Diaz.orbit_of_candidate__bf6a6436.lean` |
| `DZ_P21R_Sol_planesinter.lean` | `archive/prove2me/Diaz.conj_planes_inter__32f573ae.lean` |
| `DZ_P21R_Sol_planesmul.lean` | `archive/prove2me/Diaz.conj_planes_mul__0f1df5c2.lean` |
| `DZ_P21R_Sol_powerbound.lean` | `archive/prove2me/Diaz.power_support_interval_bound__09be47be.lean` |
| `DZ_P21R_Sol_quot.lean` | `archive/prove2me/Diaz.quot_isAlgebraic_of_algebraic_dist__0ac19860.lean` |
| `DZ_P21R_Sol_sdiff.lean` | `archive/prove2me/Diaz.second_difference_mem__87d22de2.lean` |
| `DZ_P21R_Sol_sumfree.lean` | `archive/prove2me/Diaz.power_support_sumfree__c519833e.lean` |
| `DZ_PIT_sub.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle_period_free_pi_im_transcendental__2a540a45.lean` |
| `DZ_POLAR2_Sol_exp_ratio_pow_eq_one_iff.lean` | `archive/prove2me/Diaz.exp_ratio_pow_eq_one_iff__6f2f48f8.lean` |
| `DZ_POLAR2_Sol_failure_rational_multiple_rigid.lean` | `archive/prove2me/Diaz.failure_rational_multiple_rigid__ebe064ae.lean` |
| `DZ_POLAR2_Sol_fibre_second_point_is_conj.lean` | `archive/prove2me/Diaz.fibre_second_point_is_conj__287dc84f.lean` |
| `DZ_POLAR2_Sol_leaf_iff_one.lean` | `archive/prove2me/DiazModulus.leaf_iff_one__4bda2623.lean` |
| `DZ_POLAR2_Sol_period_plane_classification.lean` | `archive/prove2me/Diaz.period_plane_classification__1b2f4b75.lean` |
| `DZ_POLAR2_Sol_pi_sq_transcendental.lean` | `archive/prove2me/DiazModulus.pi_sq_transcendental__21abc5e3.lean` |
| `DZ_POLAR2_Sol_plane_normSq_algebraic_iff.lean` | `archive/prove2me/Diaz.plane_normSq_algebraic_iff__f5aefc43.lean` |
| `DZ_POLAR2_Sol_quantisation_orbit.lean` | `archive/prove2me/Diaz.quantisation_orbit_iff_re_ne_zero__ffc08767.lean` |
| `DZ_POLAR2_Sol_two_failures.lean` | `archive/prove2me/Diaz.two_failures_give_algebraic_log_product__cf34d064.lean` |
| `DZ_ROU_sub.lean` | `archive/prove2me/DiazModulus.recip_pi_exp_value_not_root_of_unity__3f32a319.lean` |
| `DZ_Rep_A_exp_real.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_real__3c68a103.lean` |
| `DZ_Rep_B_exp_ne_one.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_ne_one__61a82beb.lean` |
| `DZ_SAT_sub.lean` | `archive/prove2me/DiazModulus.candidate_one_log_saturation__8b9adfc3.lean` |
| `DZ_SFEROOT_sub.lean` | `archive/prove2me/DiazModulus.diaz_of_sfe__9d08897b.lean` |
| `DZ_SFE_sub.lean` | `archive/prove2me/DiazModulus.recip_pi_not_log_of_sfe__350525c2.lean` |
| `DZ_S_sub_aligned.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle_period_aligned__b28eb143.lean` |
| `DZ_S_sub_leaf.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_irrational_angle_period_free_pi_im_algebraic__c09daafc.lean` |
| `DZ_S_sub_route.lean` | `archive/prove2me/DiazModulus.recip_pi_log_of_pi_im_algebraic__f254bbbf.lean` |
| `DZ_Sol_angular.lean` | `archive/prove2me/DiazModulus.candidate_exp_angularTriple_transcendental__212c5c15.lean` |
| `DZ_Sol_conj_eq_norm_sq_div.lean` | `archive/prove2me/DiazModulus.conj_eq_norm_sq_div__0a869173.lean` |
| `DZ_Sol_diaz_on_axes.lean` | `archive/prove2me/DiazModulus.diaz_on_axes_of_hermite_lindemann__67fef296.lean` |
| `DZ_Sol_iff_no_candidate.lean` | `archive/prove2me/DiazModulus.diaz_iff_no_candidate__dc7491db.lean` |
| `DZ_Sol_logAlg_conj_stable.lean` | `archive/prove2me/DiazModulus.logAlg_conj_stable__34218734.lean` |
| `DZ_Sub_cibc.lean` | `archive/prove2me/Diaz.candidate_indistinguishable_by_coeff__311d5009.lean` |
| `DZ_Sub_cti.lean` | `archive/prove2me/Diaz.coeff_transfer_iff__ed698637.lean` |
| `DZ_Sub_expI.lean` | `archive/prove2me/DiazModulus.exp_I_transcendental__d191bb3f.lean` |
| `DZ_Sub_gen2_A.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_real_self_real__63f2aa38.lean` |
| `DZ_Sub_gen2_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_real__bad5d3a4.lean` |
| `DZ_Sub_gen3_A.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_eq_one__83e1823c.lean` |
| `DZ_Sub_gen3_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_real_self_not_real__4f3ae977.lean` |
| `DZ_Sub_gen4_A.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_real_pure_imaginary__0040c771.lean` |
| `DZ_Sub_gen4_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_ne_one__6ebb58c1.lean` |
| `DZ_Sub_gen5_A.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real_on_axes__809f9205.lean` |
| `DZ_Sub_gen5_reduction.lean` | `archive/prove2me/DiazModulus.diaz_of_exp_not_real__eca98159.lean` |
| `DZ_Sub_indep.lean` | `archive/prove2me/DiazModulus.candidate_one_self_conj_linearIndependent__a0bdf5ab.lean` |
| `DZ_Sub_nogo.lean` | `archive/prove2me/DiazModulus.sixExponentials_cannot_refute_candidate__c6214a32.lean` |
| `DZ_Sub_pi.lean` | `archive/prove2me/DiazModulus.pi_transcendental__8da195d8.lean` |
| `DZ_Sub_split_reduction.lean` | `archive/prove2me/DiazModulus.diaz_modulus_conjecture__9b0f6518.lean` |
| `DZ_Sub_transfer.lean` | `archive/prove2me/DiazModulus.ringHom_preserves_linearIndependent__dde08781.lean` |
| `SCH_diaz_of_schanuel.lean` | `archive/prove2me/DiazModulus.diaz_of_schanuel__9f52c1d5.lean` |
| `SFE_diaz_of_sfe_hl.lean` | `archive/prove2me/DiazModulus.diaz_of_strongFourExponentials_and_hermite_lindemann__9f0385db.lean` |
| `STZ_Steinitz.lean` | `archive/prove2me/Diaz.exists_ringHom_of_transcendental__67175e78.lean` |
| `XX_SUB_im.lean` | `archive/prove2me/DiazModulus.candidate_im_transcendental__20ae0786.lean` |
| `XX_SUB_kernel.lean` | `archive/prove2me/DiazModulus.candidate_vanishing_ideal__45344a3e.lean` |
| `XX_SUB_re.lean` | `archive/prove2me/DiazModulus.candidate_re_transcendental__733c1582.lean` |

</details>
