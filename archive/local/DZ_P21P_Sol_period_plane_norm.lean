import Mathlib

open ComplexConjugate

theorem solution (u : ℂ) (a b c : ℝ) :
    Complex.normSq ((a : ℂ) * u + (b : ℂ) * conj u + 2 * (Real.pi : ℂ) * (c : ℂ) * Complex.I)
      = (a + b) ^ 2 * Complex.normSq u
        + 4 * (a * u.im + Real.pi * c) * (Real.pi * c - b * u.im) := by
  simp [Complex.normSq_apply, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.conj_re, Complex.conj_im, Complex.I_re, Complex.I_im, Complex.ofReal_re,
    Complex.ofReal_im]
  ring
