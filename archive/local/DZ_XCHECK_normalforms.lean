import Solutions.DZ_LEAFSPLIT_core
import Solutions.DZ_LEAF2_normalform

/-!
# Cross-check: the two independently derived normal forms of leaf 1 agree

Two agents, working the same day and not reading each other, each reduced the open leaf
`DiazModulus.diaz_of_exp_real_generic` to a normal form and machine-checked the reduction.

* `DiazLeafSplit.Leaf1Normalised` — the leaf restricted to the single line `Im u = π`
  (`DiazLeafSplit.leaf1_iff_normalised`, in `DZ_LEAFSPLIT_core.lean`).
* `DiazLeaf2.RealLogQuadraticOne` — for every real `t ≠ 0` with `eᵗ` algebraic, `t² + π²`
  is transcendental (`DiazLeaf2.leaf_iff_one`, in `DZ_LEAF2_normalform.lean`, published as
  `DiazModulus.leaf_iff_one`).

They agree, and the check is mechanical: both files state the leaf verbatim, so the two
`Prop`s `DiazLeafSplit.Leaf1` and `DiazRealGeneric.DiazExpRealGeneric` are the same proposition
and the two equivalences compose.  The `Iff.rfl` below is the load-bearing line — if the
two transcriptions of the leaf had drifted by a single hypothesis, it would fail.
-/

namespace DiazXCheck

/-- The two files transcribe the leaf identically. -/
theorem leaf_statements_agree :
    DiazLeafSplit.Leaf1 ↔ DiazRealGeneric.DiazExpRealGeneric := Iff.rfl

/-- **The cross-check.**  The geometric normal form and the arithmetic one are equivalent. -/
theorem normal_forms_agree :
    DiazLeafSplit.Leaf1Normalised ↔ DiazLeaf2.RealLogQuadraticOne :=
  DiazLeafSplit.leaf1_iff_normalised.symm.trans DiazLeaf2.leaf_iff_one

end DiazXCheck

#print axioms DiazXCheck.leaf_statements_agree
#print axioms DiazXCheck.normal_forms_agree
