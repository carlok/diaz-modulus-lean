/-
Mirrored from Prove2Me: `DiazModulus.remond_commuting_subspaces`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.remond_commuting_subspaces__2c5a086b.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.remond_commuting_end

namespace Diaz

open Complex ComplexConjugate

/-! # Rémond's lemma on commuting subspaces of matrices

This is the endomorphism form transported along the algebra isomorphism between `n × n` matrices and
endomorphisms of `ℂⁿ`. The images of `U` and `V` have the same dimensions as `U` and `V`; since the isomorphism
is multiplicative, they still commute elementwise; and `ℂⁿ` has dimension `n`. The endomorphism form then gives
`dim U + dim V ≤ n² + 1`. -/

theorem remond_commuting_subspaces {n : ℕ} (U V : Submodule ℂ (Matrix (Fin n) (Fin n) ℂ))
    (h : ∀ A ∈ U, ∀ B ∈ V, A * B = B * A) :
    Module.finrank ℂ ↥U + Module.finrank ℂ ↥V ≤ n ^ 2 + 1 := by
  let e : Matrix (Fin n) (Fin n) ℂ ≃ₐ[ℂ] Module.End ℂ (Fin n → ℂ) := Matrix.toLinAlgEquiv'
  have key := remond_commuting_end (U.map e.toLinearEquiv.toLinearMap)
    (V.map e.toLinearEquiv.toLinearMap) (by
      rintro _ ⟨A, hA, rfl⟩ _ ⟨B, hB, rfl⟩
      show e A * e B = e B * e A
      rw [← map_mul, ← map_mul, h A hA B hB])
  rwa [LinearEquiv.finrank_map_eq, LinearEquiv.finrank_map_eq, Module.finrank_fin_fun] at key

end Diaz
