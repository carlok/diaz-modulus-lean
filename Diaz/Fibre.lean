/-
# At most two candidates in an exponential fibre

Backup of `Diaz.fibre_at_most_two`, Proved on Prove2Me.

Fix a non-zero algebraic `α`. Its logarithms are `u₀ + 2πin`, and their
squared moduli are `q(n) = x² + y² + 4πyn + 4π²n²`, a quadratic in `n`. If
three distinct integers gave algebraic values, interpolation over the
algebraic numbers would make every coefficient algebraic, including `4π²`.
So at most two branches of any one exponential can have algebraic modulus.
That restricts branches, not the number of candidate exponentials, and says
nothing about which branches, if any, qualify.

The Lindemann–Weierstrass machinery this proof shares with
`Diaz.HermiteLindemann` lives there and is imported rather than repeated.
-/
import Mathlib
import Diaz.Closure
import Diaz.Instantiation
import Diaz.Multipliers
import Diaz.HermiteLindemann

open Complex ComplexConjugate

private theorem HL_aux {u : ℂ} (hu : u ≠ 0) (hexp : IsAlgebraic ℚ (Complex.exp u)) :
    Transcendental ℚ u := by
  intro hualg
  have h1 : IsIntegral ℚ u := isAlgebraic_iff_isIntegral.mp hualg
  have h2 : IsIntegral ℚ (Complex.exp u) := isAlgebraic_iff_isIntegral.mp hexp
  refine by
    simpa [Fin.forall_fin_succ] using
      linearIndependent_exp' ![u, 0] ?_ ?_ ![1, -Complex.exp u] ?_ ?_
  · intro i; fin_cases i
    exacts [h1, isIntegral_zero]
  · intro i j; fin_cases i, j <;> simp [hu.symm, *]
  · intro i; fin_cases i; exacts [isIntegral_one, h2.neg]
  · simp

private theorem divdiff {K : Subfield ℂ} {c d ρ : ℂ} {n₁ n₂ n₃ : ℤ}
    (h12 : n₁ ≠ n₂) (h13 : n₁ ≠ n₃) (h23 : n₂ ≠ n₃)
    (h1 : ρ + c * n₁ + d * n₁ ^ 2 ∈ K)
    (h2 : ρ + c * n₂ + d * n₂ ^ 2 ∈ K)
    (h3 : ρ + c * n₃ + d * n₃ ^ 2 ∈ K) : d ∈ K := by
  have e12 : ((n₂ : ℂ) - n₁) ≠ 0 := by
    simpa [sub_eq_zero, Int.cast_injective.eq_iff] using fun h => h12 h.symm
  have e13 : ((n₃ : ℂ) - n₁) ≠ 0 := by
    simpa [sub_eq_zero, Int.cast_injective.eq_iff] using fun h => h13 h.symm
  have e23 : ((n₃ : ℂ) - n₂) ≠ 0 := by
    simpa [sub_eq_zero, Int.cast_injective.eq_iff] using fun h => h23 h.symm
  have key : d = (((ρ + c * n₃ + d * n₃ ^ 2) - (ρ + c * n₁ + d * n₁ ^ 2)) / ((n₃ : ℂ) - n₁)
      - ((ρ + c * n₂ + d * n₂ ^ 2) - (ρ + c * n₁ + d * n₁ ^ 2)) / ((n₂ : ℂ) - n₁))
      / ((n₃ : ℂ) - n₂) := by
    field_simp
    ring
  rw [key]
  have hn : ∀ n : ℤ, ((n : ℂ)) ∈ K := fun n => by simpa using K.intCast_mem n
  exact K.div_mem (K.sub_mem (K.div_mem (K.sub_mem h3 h1) (K.sub_mem (hn n₃) (hn n₁)))
    (K.div_mem (K.sub_mem h2 h1) (K.sub_mem (hn n₂) (hn n₁)))) (K.sub_mem (hn n₃) (hn n₂))

