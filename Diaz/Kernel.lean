/-
# The vanishing ideal of a candidate on its circle

Backup of three nodes published on Prove2Me on 12 September 2026:

* `DiazModulus.candidate_re_transcendental`
  (`4a29c8e8-e667-4035-8bf0-15bd73c2004f`)
* `DiazModulus.candidate_im_transcendental`
  (`1e000329-7c05-4c26-8e94-d72745da813c`)
* `DiazModulus.candidate_vanishing_ideal`
  (`e2d835da-4612-4134-bf11-eca300feeca9`)

A Diaz candidate $u=x+iy$ is algebraically generic on the circle
$x^2+y^2=|u|^2$: a polynomial over $\overline{\mathbb{Q}}$ vanishes at
the point if and only if it is a multiple of $X^2+Y^2-|u|^2$. That is
the content of Diaz's companion note (the kernel proposition). The two
coordinate lemmas are the first step of the same argument — if the real
or imaginary part were algebraic then so would $u$, contradicting
Hermite–Lindemann — and are kept as named theorems because they were
published as their own nodes.

Hermite–Lindemann is an explicit hypothesis (`HermiteLindemannProp` from
`Diaz.Multipliers`), as on the platform.

Since 25 September 2026 the vanishing ideal is a short consequence of the general
`Transcendence.circle_vanishing_ideal` (`Diaz.Mirror.circle_vanishing_ideal`): a point of a circle
of non-zero radius over a field `K`, with one coordinate transcendental over `K`, lies on no curve
over `K` other than multiples of the circle. The platform's node has the same second proof.
-/
import Mathlib
import Diaz.Multipliers
import Diaz.Mirror.circle_vanishing_ideal

open Complex ComplexConjugate

namespace Diaz

noncomputable section

abbrev K := ↥Qbar

lemma I_mem_Qbar : (I : ℂ) ∈ Qbar := by
  rw [mem_Qbar_iff]
  refine ⟨Polynomial.X ^ 2 + Polynomial.C (1 : ℚ),
    Polynomial.X_pow_add_C_ne_zero (by norm_num : (0 : ℕ) < 2) (1 : ℚ), ?_⟩
  simp [Polynomial.aeval_add, Polynomial.aeval_X_pow, I_sq]

lemma ofReal_re_sq_add_im_sq (u : ℂ) :
    ((u.re : ℝ) : ℂ) ^ 2 + ((u.im : ℝ) : ℂ) ^ 2 = ((‖u‖ : ℝ) : ℂ) ^ 2 := by
  calc
    ((u.re : ℝ) : ℂ) ^ 2 + ((u.im : ℝ) : ℂ) ^ 2
        = ((u.re ^ 2 + u.im ^ 2 : ℝ) : ℂ) := by simp [ofReal_pow, ofReal_add]
    _ = (Complex.normSq u : ℂ) := by simp [Complex.normSq_apply, pow_two]
    _ = ((‖u‖ : ℝ) : ℂ) ^ 2 := by rw [Complex.normSq_eq_norm_sq, ofReal_pow]

lemma candidate_re_add_im (u : ℂ) :
    u = ((u.re : ℝ) : ℂ) + ((u.im : ℝ) : ℂ) * I :=
  (Complex.re_add_im u).symm

lemma candidate_mem_Qbar_of_re_im {u : ℂ}
    (hx : ((u.re : ℝ) : ℂ) ∈ Qbar) (hy : ((u.im : ℝ) : ℂ) ∈ Qbar) : u ∈ Qbar := by
  rw [candidate_re_add_im u]
  exact Subfield.add_mem _ hx (Subfield.mul_mem _ hy I_mem_Qbar)

