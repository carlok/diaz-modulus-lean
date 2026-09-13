/-
Mirrored from Prove2Me: `DiazModulus.ringHom_preserves_linearIndependent`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.ringHom_preserves_linearIndependent__dde08781.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform

namespace Diaz

open Complex ComplexConjugate

private theorem map_smul' (Φ : ℂ →+* ℂ)
    (hfix : ∀ a : ↥Qbar, Φ (a : ℂ) = (a : ℂ))
    (a : ↥Qbar) (z : ℂ) : Φ (a • z) = a • Φ z := by
  show Φ ((a : ℂ) * z) = (a : ℂ) * Φ z
  rw [map_mul, hfix]

theorem ringHom_preserves_linearIndependent {n : ℕ} (Φ : ℂ →+* ℂ)
    (hfix : ∀ a : ↥Qbar, Φ (a : ℂ) = (a : ℂ)) (x : Fin n → ℂ) :
    LinearIndependent (↥Qbar) x ↔ LinearIndependent (↥Qbar) (fun i => Φ (x i)) := by
  classical
  rw [Fintype.linearIndependent_iff, Fintype.linearIndependent_iff]
  constructor
  · intro h g hg i
    refine h g ?_ i
    apply Φ.injective
    rw [map_zero, map_sum, ← hg]
    exact Finset.sum_congr rfl fun j _ => map_smul' Φ hfix (g j) (x j)
  · intro h g hg i
    refine h g ?_ i
    rw [← map_zero Φ, ← hg, map_sum]
    exact (Finset.sum_congr rfl fun j _ => map_smul' Φ hfix (g j) (x j)).symm

end Diaz