namespace Diaz

theorem fibre_at_most_two {α u v w : ℂ}
    (heu : Complex.exp u = α) (hev : Complex.exp v = α) (hew : Complex.exp w = α)
    (hqu : IsAlgebraic ℚ (u * conj u)) (hqv : IsAlgebraic ℚ (v * conj v))
    (hqw : IsAlgebraic ℚ (w * conj w))
    (huv : u ≠ v) (huw : u ≠ w) (hvw : v ≠ w) : False := by
  have hmem : ∀ z : ℂ, IsAlgebraic ℚ z ↔ z ∈ Qbar := by
    intro z
    rw [Qbar, IntermediateField.mem_toSubfield, mem_algebraicClosure_iff]
  obtain ⟨m, hm⟩ := Complex.exp_eq_exp_iff_exists_int.mp (hev.trans heu.symm)
  obtain ⟨n, hn⟩ := Complex.exp_eq_exp_iff_exists_int.mp (hew.trans heu.symm)
  set c : ℂ := 2 * (Real.pi : ℂ) * Complex.I with hc
  have hc2 : conj (2 : ℂ) = 2 := by
    rw [show (2 : ℂ) = ((2 : ℝ) : ℂ) by norm_num, Complex.conj_ofReal]
  have hcc : conj c = -c := by
    rw [hc]; simp [Complex.conj_I, hc2]
  have hnorm : ∀ (z : ℂ) (k : ℤ), z = u + (k : ℂ) * c →
      z * conj z = (u * conj u) + (c * (conj u - u)) * (k : ℂ) + (-(c ^ 2)) * (k : ℂ) ^ 2 := by
    intro z k hz
    subst hz
    rw [map_add, map_mul, hcc]
    have hk : conj ((k : ℂ)) = (k : ℂ) := by simp
    rw [hk]
    ring
  have hu0 : (0 : ℤ) ≠ m := by
    intro h
    apply huv
    rw [hm, ← h]; simp
  have hu0' : (0 : ℤ) ≠ n := by
    intro h
    apply huw
    rw [hn, ← h]; simp
  have hmn : m ≠ n := by
    intro h
    apply hvw
    rw [hm, hn, h]
  have e0 := hnorm u 0 (by simp)
  have em := hnorm v m hm
  have en := hnorm w n hn
  have hd : (-(c ^ 2)) ∈ Qbar := by
    refine divdiff (K := Qbar) (ρ := u * conj u) (c := c * (conj u - u))
      (d := -(c ^ 2)) hu0 hu0' hmn ?_ ?_ ?_
    · rw [← e0]; exact (hmem _).mp hqu
    · rw [← em]; exact (hmem _).mp hqv
    · rw [← en]; exact (hmem _).mp hqw
  -- -(c^2) = 4 π^2 ; so (π I)^2 = -π^2 = -(-(c^2))/4
  have hpi2 : ((Real.pi : ℂ) * Complex.I) ^ 2 ∈ Qbar := by
    have e : ((Real.pi : ℂ) * Complex.I) ^ 2 = -((-(c ^ 2)) / 4) := by
      rw [hc]; ring
    rw [e]
    exact Qbar.neg_mem (Qbar.div_mem hd (by simpa using Qbar.natCast_mem 4))
  have halg : IsAlgebraic ℚ ((Real.pi : ℂ) * Complex.I) :=
    IsAlgebraic.of_pow (by norm_num) ((hmem _).mpr hpi2)
  have hne : ((Real.pi : ℂ) * Complex.I) ≠ 0 := by
    simp [Complex.ext_iff, Real.pi_ne_zero]
  have hexp : IsAlgebraic ℚ (Complex.exp ((Real.pi : ℂ) * Complex.I)) := by
    rw [Complex.exp_pi_mul_I]
    exact (hmem _).mpr (Qbar.neg_mem Qbar.one_mem)
  exact HL_aux hne hexp halg

end Diaz


