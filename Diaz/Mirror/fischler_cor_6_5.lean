/-
Mirrored from Prove2Me: `DiazModulus.fischler_cor_6_5`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fischler_cor_6_5__27d1afc6.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.fischler_theorem_6_4_one

namespace Diaz

open Complex ComplexConjugate

/-! # Fischler 2001, Corollary 6.5 (1)

Conjecture 1 for the set of pure tensors `v ⊗ ⋯ ⊗ v` in `(ℂᵐ)^{⊗k}`, `k ≥ 3`, in the coordinates `x_I = ∏ₜ v(I t)`
of the basis `e_I`, which is defined over `Q̄`. Let `x = v^{⊗k}` have every coordinate in `ℒ̃`. By Fischler's
Theorem 6.4 (1) there are `a ∈ ℒ̃` and an algebraic vector `v'` with `x = a · v'^{⊗k}`. Take `y = v'^{⊗k}`: its
coordinates are products of algebraic numbers, hence algebraic, and `x = a · y` lies on the line `ℂy`, a vector
subspace defined over `Q̄`. That line consists of pure tensors: given `γ y`, choose `z` with `zᵏ = γ` (`ℂ` is
algebraically closed); then `γ y = (z v')^{⊗k}`, since `∏ₜ z v'(I t) = zᵏ ∏ₜ v'(I t)`. -/

theorem fischler_cor_6_5 {m k : ℕ} (hk : 3 ≤ k) (v : Fin m → ℂ)
    (hv : ∀ I : Fin k → Fin m, ∏ t, v (I t) ∈ LogAlgTilde) :
    ∃ y : (Fin k → Fin m) → ℂ, (∀ I, y I ∈ Qbar) ∧
      (fun I : Fin k → Fin m => ∏ t, v (I t)) ∈ Submodule.span ℂ {y} ∧
      ∀ x ∈ Submodule.span ℂ {y}, ∃ v'' : Fin m → ℂ, x = fun I => ∏ t, v'' (I t) := by
  obtain ⟨a, -, v', hv', hI⟩ := fischler_theorem_6_4_one hk v hv
  refine ⟨fun I => ∏ t, v' (I t), fun I => Subfield.prod_mem Qbar fun t _ => hv' (I t), ?_, fun x hx => ?_⟩
  · rw [Submodule.mem_span_singleton]
    exact ⟨a, funext fun I => by simp [hI]⟩
  · obtain ⟨γ, rfl⟩ := Submodule.mem_span_singleton.1 hx
    obtain ⟨z, hz⟩ := IsAlgClosed.exists_pow_nat_eq γ (show 0 < k by omega)
    refine ⟨fun i => z * v' i, funext fun I => ?_⟩
    simp [Finset.prod_mul_distrib, Finset.prod_const, hz]

end Diaz
