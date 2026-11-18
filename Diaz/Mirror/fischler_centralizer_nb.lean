/-
Mirrored from Prove2Me: `DiazModulus.fischler_centralizer_nb`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fischler_centralizer_nb__fb96badd.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.fischler_prop_5_5
import Diaz.Mirror.remond_commuting_subspaces

namespace Diaz

open Complex ComplexConjugate

/-! # Fischler 2001, the N.B. after Prop. 5.5

The hypothesis says that no hyperplane of matrices defined over `Q̄` contains both `M` and the identity. Suppose
`2·dim C(M) ≥ n² + 2`, where `C(M)` is the centraliser of `M`. Fischler's Prop. 5.5 (which needs only the entries
of `M` in `ℒ̃`) gives subspaces `U`, `V`, each spanned by its algebraic matrices, with `dim U + dim V ≥ n² + 2` and
`Tr(M[A, B]) = 0` for every `A ∈ U`, `B ∈ V`. For algebraic `A ∈ U`, `B ∈ V`, the commutator `K = AB − BA` is
algebraic with `Tr K = 0`, and `Tr(MK) = 0`; so the hyperplane `{N : Tr(NK) = 0}` is defined over `Q̄` and
contains `M` and the identity, and the hypothesis (applied to the transpose of `K`) forces `K = 0`. The maps
`B ↦ AB − BA` and `A ↦ AB − BA` are linear, so vanishing on algebraic spanning sets extends to all of `V`, then
of `U`: every element of `U` commutes with every element of `V`. Rémond's bound on commuting subspaces,
`dim U + dim V ≤ n² + 1`, gives the contradiction. -/

namespace RC9_F12
theorem fischler_centralizer_nb_vanish_span {E F : Type*} [AddCommGroup E] [Module ℂ E] [AddCommGroup F] [Module ℂ F]
    (f : E →ₗ[ℂ] F) {s : Set E} (h : ∀ x ∈ s, f x = 0) : ∀ x ∈ Submodule.span ℂ s, f x = 0 :=
  fun _x hx =>
  LinearMap.mem_ker.mp (Submodule.span_le.mpr (fun y hy => LinearMap.mem_ker.mpr (h y hy)) hx)

theorem fischler_centralizer_nb_comm_alg {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ) (hA : ∀ i j, A i j ∈ Qbar)
    (hB : ∀ i j, B i j ∈ Qbar) (i j : Fin n) : (A * B - B * A) i j ∈ Qbar := by
  rw [Matrix.sub_apply, Matrix.mul_apply, Matrix.mul_apply]
  exact Qbar.sub_mem (Qbar.sum_mem fun k _ => Qbar.mul_mem (hA i k) (hB k j))
    (Qbar.sum_mem fun k _ => Qbar.mul_mem (hB i k) (hA k j))

/-- The N.B. hypothesis replaces Q̄-freeness: an algebraic commutator `K` with `Tr(MK) = 0` vanishes,
because `{N : Tr(NK) = 0}` is a hyperplane defined over Q̄ containing `M` and `Id` (`Tr K = 0`). -/
theorem fischler_centralizer_nb_eq_zero_of_trace {n : ℕ} (M : Matrix (Fin n) (Fin n) ℂ)
    (hhyp : ∀ c : Matrix (Fin n) (Fin n) ℂ, (∀ i j, c i j ∈ Qbar) →
      ∑ i, ∑ j, c i j * M i j = 0 → ∑ i, c i i = 0 → c = 0)
    (A B : Matrix (Fin n) (Fin n) ℂ) (hA : ∀ i j, A i j ∈ Qbar) (hB : ∀ i j, B i j ∈ Qbar)
    (htr : (M * (A * B - B * A)).trace = 0) : A * B - B * A = 0 := by
  have h := hhyp (A * B - B * A).transpose (fun i j => fischler_centralizer_nb_comm_alg A B hA hB j i) ?_ ?_
  · simpa using congrArg Matrix.transpose h
  · rw [← htr, Matrix.trace]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Matrix.diag_apply, Matrix.mul_apply]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [Matrix.transpose_apply, mul_comm]
  · have : (A * B - B * A).trace = 0 := by
      rw [Matrix.trace_sub, Matrix.trace_mul_comm, sub_self]
    simpa [Matrix.trace] using this

end RC9_F12

open RC9_F12 in
theorem fischler_centralizer_nb {n : ℕ} (M : Matrix (Fin n) (Fin n) ℂ)
    (hM : ∀ i j, M i j ∈ LogAlgTilde)
    (hhyp : ∀ c : Matrix (Fin n) (Fin n) ℂ, (∀ i j, c i j ∈ Qbar) →
      ∑ i, ∑ j, c i j * M i j = 0 → ∑ i, c i i = 0 → c = 0) :
    2 * Module.finrank ℂ ↥(Subalgebra.centralizer ℂ ({M} : Set (Matrix (Fin n) (Fin n) ℂ))) ≤
      n ^ 2 + 1 := by
  by_contra h
  obtain ⟨U, V, hU, hV, hdim, htr⟩ := fischler_prop_5_5 M hM (by omega)
  have h1 : ∀ A ∈ {A | A ∈ U ∧ ∀ i j, A i j ∈ Qbar}, ∀ B ∈ V, A * B - B * A = 0 := by
    intro A hA B hB
    rw [← hV] at hB
    refine fischler_centralizer_nb_vanish_span (LinearMap.mulLeft ℂ A - LinearMap.mulRight ℂ A) ?_ B hB
    intro B' hB'
    exact fischler_centralizer_nb_eq_zero_of_trace M hhyp A B' hA.2 hB'.2 (htr A hA.1 B' hB'.1)
  have hcomm : ∀ A ∈ U, ∀ B ∈ V, A * B = B * A := by
    intro A hA B hB
    rw [← hU] at hA
    have := fischler_centralizer_nb_vanish_span (LinearMap.mulRight ℂ B - LinearMap.mulLeft ℂ B)
      (fun A' hA' => by
        show A' * B - B * A' = 0
        exact h1 A' hA' B hB) A hA
    exact sub_eq_zero.mp this
  have hle := remond_commuting_subspaces U V hcomm
  omega

end Diaz
