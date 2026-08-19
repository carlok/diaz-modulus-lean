/-
# The model

The model. See the README, "How the model is realised".

The note builds a formal Laurent model: `K(T)` with the involution
`σ T = ρ / T`, in which the analogue of Diaz's conjecture is false. Here
the same configuration is realised *concretely*, by ordinary complex
numbers: take any `t` transcendental over `K` lying on the circle
`z * conj z = ρ`. Then `conj t = ρ / t`, exactly as `σ T = ρ / T`, and
the norm form on the rational plane spanned by `t` and `conj t` is the
same computation.

This is the honest version of the claim. A candidate `u` and such a `t`
are indistinguishable by any statement about the field structure with its
involution, because `t` genuinely has every algebraic property a
candidate would have. The single thing `t` lacks is that `exp t` be
algebraic — and that is precisely the input no algebraic argument can
reach, which is the point of the note.

Nothing here needs `RatFunc`: a transcendental `t` generates a rational
function field anyway, and working inside `ℂ` keeps complex conjugation
as the involution instead of a constructed one.
-/
import Mathlib
import Diaz.Closure

open ComplexConjugate Polynomial

namespace Diaz

variable {K : Subfield ℂ} {t : ℂ}

/-! ## The norm form -/

/-- On the rational plane spanned by `t` and `conj t`,

    (a t + b t̄)(a t̄ + b t) = (a² + b²)·t t̄ + a b·(t² + t̄²).

This is `x σ(x) = (a² + b²) ρ + a b (T² + ρ²/T²)` of `prop:model`, with
`conj` in place of `σ`. -/
theorem norm_form (t : ℂ) (a b : ℚ) :
    ((a : ℂ) * t + (b : ℂ) * conj t) * conj ((a : ℂ) * t + (b : ℂ) * conj t)
      = ((a : ℂ) ^ 2 + (b : ℂ) ^ 2) * (t * conj t)
        + ((a : ℂ) * (b : ℂ)) * (t ^ 2 + (conj t) ^ 2) := by
  simp only [map_add, map_mul, Complex.conj_conj, map_ratCast]
  ring

/-! ## The cross term is not algebraic -/

/-- If `t` is transcendental over `K` and `ρ = t · conj t` lies in `K`,
then the cross term `t² + conj(t)²` does not lie in `K`.

Otherwise `t` would satisfy `X⁴ - c X² + ρ²`, a non-zero polynomial over
`K`. This is what forces `a b = 0` in the model. -/
theorem sq_add_sq_notMem (hT : Transcendental K t) (hρ : t * conj t ∈ K) :
    t ^ 2 + (conj t) ^ 2 ∉ K := by
  intro hc
  refine hT ?_
  refine ⟨X ^ 4 - C (⟨_, hc⟩ : K) * X ^ 2 + C (⟨_, hρ⟩ : K) ^ 2, ?_, ?_⟩
  · have : (X ^ 4 - C (⟨_, hc⟩ : K) * X ^ 2 + C (⟨_, hρ⟩ : K) ^ 2).Monic := by
      monicity!
    exact this.ne_zero
  · simp only [map_add, map_sub, map_mul, map_pow, aeval_X, aeval_C]
    show t ^ 4 - (t ^ 2 + (conj t) ^ 2) * t ^ 2 + (t * conj t) ^ 2 = 0
    ring

/-! ## The model, `prop:model` -/

/-- **The characterisation of `𝒟₀`.**  For `a, b` rational, the element
`x = a t + b conj t` has `x · conj x ∈ K` exactly when `a = 0` or
`b = 0`.

