/-
Mirrored from Prove2Me: `DiazModulus.fv_cor_1_4`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fv_cor_1_4__a0ac2632.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.fv_theorem_1_2
import Diaz.Mirror.baker_columns_qbar_independent

namespace Diaz

open Complex ComplexConjugate

/-! # Corollary 1.4: a `2 × 3` matrix of logarithms

The entries of `L` lie in `ℒ ⊂ ℒ̃`. By Baker's theorem, in the form "if `w₁, …, w_ℓ ∈ ℒᵐ` are
`ℚ`-linearly independent then `e₁, …, e_m, w₁, …, w_ℓ` are `Q̄`-linearly independent", applied to the
three `ℚ`-free columns of `L` (`m = 2`), the five columns of `(I₂, L)` are `Q̄`-free. Applied to the
columns of `Lᵀ`, which are the two `ℚ`-free rows of `L` (`m = 3`), the five columns of `(I₃, Lᵀ)` are
`Q̄`-free; these are the five rows of `(L; I₃)` listed in another order (the identity block is
symmetric), so the rows of `(L; I₃)` are `Q̄`-free. Theorem 1.2 then puts one of its three minors
outside `ℒ̃`, and these are the three numbers of the statement in a different order. -/

namespace RC3_A9
theorem rows_eq_cols (L : Matrix (Fin 2) (Fin 3) ℂ) :
    (Matrix.fromRows L (1 : Matrix (Fin 3) (Fin 3) ℂ)).row =
      (Matrix.fromCols (1 : Matrix (Fin 3) (Fin 3) ℂ) L.transpose).col ∘ Sum.swap := by
  funext k j
  rcases k with i | i
  · simp [Matrix.row]
  · simp [Matrix.row, Matrix.one_apply, eq_comm]

end RC3_A9

open RC3_A9 in
theorem fv_cor_1_4 (L : Matrix (Fin 2) (Fin 3) ℂ) (hL : ∀ i j, L i j ∈ LogAlg)
    (hrows : LinearIndependent ℚ L.row) (hcols : LinearIndependent ℚ L.col) :
    L 0 0 * L 1 1 - L 0 1 * L 1 0 ∉ LogAlgTilde ∨
      L 0 1 * L 1 2 - L 0 2 * L 1 1 ∉ LogAlgTilde ∨
      L 0 2 * L 1 0 - L 0 0 * L 1 2 ∉ LogAlgTilde := by
  have hM : ∀ i j, L i j ∈ LogAlgTilde := fun i j =>
    Submodule.subset_span (Set.mem_insert_of_mem _ (hL i j))
  have hC := baker_columns_qbar_independent L hL hcols
  have hR' := baker_columns_qbar_independent L.transpose (fun i j => hL j i) hrows
  have hR : LinearIndependent (↥Qbar) (Matrix.fromRows L (1 : Matrix (Fin 3) (Fin 3) ℂ)).row := by
    rw [rows_eq_cols]; exact hR'.comp _ Sum.swap_leftInverse.injective
  rcases fv_theorem_1_2 L hM hR hC with h | h | h
  · exact Or.inr (Or.inl h)
  · exact Or.inr (Or.inr h)
  · exact Or.inl h

end Diaz
