/-
Mirrored from Prove2Me: `DiazModulus.candidate_monomial_not_log`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.candidate_monomial_not_log__0299a382.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.log_pair_rigid_of_trdeg_one
import Diaz.HermiteLindemann

namespace Diaz

open Complex ComplexConjugate

namespace CandMono

theorem candidate_monomial_not_log_alg_iff_mem {z : ℂ} : IsAlgebraic ℚ z ↔ z ∈ Qbar :=
  mem_Qbar_iff.symm

noncomputable def candidate_monomial_not_log_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

theorem candidate_monomial_not_log_alg_conj {z : ℂ} (h : IsAlgebraic ℚ z) : IsAlgebraic ℚ (conj z) := by
  obtain ⟨p, hp0, hp⟩ := h
  refine ⟨p, hp0, ?_⟩
  have : Polynomial.aeval (candidate_monomial_not_log_cjQ z) p = candidate_monomial_not_log_cjQ (Polynomial.aeval z p) :=
    Polynomial.aeval_algHom_apply candidate_monomial_not_log_cjQ z p
  rw [show (conj z : ℂ) = candidate_monomial_not_log_cjQ z from rfl, this, hp, map_zero]

/-- If every element of a `ℚ`-subalgebra `B ⊆ ℂ` is algebraic over `ℚ[x]` for one `x ∈ B`,
then `B` has transcendence degree at most one over `ℚ`. -/
theorem candidate_monomial_not_log_trdeg_le_one_of_adjoin_singleton
    {B : Subalgebra ℚ ℂ} {x : ℂ} (hxB : x ∈ B)
    (halg : ∀ y ∈ B, IsAlgebraic ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) y) :
    Algebra.trdeg ℚ ↥B ≤ 1 := by
  set x' : (↥B) := ⟨x, hxB⟩ with hx'
  have hmap : Subalgebra.map B.val (Algebra.adjoin ℚ ({x'} : Set ↥B))
      = Algebra.adjoin ℚ ({x} : Set ℂ) := by
    rw [AlgHom.map_adjoin]
    congr 1
    simp [hx']
  let e : ↥(Algebra.adjoin ℚ ({x'} : Set ↥B)) ≃ₐ[ℚ] ↥(Algebra.adjoin ℚ ({x} : Set ℂ)) :=
    (Subalgebra.equivMapOfInjective _ B.val Subtype.val_injective).trans
      (Subalgebra.equivOfEq _ _ hmap)
  have : Algebra.IsAlgebraic ↥(Algebra.adjoin ℚ ({x'} : Set ↥B)) ↥B := by
    constructor
    intro y
    refine IsAlgebraic.of_ringHom_of_comp_eq (f := (e : _ →+* _))
      (g := (B.val : ↥B →+* ℂ)) (halg y y.2) e.surjective Subtype.val_injective ?_
    ext c
    rfl
  simpa using Algebra.IsAlgebraic.trdeg_le_cardinalMk ℚ ({x'} : Set ↥B)

/-- The complex numbers algebraic over `ℚ[u]`, as a `ℚ`-subalgebra of `ℂ`. -/
noncomputable def E (u : ℂ) : Subalgebra ℚ ℂ :=
  (Subalgebra.algebraicClosure ↥(Algebra.adjoin ℚ ({u} : Set ℂ)) ℂ).restrictScalars ℚ

theorem mem_E_iff {u z : ℂ} : z ∈ E u ↔ IsAlgebraic ↥(Algebra.adjoin ℚ ({u} : Set ℂ)) z :=
  Iff.rfl

theorem mem_E_of_alg {u z : ℂ} (h : IsAlgebraic ℚ z) : z ∈ E u :=
  h.extendScalars (algebraMap ℚ ↥(Algebra.adjoin ℚ ({u} : Set ℂ))).injective

theorem self_mem_E (u : ℂ) : u ∈ E u := by
  rw [mem_E_iff]
  have h : u = algebraMap ↥(Algebra.adjoin ℚ ({u} : Set ℂ)) ℂ
      ⟨u, Algebra.subset_adjoin rfl⟩ := rfl
  rw [h]
  exact isAlgebraic_algebraMap _

theorem mem_E_of_mul {u z : ℂ} (hu : u ≠ 0) (h : u * z ∈ E u) : z ∈ E u := by
  rw [mem_E_iff] at h ⊢
  exact IsAlgebraic.of_mul (mem_nonZeroDivisors_of_ne_zero hu) (mem_E_iff.1 (self_mem_E u)) h

end CandMono

open CandMono in
theorem candidate_monomial_not_log (u c : ℂ) (hu : IsCandidate u)
    (hc : IsAlgebraic ℚ c) (hc0 : c ≠ 0) (k : ℕ) (hk : 2 ≤ k)
    (hrat : ∃ q : ℚ, c * conj c * (u * conj u) ^ (k - 1) = (q : ℂ)) :
    Transcendental ℚ (Complex.exp (c * u ^ k)) := by
  obtain ⟨hu0, hnorm, hexp⟩ := hu
  obtain ⟨q, hq⟩ := hrat
  intro hv
  -- `ρ = u ū` is algebraic
  have hρ : u * conj u = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring
  have hρalg : IsAlgebraic ℚ (u * conj u) := by rw [hρ]; exact hnorm.pow 2
  have hcu : conj u ≠ 0 := (map_ne_zero _).2 hu0
  have hρ0 : u * conj u ≠ 0 := mul_ne_zero hu0 hcu
  have hcc0 : c * conj c ≠ 0 := mul_ne_zero hc0 ((map_ne_zero _).2 hc0)
  set v : ℂ := c * u ^ k with hv_def
  have hv0 : v ≠ 0 := mul_ne_zero hc0 (pow_ne_zero _ hu0)
  have hk1 : k = (k - 1) + 1 := by omega
  -- `|v|² = q·|u|²`, with `q ≠ 0`
  have hvv : v * conj v = (q : ℂ) * (u * conj u) := by
    rw [hv_def, map_mul, map_pow, ← hq]
    conv_lhs => rw [hk1]
    ring
  have hq0 : (q : ℂ) ≠ 0 := by
    intro h0
    rw [h0, zero_mul] at hvv
    exact mul_ne_zero hv0 ((map_ne_zero _).2 hv0) hvv
  have hq0' : q ≠ 0 := by exact_mod_cast hq0
  have hrel : u * conj u = ((q⁻¹ : ℚ) : ℂ) * (v * conj v) := by
    rw [hvv]; push_cast; field_simp
  -- transcendence degree at most one: everything is algebraic over `ℚ[u]`
  have htr : Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({u, v, conj u, conj v} : Set ℂ)) ≤ 1 := by
    have hxB : u ∈ Algebra.adjoin ℚ ({u, v, conj u, conj v} : Set ℂ) :=
      Algebra.subset_adjoin (by simp)
    refine candidate_monomial_not_log_trdeg_le_one_of_adjoin_singleton hxB ?_
    have huE : u ∈ E u := self_mem_E u
    have hcuE : conj u ∈ E u := mem_E_of_mul hu0 (mem_E_of_alg hρalg)
    have hvE : v ∈ E u := mul_mem (mem_E_of_alg hc) (pow_mem huE k)
    have hcvE : conj v ∈ E u := by
      rw [hv_def, map_mul, map_pow]
      exact mul_mem (mem_E_of_alg (candidate_monomial_not_log_alg_conj hc)) (pow_mem hcuE k)
    have hle : Algebra.adjoin ℚ ({u, v, conj u, conj v} : Set ℂ) ≤ E u := by
      refine Algebra.adjoin_le ?_
      rintro z hz
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
      rcases hz with h | h | h | h <;> rw [h, SetLike.mem_coe]
      exacts [huE, hvE, hcuE, hcvE]
    intro y hy
    exact mem_E_iff.1 (hle hy)
  -- the pair theorem
  obtain ⟨r, hr | hr⟩ :=
    log_pair_rigid_of_trdeg_one u v hu0 hv0 hexp hv (q⁻¹) hrel htr
  · -- `c u^k = r u`: `u^(k-1) = r / c` is algebraic
    have hpow : u ^ (k - 1) = (r : ℂ) / c := by
      have h1 : c * u ^ (k - 1) * u = (r : ℂ) * u := by
        rw [← hr, hv_def]; conv_rhs => rw [hk1]
        ring
      have h2 : c * u ^ (k - 1) = (r : ℂ) := mul_right_cancel₀ hu0 h1
      field_simp; linear_combination h2
    have halg : IsAlgebraic ℚ (u ^ (k - 1)) := by
      rw [hpow, candidate_monomial_not_log_alg_iff_mem]
      exact Subfield.div_mem _ (candidate_monomial_not_log_alg_iff_mem.1 (isAlgebraic_algebraMap (r : ℚ)))
        (candidate_monomial_not_log_alg_iff_mem.1 hc)
    exact hermite_lindemann_holds u hu0 (halg.of_pow (by omega)) hexp
  · -- `c u^k = r ū`: `u^(k+1) = r ρ / c` is algebraic
    have hpow : u ^ (k + 1) = (r : ℂ) * (u * conj u) / c := by
      have h1 : c * u ^ (k + 1) = (r : ℂ) * (u * conj u) := by
        have := congrArg (· * u) hr
        simp only [hv_def] at this
        rw [pow_succ]; linear_combination this
      field_simp; linear_combination h1
    have halg : IsAlgebraic ℚ (u ^ (k + 1)) := by
      rw [hpow, candidate_monomial_not_log_alg_iff_mem]
      exact Subfield.div_mem _ (Subfield.mul_mem _
        (candidate_monomial_not_log_alg_iff_mem.1 (isAlgebraic_algebraMap (r : ℚ))) (candidate_monomial_not_log_alg_iff_mem.1 hρalg))
        (candidate_monomial_not_log_alg_iff_mem.1 hc)
    exact hermite_lindemann_holds u hu0 (halg.of_pow (by omega)) hexp

end Diaz
