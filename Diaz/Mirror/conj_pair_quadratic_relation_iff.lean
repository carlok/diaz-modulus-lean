/-
Mirrored from Prove2Me: `DiazModulus.conj_pair_quadratic_relation_iff`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.conj_pair_quadratic_relation_iff__1a03eb8f.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib

namespace Diaz

open ComplexConjugate

namespace P14Rel1

/-- Real part of the quadratic form evaluated at `(u, conj u, π i)`. -/
theorem lhs_re (u : ℂ) (a b c d e f : ℚ) :
    ((a : ℂ) * u ^ 2 + (b : ℂ) * conj u ^ 2 + (c : ℂ) * (((Real.pi : ℝ) : ℂ) * Complex.I) ^ 2
        + (d : ℂ) * (u * conj u) + (e : ℂ) * (u * (((Real.pi : ℝ) : ℂ) * Complex.I))
        + (f : ℂ) * (conj u * (((Real.pi : ℝ) : ℂ) * Complex.I))).re
      = ((a : ℝ) + b) * (u.re ^ 2 - u.im ^ 2) - (c : ℝ) * Real.pi ^ 2
        + (d : ℝ) * (u.re ^ 2 + u.im ^ 2) - ((e : ℝ) - f) * Real.pi * u.im := by
  simp only [pow_two, Complex.add_re, Complex.mul_re, Complex.mul_im, Complex.conj_re,
    Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im,
    Complex.ratCast_re, Complex.ratCast_im]
  ring

/-- Imaginary part of the quadratic form evaluated at `(u, conj u, π i)`. -/
theorem lhs_im (u : ℂ) (a b c d e f : ℚ) :
    ((a : ℂ) * u ^ 2 + (b : ℂ) * conj u ^ 2 + (c : ℂ) * (((Real.pi : ℝ) : ℂ) * Complex.I) ^ 2
        + (d : ℂ) * (u * conj u) + (e : ℂ) * (u * (((Real.pi : ℝ) : ℂ) * Complex.I))
        + (f : ℂ) * (conj u * (((Real.pi : ℝ) : ℂ) * Complex.I))).im
      = u.re * (2 * ((a : ℝ) - b) * u.im + ((e : ℝ) + f) * Real.pi) := by
  simp only [pow_two, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.conj_re,
    Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im,
    Complex.ratCast_re, Complex.ratCast_im]
  ring

end P14Rel1

open P14Rel1 in
/-- Expand into real and imaginary parts. The imaginary part is `x (2(a - b) y + (e + f) π)`; since
`x ≠ 0` and `y ∉ ℚ π`, it vanishes iff `a = b` and `e = -f`. Then the real part is
`(2a + d)(x² + y²) - 4a y² - 2e π y - c π²`. -/
theorem conj_pair_quadratic_relation_iff (u : ℂ) (hre : u.re ≠ 0)
    (him : ∀ q : ℚ, u.im ≠ (q : ℝ) * Real.pi) (a b c d e f : ℚ) :
    (a : ℂ) * u ^ 2 + (b : ℂ) * conj u ^ 2 + (c : ℂ) * (((Real.pi : ℝ) : ℂ) * Complex.I) ^ 2 + (d : ℂ) * (u * conj u)
        + (e : ℂ) * (u * (((Real.pi : ℝ) : ℂ) * Complex.I)) + (f : ℂ) * (conj u * (((Real.pi : ℝ) : ℂ) * Complex.I)) = 0 ↔
      a = b ∧ e = -f ∧
        (2 * (a : ℝ) + d) * (u.re ^ 2 + u.im ^ 2)
          = 4 * (a : ℝ) * u.im ^ 2 + 2 * (e : ℝ) * Real.pi * u.im + (c : ℝ) * Real.pi ^ 2 := by
  have hpi : Real.pi ≠ 0 := Real.pi_ne_zero
  constructor
  · intro h
    have hR := lhs_re u a b c d e f
    have hI := lhs_im u a b c d e f
    rw [h, Complex.zero_re] at hR
    rw [h, Complex.zero_im] at hI
    have hI' : 2 * ((a : ℝ) - b) * u.im + ((e : ℝ) + f) * Real.pi = 0 :=
      (mul_eq_zero.1 hI.symm).resolve_left hre
    have hab : a = b := by
      by_contra hne
      have hne' : ((a : ℝ) - b) ≠ 0 := by
        intro h0
        apply hne
        exact_mod_cast sub_eq_zero.1 h0
      apply him (-(e + f) / (2 * (a - b)))
      push_cast
      field_simp
      linear_combination hI'
    subst hab
    have hef : ((e : ℝ) + f) * Real.pi = 0 := by linear_combination hI'
    have hef' : (e : ℝ) + f = 0 := (mul_eq_zero.1 hef).resolve_right hpi
    have hef'' : e = -f := by
      have : e + f = 0 := by exact_mod_cast hef'
      linarith
    refine ⟨rfl, hef'', ?_⟩
    have hfe : (f : ℝ) = -e := by linarith
    rw [hfe] at hR
    linear_combination (-1 : ℝ) * hR
  · rintro ⟨hab, hef, hmain⟩
    subst hab
    subst hef
    apply Complex.ext
    · rw [lhs_re, Complex.zero_re]
      push_cast at hmain ⊢
      linear_combination hmain
    · rw [lhs_im, Complex.zero_im]
      push_cast
      ring

end Diaz
