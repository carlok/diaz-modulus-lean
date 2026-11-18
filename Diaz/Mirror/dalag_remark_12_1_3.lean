/-
Mirrored from Prove2Me: `DiazModulus.dalag_remark_12_1_3`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.dalag_remark_12_1_3__750a32f7.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.dalag_prop_12_2_ii
import Diaz.Mirror.dalag_prop_12_13_i_ii_span

namespace Diaz

open Complex ComplexConjugate

/-! # DALAG §12.1.3, the Remark of p. 424

Let `E = k·1 + span(b)` with `b` algebraically independent over `k`; it is the `k`-span of `1` and the `bⱼ`.
Every matrix over a subspace `E` with property (ii) — whenever `x₁, …, xₙ ∈ E` and `1, x₁, …, xₙ` are `k`-free,
the `xᵢ` are algebraically independent over `k` — can be brought by invertible matrices `P`, `Q` over `k` to the
form whose entries with both indices at least `r` vanish and whose leading `r × r` block has unit determinant.
Property (ii) for `E` is the affine change of variables of Prop. 12.13, (i) ⇒ (ii) in span form: elements of
the span of `1` and `b` that are `k`-free together with `1` are algebraically independent. So the conclusion
holds for every matrix over `E`; the hypothesis `M ≠ 0` is not needed, and no condition on `E ∩ k` or on `k`
is used. -/

theorem dalag_remark_12_1_3 {k K : Type*} [Field k] [Field K] [Algebra k K] {ι : Type*} (b : ι → K)
    (hb : AlgebraicIndependent k b) :
    ∀ (s t : ℕ) (M : Matrix (Fin s) (Fin t) K),
      (∀ i j, M i j ∈ Submodule.span k {(1 : K)} ⊔ Submodule.span k (Set.range b)) → M ≠ 0 →
      ∃ (r : ℕ) (hrs : r ≤ s) (hrt : r ≤ t) (P : Matrix (Fin s) (Fin s) k)
        (Q : Matrix (Fin t) (Fin t) k), IsUnit P.det ∧ IsUnit Q.det ∧
        (∀ (i : Fin s) (j : Fin t), r ≤ i.val → r ≤ j.val →
          (P.map (algebraMap k K) * M * Q.map (algebraMap k K)) i j = 0) ∧
        IsUnit ((P.map (algebraMap k K) * M * Q.map (algebraMap k K)).submatrix
          (Fin.castLE hrs) (Fin.castLE hrt)).det :=
  fun _ _ M hM _ => dalag_prop_12_2_ii _ (fun _ x hxE hx =>
    dalag_prop_12_13_i_ii_span b hb x
      (fun i => by rw [Submodule.span_insert]; exact hxE i) hx) M hM

end Diaz
