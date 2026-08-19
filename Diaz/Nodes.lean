/-
# The reflection circle carries four nodes

The last of the note's algebraic statements, and the axis lemma it needs.

Inside the rational plane spanned by a candidate and its conjugate, the
circle `z · conj z = ρ` contains exactly the four points `±u`, `±conj u`.
The proof is a computation plus one transcendence input, and it needs no
analysis, which is why it is here while the other two obstructions of
that section are not.
-/
import Mathlib
import Diaz.Model

open ComplexConjugate

namespace Diaz

variable {K : Subfield ℂ} {u : ℂ}

/-! ## The axis lemma -/

/-- **A candidate lies on neither axis.**

If `u` were real then `conj u = u`, and if purely imaginary then
`conj u = -u`; either way `u²` lies in the base and `u` is algebraic
over it. -/
theorem not_on_axes (hT : Transcendental K u) (hρ : u * conj u ∈ K) :
    conj u ≠ u ∧ conj u ≠ -u := by
  have key : u ^ 2 ∈ K → False := by
    intro hsq
    refine hT ⟨Polynomial.X ^ 2 - Polynomial.C (⟨_, hsq⟩ : K),
      (Polynomial.monic_X_pow_sub_C _ (by norm_num)).ne_zero, ?_⟩
    simp only [map_sub, map_pow, Polynomial.aeval_X, Polynomial.aeval_C]
    show u ^ 2 - u ^ 2 = 0
    ring
  constructor
  · intro h
    exact key (by rw [show u ^ 2 = u * conj u by rw [h]; ring]; exact hρ)
  · intro h
    refine key ?_
    have : u * conj u = -u ^ 2 := by rw [h]; ring
    rw [this] at hρ
    simpa using neg_mem hρ

/-! ## The norm on the rational plane -/

/-- `v · conj v = (a-b)²ρ + ab(u + conj u)²` for `v = a u + b conj u`.

The note writes the second term as `4ab(Re u)²`, the same thing since
`u + conj u = 2 Re u`. -/
theorem plane_norm (u : ℂ) (a b : ℚ) :
    ((a : ℂ) * u + (b : ℂ) * conj u) * conj ((a : ℂ) * u + (b : ℂ) * conj u)
      = ((a : ℂ) - (b : ℂ)) ^ 2 * (u * conj u)
        + (a : ℂ) * (b : ℂ) * (u + conj u) ^ 2 := by
  simp only [map_add, map_mul, Complex.conj_conj, map_ratCast]
  ring

/-! ## Four nodes -/

/-- **The reflection circle meets the rational plane in four points.**

If `v = a u + b conj u` with `a, b` rational satisfies
`v · conj v = u · conj u`, then `v` is one of `±u`, `±conj u`.

