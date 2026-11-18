/-
Mirrored from Prove2Me: `DiazModulus.dalag_prop_12_2`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.dalag_prop_12_2__38acbeb6.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.dalag_prop_12_2_ii
import Diaz.Mirror.dalag_prop_12_13_i_ii_span

namespace Diaz

open Complex ComplexConjugate

/-! # DALAG Prop. 12.2

Let `E` be the `k`-span of the algebraically independent family `b`. Every matrix over a subspace `E` with
property (ii) — whenever `x₁, …, xₙ ∈ E` and `1, x₁, …, xₙ` are `k`-free, the `xᵢ` are algebraically
independent over `k` — can be brought by invertible matrices `P`, `Q` over `k` to the form whose entries with
both indices at least `r` vanish and whose leading `r × r` block has unit determinant. So it suffices to check
(ii) for `E`. If `x₁, …, xₙ ∈ span(b)` and `1, x₁, …, xₙ` are `k`-free, then the `xᵢ` lie in the larger span of
`1` and `b`, and the affine change of variables (Prop. 12.13, (i) ⇒ (ii) in span form) shows that they are
algebraically independent over `k`. No hypothesis on `k` is needed. -/

theorem dalag_prop_12_2 {k K : Type*} [Field k] [Field K] [Algebra k K] {ι : Type*} (b : ι → K)
    (hb : AlgebraicIndependent k b) {s t : ℕ} (M : Matrix (Fin s) (Fin t) K)
    (hM : ∀ i j, M i j ∈ Submodule.span k (Set.range b)) :
    ∃ (r : ℕ) (hrs : r ≤ s) (hrt : r ≤ t) (P : Matrix (Fin s) (Fin s) k)
        (Q : Matrix (Fin t) (Fin t) k), IsUnit P.det ∧ IsUnit Q.det ∧
        (∀ (i : Fin s) (j : Fin t), r ≤ i.val → r ≤ j.val →
          (P.map (algebraMap k K) * M * Q.map (algebraMap k K)) i j = 0) ∧
        IsUnit ((P.map (algebraMap k K) * M * Q.map (algebraMap k K)).submatrix
          (Fin.castLE hrs) (Fin.castLE hrt)).det :=
  dalag_prop_12_2_ii _ (fun _ x hxE hx => dalag_prop_12_13_i_ii_span b hb x
    (fun i => Submodule.span_mono (Set.subset_insert _ _) (hxE i)) hx) M hM

end Diaz
