/-
Mirrored from Prove2Me: `DiazModulus.fischler_theorem_6_4_one`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fischler_theorem_6_4_one__37c82937.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.fischler_power_span_finrank
import Diaz.Mirror.fischler_rational_hull

namespace Diaz

open Complex ComplexConjugate

/-! # Fischler 2001, Theorem 6.4 (1)

Let `k ≥ 3` and suppose every product `v_{I(0)}⋯v_{I(k−1)}` lies in `ℒ̃`. Then the `Q̄`-span of `v₁, …, v_m` has
dimension at most `1`. Write `v = Σₐ cₐwₐ` with complex `cₐ` and `Q̄`-free algebraic vectors `wₐ`, the number of
terms being that dimension. If it is `0`, then `v = 0` and `a = 0`, `v′ = 0` work, since `k ≥ 1`. If it is `1`,
then `v = c₀w₀` with `w₀` algebraic and non-zero: choosing `j` with `w₀ⱼ ≠ 0`, `vⱼᵏ = c₀ᵏw₀ⱼᵏ ∈ ℒ̃`, and dividing
by the non-zero algebraic number `w₀ⱼᵏ` gives `a = c₀ᵏ ∈ ℒ̃`. With `v′ = w₀`, every product `v_I` equals
`c₀ᵏ·v′_I = a·v′_I`. -/

namespace RC9_F6a
/-- If `v = c • w` with `w` algebraic and non-zero and every `k`-fold product of the `v i` is in `ℒ̃`,
then `cᵏ ∈ ℒ̃`. -/
theorem fischler_theorem_6_4_one_pow_mem {m k : ℕ} (v : Fin m → ℂ) (hv : ∀ I : Fin k → Fin m, ∏ t, v (I t) ∈ LogAlgTilde)
    (c : ℂ) (w : Fin m → ℂ) (hwQ : ∀ i, w i ∈ Qbar) (hw0 : w ≠ 0) (hvw : ∀ i, v i = c * w i) :
    c ^ k ∈ LogAlgTilde := by
  obtain ⟨j, hj⟩ : ∃ j, w j ≠ 0 := by
    by_contra h; push Not at h; exact hw0 (funext h)
  have hq0 : (⟨w j ^ k, Qbar.pow_mem (hwQ j) k⟩ : ↥Qbar) ≠ 0 := by
    intro h; exact hj (pow_eq_zero_iff'.1 (congrArg Subtype.val h)).1
  rw [← Submodule.smul_mem_iff LogAlgTilde hq0, Subfield.smul_def, smul_eq_mul]
  have := hv (fun _ => j)
  rwa [Finset.prod_const, Finset.card_univ, Fintype.card_fin, hvw, mul_pow, mul_comm] at this

end RC9_F6a

theorem fischler_theorem_6_4_one {m k : ℕ} (hk : 3 ≤ k) (v : Fin m → ℂ)
    (hv : ∀ I : Fin k → Fin m, ∏ t, v (I t) ∈ LogAlgTilde) :
    ∃ a ∈ LogAlgTilde, ∃ v' : Fin m → ℂ, (∀ i, v' i ∈ Qbar) ∧
      ∀ I : Fin k → Fin m, ∏ t, v (I t) = a * ∏ t, v' (I t) := by
  have hn := (fischler_power_span_finrank (by omega) v hv).2 hk
  obtain ⟨n, c, w, hn', -, hw, hwQ, hvw, -⟩ := fischler_rational_hull v
  rw [← hn'] at hn
  interval_cases n
  · refine ⟨0, zero_mem _, 0, fun _ => zero_mem _, fun I => ?_⟩
    have hv0 : v = 0 := by simpa using hvw
    obtain ⟨p, rfl⟩ : ∃ p, k = p + 1 := ⟨k - 1, by omega⟩
    simp [hv0]
  · have hv1 : ∀ i, v i = c 0 * w 0 i := fun i => by simpa using congr_fun hvw i
    refine ⟨c 0 ^ k, RC9_F6a.fischler_theorem_6_4_one_pow_mem v hv (c 0) (w 0) (hwQ 0) (hw.ne_zero 0) hv1, w 0, hwQ 0,
      fun I => ?_⟩
    simp only [hv1, Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ, Fintype.card_fin]

end Diaz
