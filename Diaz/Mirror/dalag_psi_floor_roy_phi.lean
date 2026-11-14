/-
Mirrored from Prove2Me: `DiazModulus.dalag_psi_floor_roy_phi`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.dalag_psi_floor_roy_phi__93afeb26.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.roy_lemma_phi

namespace Diaz

open Complex ComplexConjugate

/-! # The integer part of Roy's maximum is DALAG's Ψ

For `0 < n < d` let `F(n, d)` be the closed form of Roy's maximum: `nd/(d − n)` if `n = 1` or `d − n = 1`, and
`(d − n)/(d − n − 1) + (n − 1)n` otherwise. By Roy's Lemma `F(n, d)` is the value of some decomposition of `(n, d)`
and bounds the value of every decomposition. So it suffices to show `Ψ(n, d) ≤ F(n, d) < Ψ(n, d) + 1`, row by row
of the table, with `δ = d − n`:
`n = 1, δ = 1`: `F = 2 = Ψ`; `n = 1, δ ≥ 2`: `F = 1 + 1/δ ∈ (1, 3/2]`, `Ψ = 1`;
`n ≥ 2, δ = 1`: `F = n(n + 1) = Ψ`; `n ≥ 2, δ = 2`: `F = n(n − 1) + 2 = Ψ`;
`n ≥ 2, δ ≥ 3`: `F = n(n − 1) + 1 + 1/(δ − 1)` with `0 < 1/(δ − 1) ≤ 1/2`, `Ψ = n(n − 1) + 1`.
Then every value is `≤ F < Ψ + 1`, and the maximising decomposition has value `F ≥ Ψ`. -/

namespace RC4_R2
/-- The closed form of Roy's maximum (same formula as Roy's Lemma). -/
def dalag_psi_floor_roy_phi_Fq (n d : ℕ) : ℚ :=
  if n = 1 ∨ d - n = 1 then ((n : ℚ) * d) / ((d : ℚ) - n)
  else ((d : ℚ) - n) / ((d : ℚ) - n - 1) + ((n : ℚ) - 1) * n

/-- DALAG's table (same encoding as the statement). -/
def dalag_psi_floor_roy_phi_Psi (a b : ℕ) : ℕ :=
  if a = 0 then 0
  else if a = 1 ∧ 3 ≤ b then 1
  else if 2 ≤ a ∧ a + 3 ≤ b then a * (a - 1) + 1
  else if 2 ≤ a ∧ a + 2 = b then a * (a - 1) + 2
  else if a + 1 = b then a * (a + 1)
  else 0

theorem roy {n d : ℕ} (hn : 0 < n) (hnd : n < d) :
    IsGreatest
      {x : ℚ | ∃ D : List (ℕ × ℕ), (∀ p ∈ D, 0 < p.1 ∧ p.1 < p.2) ∧
        (D.map Prod.fst).sum = n ∧ (D.map Prod.snd).sum = d ∧
        x = (D.map fun p : ℕ × ℕ => ((p.1 : ℚ) * p.2) / ((p.2 : ℚ) - p.1)).sum} (dalag_psi_floor_roy_phi_Fq n d) :=
  roy_lemma_phi hn hnd

/-- The rows of the table with `n = 1`. -/
theorem row_one (δ : ℕ) (hδ : 1 ≤ δ) :
    (dalag_psi_floor_roy_phi_Psi 1 (1 + δ) : ℚ) ≤ dalag_psi_floor_roy_phi_Fq 1 (1 + δ) ∧ dalag_psi_floor_roy_phi_Fq 1 (1 + δ) < dalag_psi_floor_roy_phi_Psi 1 (1 + δ) + 1 := by
  have hδq : (1 : ℚ) ≤ δ := by exact_mod_cast hδ
  simp only [dalag_psi_floor_roy_phi_Fq, Nat.add_sub_cancel_left, Nat.cast_add, add_sub_cancel_left]
  by_cases hδ1 : δ = 1
  · subst hδ1
    have hΨ : dalag_psi_floor_roy_phi_Psi 1 (1 + 1) = 2 := by decide
    rw [hΨ]; norm_num
  · have hΨ : dalag_psi_floor_roy_phi_Psi 1 (1 + δ) = 1 := by unfold dalag_psi_floor_roy_phi_Psi; split_ifs <;> omega
    have h3 : (2 : ℚ) ≤ δ := by exact_mod_cast (show 2 ≤ δ by omega)
    rw [hΨ]
    simp only [true_or, ite_true]
    push_cast
    constructor
    · rw [le_div_iff₀ (by linarith)]; linarith
    · rw [div_lt_iff₀ (by linarith)]; linarith