The transcendence input is `(u + conj u)² ∉ K`, which for a candidate
holds because `u + conj u` is a non-zero element of `ℒ`. -/
theorem four_nodes (hρ : u * conj u ∈ K) (hre : (u + conj u) ^ 2 ∉ K)
    {a b : ℚ} (h : ((a : ℂ) * u + (b : ℂ) * conj u)
      * conj ((a : ℂ) * u + (b : ℂ) * conj u) = u * conj u) :
    (a = 1 ∧ b = 0) ∨ (a = -1 ∧ b = 0)
      ∨ (a = 0 ∧ b = 1) ∨ (a = 0 ∧ b = -1) := by
  rw [plane_norm] at h
  have hQ : ∀ q : ℚ, (q : ℂ) ∈ K := fun q => by simpa using (K.ratCast_mem q)
  -- `u * conj u` is non-zero, else `u = 0` and the cross term lies in `K`
  have hρ0 : u * conj u ≠ 0 := by
    intro hc
    refine hre ?_
    have hu0 : u = 0 := by
      rcases mul_eq_zero.mp hc with h' | h'
      · exact h'
      · simpa using congrArg (starRingEnd ℂ) h'
    rw [hu0]
    simpa using zero_mem K
  -- the cross term must vanish, else `(u + conj u)²` would lie in `K`
  have hab : a * b = 0 := by
    by_contra hne
    refine hre ?_
    have hne' : ((a : ℂ) * (b : ℂ)) ≠ 0 := by
      simpa using (Rat.cast_ne_zero (α := ℂ)).mpr hne
    have hstep : (u + conj u) ^ 2
        = (1 - ((a : ℂ) - (b : ℂ)) ^ 2) * (u * conj u) / ((a : ℂ) * (b : ℂ)) := by
      rw [eq_div_iff hne']
      linear_combination h
    rw [hstep]
    exact div_mem (mul_mem (sub_mem (one_mem K)
      (pow_mem (sub_mem (hQ a) (hQ b)) 2)) hρ) (mul_mem (hQ a) (hQ b))
  -- and then `(a - b)² = 1`
  have hsq : (a - b) ^ 2 = 1 := by
    have hz : ((a : ℂ) * (b : ℂ)) = 0 := by exact_mod_cast hab
    rw [hz, zero_mul, add_zero] at h
    have : ((a : ℂ) - (b : ℂ)) ^ 2 = 1 := mul_right_cancel₀ hρ0 (by rw [h, one_mul])
    exact_mod_cast this
  rcases mul_eq_zero.mp hab with ha | hb
  · subst ha
    have : (b - 1) * (b + 1) = 0 := by nlinarith [hsq]
    rcases mul_eq_zero.mp this with h' | h'
    · exact Or.inr (Or.inr (Or.inl ⟨rfl, by linarith⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨rfl, by linarith⟩))
  · subst hb
    have : (a - 1) * (a + 1) = 0 := by nlinarith [hsq]
    rcases mul_eq_zero.mp this with h' | h'
    · exact Or.inl ⟨by linarith, rfl⟩
    · exact Or.inr (Or.inl ⟨by linarith, rfl⟩)

/-! ## Discharging the transcendence input over the intended base

`four_nodes` assumes `(u + conj u)² ∉ K`.  For a candidate that is a
consequence of Hermite–Lindemann: `u + conj u` is a non-zero element of
`ℒ`, hence transcendental, hence so is its square. -/

/-- If `u + conj u` is transcendental over the base then its square is
not in the base. -/
theorem sq_notMem_of_transcendental {L : Subfield ℂ}
    (h : Transcendental (↥L) (u + conj u)) : (u + conj u) ^ 2 ∉ L := by
  intro hmem
  refine h ⟨Polynomial.X ^ 2 - Polynomial.C (⟨_, hmem⟩ : L),
    (Polynomial.monic_X_pow_sub_C _ (by norm_num)).ne_zero, ?_⟩
  simp only [map_sub, map_pow, Polynomial.aeval_X, Polynomial.aeval_C]
  show (u + conj u) ^ 2 - (u + conj u) ^ 2 = 0
  ring

/-- **Four nodes, for a candidate over the intended base.**

The hypothesis on `u + conj u` is exactly that it is a non-zero element
of `ℒ`, since `ℒ` is a `ℚ`-space stable under conjugation; the axiom
then makes it transcendental. -/
theorem four_nodes_candidate {L : Subfield ℂ} [Algebra.IsAlgebraic ℚ (↥L)]
    (hρ : u * conj u ∈ L)
    (hsum0 : u + conj u ≠ 0) (hsumexp : IsAlgebraic ℚ (Complex.exp (u + conj u)))
    {a b : ℚ} (h : ((a : ℂ) * u + (b : ℂ) * conj u)
      * conj ((a : ℂ) * u + (b : ℂ) * conj u) = u * conj u) :
    (a = 1 ∧ b = 0) ∨ (a = -1 ∧ b = 0)
      ∨ (a = 0 ∧ b = 1) ∨ (a = 0 ∧ b = -1) :=
  four_nodes hρ
    (sq_notMem_of_transcendental
      (transcendental_candidate_over_base hsum0 hsumexp)) h

end Diaz
