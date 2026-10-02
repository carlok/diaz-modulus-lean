/-
Mirrored from Prove2Me: `DiazModulus.diaz_2007_qr2_of_trdeg_one`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.diaz_2007_qr2_of_trdeg_one__ac57f45c.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
-/
import Mathlib
import Diaz.Platform
import Diaz.Mirror.log_mul_real_trichotomy_of_trdeg_one
import Diaz.Mirror.log_mul_imaginary_mixed_of_trdeg_one

namespace Diaz

open Complex ComplexConjugate

namespace R2_diaz_2007_qr2_of_trdeg_one

noncomputable def diaz_2007_qr2_of_trdeg_one_cjQ : ℂ →ₐ[ℚ] ℂ :=
  (Complex.conjAe : ℂ ≃ₐ[ℝ] ℂ).toAlgHom.restrictScalars ℚ

/-- The conjugate of a logarithm of an algebraic number is one too. -/
theorem diaz_2007_qr2_of_trdeg_one_exp_conj_alg {w : ℂ} (hw : IsAlgebraic ℚ (Complex.exp w)) :
    IsAlgebraic ℚ (Complex.exp (conj w)) := by
  rw [Complex.exp_conj]; exact hw.algHom diaz_2007_qr2_of_trdeg_one_cjQ

/-- `l̄₀ l₁ = |l₀|² (l₁ / l₀)`: the product and the quotient have the same argument. -/
theorem conj_mul_eq {l₀ l₁ : ℂ} (h : l₀ ≠ 0) :
    conj l₀ * l₁ = (Complex.normSq l₀ : ℂ) * (l₁ / l₀) := by
  rw [← Complex.mul_conj, mul_comm l₀ (conj l₀), mul_assoc, mul_div_assoc', mul_comm l₀ l₁,
    mul_div_assoc, div_self h, mul_one]

end R2_diaz_2007_qr2_of_trdeg_one

open R2_diaz_2007_qr2_of_trdeg_one in
theorem diaz_2007_qr2_of_trdeg_one (l₀ l₁ : ℂ)
    (he₀ : IsAlgebraic ℚ (Complex.exp l₀)) (he₁ : IsAlgebraic ℚ (Complex.exp l₁))
    (h₀ : l₀.re ≠ 0 ∧ l₀.im ≠ 0) (h₁ : l₁.re ≠ 0 ∧ l₁.im ≠ 0)
    (htr : Algebra.trdeg ℚ ↥(Algebra.adjoin ℚ ({l₀, l₁, conj l₀, conj l₁} : Set ℂ)) ≤ 1)
    (hax : (l₁ / l₀).im = 0 ∨ (l₁ / l₀).re = 0) :
    ∃ q : ℚ, l₁ / l₀ = q := by
  have hl₀ : l₀ ≠ 0 := fun h => h₀.1 (by rw [h, Complex.zero_re])
  have hl₁ : l₁ ≠ 0 := fun h => h₁.1 (by rw [h, Complex.zero_re])
  -- `λ := l̄₀`, `μ := l₁`: the adjoined set is the hypothesis's, reordered
  have htr' : Algebra.trdeg ℚ
      ↥(Algebra.adjoin ℚ ({conj l₀, l₁, conj (conj l₀), conj l₁} : Set ℂ)) ≤ 1 := by
    have hset : ({conj l₀, l₁, conj (conj l₀), conj l₁} : Set ℂ)
        = {l₀, l₁, conj l₀, conj l₁} := by
      rw [Complex.conj_conj]; ext z; simp only [Set.mem_insert_iff, Set.mem_singleton_iff]; tauto
    rw [hset]; exact htr
  have hc₀ : conj l₀ ≠ 0 := (map_ne_zero _).2 hl₀
  have hkey : conj l₀ * l₁ = (Complex.normSq l₀ : ℂ) * (l₁ / l₀) := conj_mul_eq hl₀
  rcases hax with h | h
  · -- `l₁ / l₀` real, hence so is `l̄₀ l₁`: the axis branches would put `l̄₀` on an axis
    have hreal : (conj l₀ * l₁).im = 0 := by rw [hkey, Complex.im_ofReal_mul, h, mul_zero]
    rcases log_mul_real_trichotomy_of_trdeg_one (conj l₀) l₁ hc₀ hl₁
        (diaz_2007_qr2_of_trdeg_one_exp_conj_alg he₀) he₁ htr' hreal with ⟨h2, -⟩ | ⟨h2, -⟩ | ⟨q, hq⟩
    · exact (h₀.2 (by simpa using h2)).elim
    · exact (h₀.1 (by simpa using h2)).elim
    · -- `l₁ = q · conj (conj l₀) = q l₀`
      refine ⟨q, ?_⟩
      rw [hq, Complex.conj_conj, mul_div_assoc, div_self hl₀, mul_one]
  · -- `l₁ / l₀` purely imaginary, hence so is `l̄₀ l₁`: then `l̄₀` would lie on an axis
    have himag : (conj l₀ * l₁).re = 0 := by rw [hkey, Complex.re_ofReal_mul, h, mul_zero]
    rcases log_mul_imaginary_mixed_of_trdeg_one (conj l₀) l₁ hc₀ hl₁
        (diaz_2007_qr2_of_trdeg_one_exp_conj_alg he₀) he₁ htr' himag with ⟨h2, -⟩ | ⟨h2, -⟩
    · exact (h₀.2 (by simpa using h2)).elim
    · exact (h₀.1 (by simpa using h2)).elim

end Diaz