/-- The real part of a candidate is transcendental over `ℚ` (hence over `Q̄`). -/
theorem candidate_re_transcendental (hHL : HermiteLindemannProp) {u : ℂ} (h : IsCandidate u) :
    Transcendental ℚ ((u.re : ℝ) : ℂ) := by
  intro hx
  obtain ⟨hu, hnorm, hexp⟩ := h
  set x : ℂ := ((u.re : ℝ) : ℂ)
  set y : ℂ := ((u.im : ℝ) : ℂ)
  have hxQ : x ∈ Qbar := mem_Qbar_iff.mpr hx
  have hρ : ((‖u‖ : ℝ) : ℂ) ^ 2 ∈ Qbar :=
    Subfield.pow_mem _ (mem_Qbar_iff.mpr hnorm) 2
  have hy2 : y ^ 2 ∈ Qbar := by
    have : y ^ 2 = ((‖u‖ : ℝ) : ℂ) ^ 2 - x ^ 2 := by
      have := ofReal_re_sq_add_im_sq u
      linear_combination this
    rw [this]
    exact Subfield.sub_mem _ hρ (Subfield.pow_mem _ hxQ 2)
  have hy : IsAlgebraic ℚ y :=
    IsAlgebraic.of_pow (n := 2) (by norm_num) (mem_Qbar_iff.mp hy2)
  have hyQ : y ∈ Qbar := mem_Qbar_iff.mpr hy
  have huQ : u ∈ Qbar := candidate_mem_Qbar_of_re_im hxQ hyQ
  exact hHL u hu (mem_Qbar_iff.mp huQ) hexp

/-- The imaginary part of a candidate is transcendental over `ℚ`. -/
theorem candidate_im_transcendental (hHL : HermiteLindemannProp) {u : ℂ} (h : IsCandidate u) :
    Transcendental ℚ ((u.im : ℝ) : ℂ) := by
  intro hy
  obtain ⟨hu, hnorm, hexp⟩ := h
  set x : ℂ := ((u.re : ℝ) : ℂ)
  set y : ℂ := ((u.im : ℝ) : ℂ)
  have hyQ : y ∈ Qbar := mem_Qbar_iff.mpr hy
  have hρ : ((‖u‖ : ℝ) : ℂ) ^ 2 ∈ Qbar :=
    Subfield.pow_mem _ (mem_Qbar_iff.mpr hnorm) 2
  have hx2 : x ^ 2 ∈ Qbar := by
    have : x ^ 2 = ((‖u‖ : ℝ) : ℂ) ^ 2 - y ^ 2 := by
      have := ofReal_re_sq_add_im_sq u
      linear_combination this
    rw [this]
    exact Subfield.sub_mem _ hρ (Subfield.pow_mem _ hyQ 2)
  have hx : IsAlgebraic ℚ x :=
    IsAlgebraic.of_pow (n := 2) (by norm_num) (mem_Qbar_iff.mp hx2)
  have hxQ : x ∈ Qbar := mem_Qbar_iff.mpr hx
  have huQ : u ∈ Qbar := candidate_mem_Qbar_of_re_im hxQ hyQ
  exact hHL u hu (mem_Qbar_iff.mp huQ) hexp

/-- **The vanishing ideal of a candidate.** `(Re u, Im u)` lies on the circle `X₀² + X₁² = ‖u‖²`,
whose radius squared is a non-zero element of `Q̄`, and `Im u` is transcendental over `Q̄`; so this
is `Transcendence.circle_vanishing_ideal` with `K = Q̄`. -/
theorem candidate_vanishing_ideal (hHL : HermiteLindemannProp) {u : ℂ} (h : IsCandidate u)
    (P : MvPolynomial (Fin 2) (↥Qbar)) :
    MvPolynomial.aeval
        (fun i : Fin 2 => if i = 0 then ((u.re : ℝ) : ℂ) else ((u.im : ℝ) : ℂ)) P = 0 ↔
      (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 -
          MvPolynomial.C ⟨((‖u‖ : ℝ) : ℂ) ^ 2,
            Subfield.pow_mem (s := Qbar) (mem_Qbar_iff.mpr h.2.1) 2⟩) ∣ P := by
  have hpt : (fun i : Fin 2 => if i = 0 then ((u.re : ℝ) : ℂ) else ((u.im : ℝ) : ℂ)) =
      ![((u.re : ℝ) : ℂ), ((u.im : ℝ) : ℂ)] := by
    funext i; fin_cases i <;> simp
  rw [hpt]
  refine Transcendence.circle_vanishing_ideal (fun h0 => h.1 ?_) (ofReal_re_sq_add_im_sq u)
    ((Algebra.IsAlgebraic.transcendental_iff (R := ℚ) (S := K) (A := ℂ)).mp
      (candidate_im_transcendental hHL h)) P
  simpa using congrArg Subtype.val h0

end

end Diaz