/-- The rows of the table with `n ≥ 2`. -/
theorem row_ge_two (n δ : ℕ) (hn : 2 ≤ n) (hδ : 1 ≤ δ) :
    (dalag_psi_floor_roy_phi_Psi n (n + δ) : ℚ) ≤ dalag_psi_floor_roy_phi_Fq n (n + δ) ∧ dalag_psi_floor_roy_phi_Fq n (n + δ) < dalag_psi_floor_roy_phi_Psi n (n + δ) + 1 := by
  have hn2 : (2 : ℚ) ≤ n := by exact_mod_cast hn
  simp only [dalag_psi_floor_roy_phi_Fq, Nat.add_sub_cancel_left, Nat.cast_add, add_sub_cancel_left]
  by_cases hδ1 : δ = 1
  · subst hδ1
    have hΨ : dalag_psi_floor_roy_phi_Psi n (n + 1) = n * (n + 1) := by unfold dalag_psi_floor_roy_phi_Psi; split_ifs <;> first | rfl | omega
    rw [hΨ, ite_eq_left (Or.inr rfl)]
    push_cast
    rw [div_one]
    constructor <;> linarith
  · by_cases hδ2 : δ = 2
    · subst hδ2
      have hΨ : dalag_psi_floor_roy_phi_Psi n (n + 2) = n * (n - 1) + 2 := by
        unfold dalag_psi_floor_roy_phi_Psi; split_ifs <;> first | rfl | omega
      rw [hΨ, ite_eq_right (by omega)]
      push_cast [Nat.cast_sub (show 1 ≤ n by omega)]
      norm_num
      constructor <;> nlinarith
    · have hΨ : dalag_psi_floor_roy_phi_Psi n (n + δ) = n * (n - 1) + 1 := by
        unfold dalag_psi_floor_roy_phi_Psi; split_ifs <;> first | rfl | omega
      have h3 : (3 : ℚ) ≤ δ := by exact_mod_cast (show 3 ≤ δ by omega)
      rw [hΨ, ite_eq_right (by omega)]
      push_cast [Nat.cast_sub (show 1 ≤ n by omega)]
      have a1 : 1 ≤ (δ : ℚ) / (δ - 1) := by rw [le_div_iff₀ (by linarith)]; linarith
      have a2 : (δ : ℚ) / (δ - 1) < 2 := by rw [div_lt_iff₀ (by linarith)]; linarith
      constructor <;> nlinarith

theorem psi_le_F_lt {n d : ℕ} (hn : 0 < n) (hnd : n < d) :
    (dalag_psi_floor_roy_phi_Psi n d : ℚ) ≤ dalag_psi_floor_roy_phi_Fq n d ∧ dalag_psi_floor_roy_phi_Fq n d < dalag_psi_floor_roy_phi_Psi n d + 1 := by
  obtain ⟨δ, rfl⟩ : ∃ δ, d = n + δ := ⟨d - n, by omega⟩
  by_cases h1 : n = 1
  · subst h1; exact row_one δ (by omega)
  · exact row_ge_two n δ (by omega) (by omega)

theorem dalag_psi_floor_roy_phi_main {n d : ℕ} (hn : 0 < n) (hnd : n < d) :
    (∀ D : List (ℕ × ℕ), (∀ p ∈ D, 0 < p.1 ∧ p.1 < p.2) → (D.map Prod.fst).sum = n →
        (D.map Prod.snd).sum = d →
        (D.map fun p : ℕ × ℕ => ((p.1 : ℚ) * p.2) / ((p.2 : ℚ) - p.1)).sum < (dalag_psi_floor_roy_phi_Psi n d : ℚ) + 1) ∧
    ∃ D : List (ℕ × ℕ), (∀ p ∈ D, 0 < p.1 ∧ p.1 < p.2) ∧ (D.map Prod.fst).sum = n ∧
      (D.map Prod.snd).sum = d ∧
      (dalag_psi_floor_roy_phi_Psi n d : ℚ) ≤ (D.map fun p : ℕ × ℕ => ((p.1 : ℚ) * p.2) / ((p.2 : ℚ) - p.1)).sum := by
  have hR := roy hn hnd
  have hF := psi_le_F_lt hn hnd
  refine ⟨fun D hD h1 h2 => ?_, ?_⟩
  · have := hR.2 ⟨D, hD, h1, h2, rfl⟩
    linarith [hF.2]
  · obtain ⟨D, hD, h1, h2, h3⟩ := hR.1
    exact ⟨D, hD, h1, h2, by rw [← h3]; exact hF.1⟩

end RC4_R2

open RC4_R2 in
theorem dalag_psi_floor_roy_phi {n d : ℕ} (hn : 0 < n) (hnd : n < d) :
    let Ψ : ℕ → ℕ → ℕ := fun a b =>
      if a = 0 then 0
      else if a = 1 ∧ 3 ≤ b then 1
      else if 2 ≤ a ∧ a + 3 ≤ b then a * (a - 1) + 1
      else if 2 ≤ a ∧ a + 2 = b then a * (a - 1) + 2
      else if a + 1 = b then a * (a + 1)
      else 0
    (∀ D : List (ℕ × ℕ), (∀ p ∈ D, 0 < p.1 ∧ p.1 < p.2) → (D.map Prod.fst).sum = n →
        (D.map Prod.snd).sum = d →
        (D.map fun p : ℕ × ℕ => ((p.1 : ℚ) * p.2) / ((p.2 : ℚ) - p.1)).sum < (Ψ n d : ℚ) + 1) ∧
    ∃ D : List (ℕ × ℕ), (∀ p ∈ D, 0 < p.1 ∧ p.1 < p.2) ∧ (D.map Prod.fst).sum = n ∧
      (D.map Prod.snd).sum = d ∧
      (Ψ n d : ℚ) ≤ (D.map fun p : ℕ × ℕ => ((p.1 : ℚ) * p.2) / ((p.2 : ℚ) - p.1)).sum := by
  intro Ψ
  exact dalag_psi_floor_roy_phi_main hn hnd

end Diaz