So the elements of the rational plane with "algebraic modulus" are
precisely the rational multiples of `t` and of `conj t` — the two rays of
`prop:model`, and in particular there are non-zero ones. Every algebraic
constraint a Diaz candidate satisfies is satisfied here too. -/
theorem norm_mem_iff (hT : Transcendental K t) (hρ : t * conj t ∈ K) (a b : ℚ) :
    ((a : ℂ) * t + (b : ℂ) * conj t) * conj ((a : ℂ) * t + (b : ℂ) * conj t) ∈ K
      ↔ a = 0 ∨ b = 0 := by
  have hQ : ∀ q : ℚ, (q : ℂ) ∈ K := fun q => by
    simpa using (K.ratCast_mem q)
  constructor
  · intro hmem
    by_contra hab
    rw [not_or] at hab
    obtain ⟨ha, hb⟩ := hab
    refine sq_add_sq_notMem hT hρ ?_
    have hab0 : ((a : ℂ) * (b : ℂ)) ≠ 0 := by
      simp only [ne_eq, mul_eq_zero, Rat.cast_eq_zero]
      tauto
    have hcross : ((a : ℂ) * (b : ℂ)) * (t ^ 2 + (conj t) ^ 2) ∈ K := by
      have := norm_form t a b
      rw [this] at hmem
      have hfirst : ((a : ℂ) ^ 2 + (b : ℂ) ^ 2) * (t * conj t) ∈ K :=
        mul_mem (add_mem (pow_mem (hQ a) 2) (pow_mem (hQ b) 2)) hρ
      simpa using sub_mem hmem hfirst
    have := div_mem hcross (mul_mem (hQ a) (hQ b))
    rwa [mul_div_cancel_left₀ _ hab0] at this
  · intro h
    rw [norm_form]
    refine add_mem (mul_mem (add_mem (pow_mem (hQ a) 2) (pow_mem (hQ b) 2)) hρ) ?_
    rcases h with rfl | rfl <;>
      simp only [Rat.cast_zero, zero_mul, mul_zero, zero_mem]

/-- `t` and `conj t` are independent over `ℚ`.

This is what makes coordinates `(a, b) ↦ a t + b conj t` well defined, so
that a function of the coordinates is a function on the plane.  It is the
analogue of the axis lemma. -/
theorem indep (hT : Transcendental K t) (hρ : t * conj t ∈ K)
    {a b : ℚ} (h : (a : ℂ) * t + (b : ℂ) * conj t = 0) : a = 0 ∧ b = 0 := by
  have ht0 : t ≠ 0 := transcendental_ne_zero hT
  have hc : conj t = (t * conj t) / t := (conj_eq_rho_div ht0).symm
  have hρ0 : t * conj t ≠ 0 := by
    simp only [ne_eq, mul_eq_zero, not_or]
    exact ⟨ht0, by simpa using ht0⟩
  by_cases ha : a = 0
  · refine ⟨ha, ?_⟩
    rw [ha] at h
    simp only [Rat.cast_zero, zero_mul, zero_add, mul_eq_zero] at h
    rcases h with h | h
    · exact_mod_cast h
    · exact absurd h (by simpa using ht0)
  · exfalso
    -- `a t² + b ρ = 0` with `a ≠ 0` makes `t²`, hence `t`, algebraic over `K`
    refine sq_add_sq_notMem hT hρ ?_
    have key : (t : ℂ) ^ 2 = -((b : ℂ) / (a : ℂ)) * (t * conj t) := by
      rw [hc] at h
      field_simp at h ⊢
      linear_combination h
    have hK2 : (t : ℂ) ^ 2 ∈ K := by
      rw [key]
      exact mul_mem (neg_mem (div_mem (by simpa using K.ratCast_mem b)
        (by simpa using K.ratCast_mem a))) hρ
    have : (conj t) ^ 2 ∈ K := by
      have : (conj t) ^ 2 = (t * conj t) ^ 2 / t ^ 2 := by
        rw [hc]; field_simp
      rw [this]
      exact div_mem (pow_mem hρ 2) hK2
    exact add_mem hK2 this

/-! ## Conjugation is the coordinate swap -/

/-- Complex conjugation acts on the plane by swapping coordinates.  This
is what licenses stating the involution in coordinates. -/
theorem conj_coords (t : ℂ) (a b : ℚ) :
    conj ((a : ℂ) * t + (b : ℂ) * conj t) = (b : ℂ) * t + (a : ℂ) * conj t := by
  simp only [map_add, map_mul, Complex.conj_conj, map_ratCast]
  ring

/-! ## The circle carries a transcendental point

The results above take such a `t` as a hypothesis.  It exists, and the
witness is explicit rather than a cardinality argument: `r · e^i`. -/

/-- `e^i` is transcendental over `ℚ`.  Immediate from Hermite–Lindemann,
since `i` is algebraic and non-zero. -/
theorem transcendental_exp_I : Transcendental ℚ (Complex.exp Complex.I) := by
  intro hcon
  refine (transcendental_of_candidate Complex.I_ne_zero hcon)
    ⟨Polynomial.X ^ 2 - Polynomial.C (-1 : ℚ),
      (Polynomial.monic_X_pow_sub_C (-1 : ℚ) (by norm_num)).ne_zero, ?_⟩
  simp [Complex.I_sq]

