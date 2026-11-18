/-
Mirrored from Prove2Me: `DiazModulus.fischler_lemma_6_1`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.fischler_lemma_6_1__61f61496.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.strong_six_exponentials_unconditional

namespace Diaz

open Complex ComplexConjugate

/-! # Fischler 2001, Lemma 6.1

Let `λ₀, …, λ_{q−1}` be non-zero elements of `ℒ̃` in geometric progression with transcendental ratio `t`, and
suppose `q ≥ 4`. By induction on `j`, `λⱼ = tʲλ₀`. Since `t` is transcendental over `ℚ`, it is not in `Q̄`, hence
transcendental over `Q̄`, so distinct powers of `t` are `Q̄`-free. Take `x = (1, t)` and `y = λ₀·(1, t, t²)`: `x` is
`Q̄`-free, and `y` is `Q̄`-free because multiplication by `λ₀ ≠ 0` is injective. Each product `xᵢyⱼ = t^{i+j}λ₀`
equals `λ_{i+j}` with `i + j ≤ 3 < q`, so it lies in `ℒ̃`. Roy's strong six exponentials theorem, in product
form, forbids this: hence `q ≤ 3`. -/

namespace RC9_F1
theorem fischler_lemma_6_1_transcendental_of_not_mem {u : ℂ} (hu : u ∉ Qbar) : Transcendental Qbar u := by
  have : Algebra.IsAlgebraic ℚ Qbar := ⟨fun x =>
    (isAlgebraic_algHom_iff (Qbar.subtype.toRatAlgHom) Subtype.val_injective).1
      (mem_Qbar_iff.1 x.2)⟩
  exact (Algebra.IsAlgebraic.transcendental_iff ℚ Qbar).1 fun h => hu (mem_Qbar_iff.2 h)

theorem fischler_lemma_6_1_linInd_pow {u : ℂ} (hu : Transcendental Qbar u) {n : ℕ} (f : Fin n → ℕ)
    (hf : Function.Injective f) : LinearIndependent Qbar (fun i => u ^ f i) := by
  classical
  rw [Fintype.linearIndependent_iff]
  intro g hg i
  have hp : (∑ j, Polynomial.C (g j) * Polynomial.X ^ f j : Polynomial Qbar) = 0 := by
    by_contra hne
    exact hu ⟨_, hne, by simpa [Polynomial.aeval_def, Polynomial.eval₂_finsetSum,
      Algebra.smul_def] using hg⟩
  have := congrArg (fun p : Polynomial Qbar => p.coeff (f i)) hp
  simpa [Polynomial.finsetSum_coeff, Polynomial.coeff_C_mul_X_pow, hf.eq_iff] using this

theorem fischler_lemma_6_1_linInd_mul {n : ℕ} {c : ℂ} (hc : c ≠ 0) {w : Fin n → ℂ}
    (hw : LinearIndependent (↥Qbar) w) : LinearIndependent (↥Qbar) (fun j => c * w j) := by
  have hker : LinearMap.ker (LinearMap.mulLeft (↥Qbar) c) = ⊥ :=
    LinearMap.ker_eq_bot.2 (mul_right_injective₀ hc)
  have heq : (fun j => c * w j) = (LinearMap.mulLeft (↥Qbar) c) ∘ w := by
    funext j; simp only [Function.comp_apply, LinearMap.mulLeft_apply]
  rw [heq]
  exact hw.map' _ hker

end RC9_F1

open RC9_F1 in
theorem fischler_lemma_6_1 {q : ℕ} (lam : Fin q → ℂ) (t : ℂ)
    (hmem : ∀ j, lam j ∈ LogAlgTilde) (hne : ∀ j, lam j ≠ 0)
    (hgeo : ∀ i j : Fin q, i.val + 1 = j.val → lam j = t * lam i)
    (ht : Transcendental ℚ t) : q ≤ 3 := by
  by_contra hq
  push Not at hq
  have hpow : ∀ j : ℕ, ∀ hj : j < q, lam ⟨j, hj⟩ = t ^ j * lam ⟨0, by omega⟩ := by
    intro j
    induction j with
    | zero => intro hj; simp
    | succ j ih =>
      intro hj
      rw [hgeo ⟨j, by omega⟩ ⟨j + 1, hj⟩ rfl, ih (by omega), pow_succ]
      ring
  have htr := fischler_lemma_6_1_transcendental_of_not_mem fun h => ht (mem_Qbar_iff.1 h)
  have hx : LinearIndependent (↥Qbar) (fun i : Fin 2 => t ^ (i : ℕ)) :=
    fischler_lemma_6_1_linInd_pow htr (fun i : Fin 2 => (i : ℕ)) Fin.val_injective
  have hy : LinearIndependent (↥Qbar) (fun j : Fin 3 => lam ⟨0, by omega⟩ * t ^ (j : ℕ)) :=
    fischler_lemma_6_1_linInd_mul (hne _) (fischler_lemma_6_1_linInd_pow htr (fun j : Fin 3 => (j : ℕ)) Fin.val_injective)
  refine strong_six_exponentials_unconditional _ _ hx hy fun i j => ?_
  have hi := i.isLt
  have hj := j.isLt
  have := hmem ⟨(i : ℕ) + j, by omega⟩
  rw [hpow _ (by omega)] at this
  convert this using 1
  rw [pow_add]
  ring

end Diaz
