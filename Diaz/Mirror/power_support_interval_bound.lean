/-
Mirrored from Prove2Me: `Diaz.power_support_interval_bound`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/Diaz.power_support_interval_bound__09be47be.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation

namespace Diaz

open ComplexConjugate
open Diaz

theorem power_support_interval_bound {a b : ℤ} (hab : a ≤ b) (T : Finset ℤ)
    (hT : ∀ n ∈ T, n ∈ Finset.Icc a b)
    (h2 : ∀ d : ℤ, d ≠ 0 → (T.filter (fun n => n + d ∈ T)).card ≤ 2) :
    (T.card : ℤ) * ((T.card : ℤ) - 1) ≤ 4 * (b - a) := by
  classical
  set D : Finset ℤ := (Finset.Icc (a - b) (b - a)).erase 0 with hDdef
  have hmaps : ∀ p ∈ T.offDiag, p.2 - p.1 ∈ D := by
    intro p hp
    rw [Finset.mem_offDiag] at hp
    obtain ⟨hp1, hp2, hne⟩ := hp
    have g1 := Finset.mem_Icc.mp (hT _ hp1)
    have g2 := Finset.mem_Icc.mp (hT _ hp2)
    rw [hDdef, Finset.mem_erase, Finset.mem_Icc]
    exact ⟨by omega, by omega, by omega⟩
  have hfib : ∀ d ∈ D, (T.offDiag.filter (fun p => p.2 - p.1 = d)).card ≤ 2 := by
    intro d hd
    have hd0 : d ≠ 0 := (Finset.mem_erase.mp hd).1
    refine le_trans (Finset.card_le_card_of_injOn (fun p => p.1) ?_ ?_) (h2 d hd0)
    · intro p hp
      simp only [Finset.coe_filter, Set.mem_ofPred_eq, Finset.mem_offDiag] at hp
      simp only [Finset.coe_filter, Set.mem_ofPred_eq, Finset.mem_coe, Finset.mem_filter]
      refine ⟨hp.1.1, ?_⟩
      have : p.1 + d = p.2 := by omega
      rw [this]; exact hp.1.2.1
    · intro p hp q hq hpq
      simp only [Finset.coe_filter, Set.mem_ofPred_eq] at hp hq
      have h1 : p.1 = q.1 := hpq
      have h2' : p.2 = q.2 := by
        have := hp.2; have := hq.2; omega
      exact Prod.ext h1 h2'
  have hcard : T.offDiag.card ≤ 2 * D.card :=
    Finset.card_le_mul_card_image_of_maps_to hmaps 2 hfib
  have h0mem : (0 : ℤ) ∈ Finset.Icc (a - b) (b - a) := Finset.mem_Icc.mpr ⟨by omega, by omega⟩
  have hDcard : D.card = 2 * (b - a).toNat := by
    rw [hDdef, Finset.card_erase_of_mem h0mem, Int.card_Icc]
    omega
  rw [Finset.offDiag_card, hDcard] at hcard
  have hstep : T.card * T.card ≤ 4 * (b - a).toNat + T.card := by
    have := Nat.sub_le_iff_le_add.mp hcard
    omega
  have hN : ((b - a).toNat : ℤ) = b - a := Int.toNat_of_nonneg (by omega)
  have hcast : ((T.card : ℤ)) * ((T.card : ℤ)) ≤ 4 * ((b - a).toNat : ℤ) + (T.card : ℤ) := by
    exact_mod_cast hstep
  rw [hN] at hcast
  nlinarith [hcast]

end Diaz
