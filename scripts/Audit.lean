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