/-- **A transcendental point on the circle.**  For any non-zero `r` in a
base `K` algebraic over `ℚ`, the number `t = r · e^i` is transcendental
over `K`, with `t · conj t` equal to `r · conj r` **and** in the base.

Both conclusions are needed: the model lemmas consume the membership,
while the transfer results consume the equality `t · conj t = u · conj u`.
An earlier version gave only the membership, so no exhibited `t` could
discharge the transfer hypotheses.

The hypothesis `conj r ∈ L` is needed and is not implied by `r ∈ L`: for
`L = ℚ(2^{1/3}ω)` and `r = 2^{1/3}ω` one has `r · conj r = 2^{2/3} ∉ L`.
Every result that consumes this already assumes `L` conjugation-stable.

So the hypotheses of `norm_mem_iff` are not merely satisfiable in the
abstract; they are met by an explicit complex number. -/
theorem exists_transcendental_on_circle {L : Subfield ℂ}
    [Algebra.IsAlgebraic ℚ (↥L)] {r : ℂ} (hr : r ∈ L) (hrc : conj r ∈ L)
    (hr0 : r ≠ 0) :
    ∃ t : ℂ, t ≠ 0 ∧ Transcendental (↥L) t ∧ t * conj t = r * conj r
      ∧ t * conj t ∈ L := by
  refine ⟨r * Complex.exp Complex.I, ?_, ?_, ?_, ?_⟩
  · exact mul_ne_zero hr0 (Complex.exp_ne_zero _)
  · intro hcon
    -- if `r·e^i` is algebraic over `L` then so is `e^i`, as `r ∈ L`
    refine transcendental_of_base (L := L) transcendental_exp_I ?_
    have : Complex.exp Complex.I = (r * Complex.exp Complex.I) * (r⁻¹) := by
      field_simp
    rw [this]
    exact hcon.mul (isAlgebraic_algebraMap (R := ↥L) ⟨r⁻¹, inv_mem hr⟩)
  · have hconj : conj (Complex.exp Complex.I) = Complex.exp (-Complex.I) := by
      rw [← Complex.exp_conj]; simp
    rw [map_mul, hconj]
    have : Complex.exp Complex.I * Complex.exp (-Complex.I) = 1 := by
      rw [← Complex.exp_add]; simp
    calc r * Complex.exp Complex.I * (conj r * Complex.exp (-Complex.I))
        = (r * conj r) * (Complex.exp Complex.I * Complex.exp (-Complex.I)) := by ring
      _ = r * conj r := by rw [this, mul_one]
  · -- membership, which is where `conj r ∈ L` is needed
    have hconj : conj (Complex.exp Complex.I) = Complex.exp (-Complex.I) := by
      rw [← Complex.exp_conj]; simp
    have hone : Complex.exp Complex.I * Complex.exp (-Complex.I) = 1 := by
      rw [← Complex.exp_add]; simp
    rw [map_mul, hconj]
    have : r * Complex.exp Complex.I * (conj r * Complex.exp (-Complex.I))
        = r * conj r := by
      calc r * Complex.exp Complex.I * (conj r * Complex.exp (-Complex.I))
          = (r * conj r) * (Complex.exp Complex.I * Complex.exp (-Complex.I)) := by ring
        _ = r * conj r := by rw [hone, mul_one]
    rw [this]
    exact mul_mem hr hrc

/-- The circle condition in the form the matrix results consume.

`exists_transcendental_on_circle` gives `t · conj t = r · conj r`, while
`Rigidity` states its hypotheses as `u · conj u = r ^ 2`.  These agree
exactly when `r` is real — the intended case, `r = √ρ` with `ρ = |u|²` —
which is not implied by `r ∈ L` and so has to be said. -/
theorem exists_transcendental_on_circle_sq {L : Subfield ℂ}
    [Algebra.IsAlgebraic ℚ (↥L)] {r : ℂ} (hr : r ∈ L) (hrr : conj r = r)
    (hr0 : r ≠ 0) :
    ∃ t : ℂ, t ≠ 0 ∧ Transcendental (↥L) t ∧ t * conj t = r ^ 2
      ∧ t * conj t ∈ L := by
  obtain ⟨t, ht0, hT, heq, hmem⟩ :=
    exists_transcendental_on_circle hr (by rw [hrr]; exact hr) hr0
  refine ⟨t, ht0, hT, ?_, hmem⟩
  rw [heq, hrr]; ring

end Diaz
