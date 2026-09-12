import Mathlib

/-!
# A free-ring no-go theorem (two-variable cut-down)

Formalisation of the theorem of §5.3 of an unpublished decomposition draft,
in the two-variable cut-down `A = K[X, T]`.

This is a statement about polynomial rings only.  It makes no claim about `ℂ`,
about Diaz's conjecture, or about candidates.
-/

namespace DiazFreeRing

open MvPolynomial Submodule

variable {K : Type*} [Field K]

local notation "A" => MvPolynomial (Fin 2) K

/-! ## Exponent vectors -/

/-- The exponent vector of the monomial `X^i T^j`. -/
noncomputable def e (i j : ℕ) : Fin 2 →₀ ℕ :=
  Finsupp.single (0 : Fin 2) i + Finsupp.single (1 : Fin 2) j

@[simp] lemma e_apply_zero (i j : ℕ) : (e i j) 0 = i := by simp [e]
@[simp] lemma e_apply_one (i j : ℕ) : (e i j) 1 = j := by simp [e]

@[simp] lemma e_eq_iff {i j i' j' : ℕ} : e i j = e i' j' ↔ i = i' ∧ j = j' := by
  constructor
  · intro h
    exact ⟨by simpa using congrArg (fun f => f 0) h,
           by simpa using congrArg (fun f => f 1) h⟩
  · rintro ⟨rfl, rfl⟩; rfl

lemma e_self (m : Fin 2 →₀ ℕ) : m = e (m 0) (m 1) := by
  ext k; fin_cases k <;> simp

lemma e_zero_zero : e 0 0 = (0 : Fin 2 →₀ ℕ) := by
  ext k; fin_cases k <;> simp

lemma e10_eq : e 1 0 = Finsupp.single (0 : Fin 2) 1 := by
  ext k; fin_cases k <;> simp

lemma e01_eq : e 0 1 = Finsupp.single (1 : Fin 2) 1 := by
  ext k; fin_cases k <;> simp

lemma e20_eq : e 2 0 = Finsupp.single (0 : Fin 2) 2 := by
  ext k; fin_cases k <;> simp

lemma e02_eq : e 0 2 = Finsupp.single (1 : Fin 2) 2 := by
  ext k; fin_cases k <;> simp

lemma e_add (i j i' j' : ℕ) : e i j + e i' j' = e (i + i') (j + j') := by
  ext k; fin_cases k <;> simp

lemma monomial_e00 (a : K) : (monomial (e 0 0) a : A) = C a := by
  rw [e_zero_zero]; exact congrFun monomial_zero' a

lemma X0_eq : (X 0 : A) = monomial (e 1 0) 1 := by
  rw [e10_eq, ← X_pow_eq_monomial, pow_one]

lemma X1_eq : (X 1 : A) = monomial (e 0 1) 1 := by
  rw [e01_eq, ← X_pow_eq_monomial, pow_one]

lemma X0sq_eq : ((X 0 : A) ^ 2) = monomial (e 2 0) 1 := by
  rw [e20_eq, ← X_pow_eq_monomial]

lemma X1sq_eq : ((X 1 : A) ^ 2) = monomial (e 0 2) 1 := by
  rw [e02_eq, ← X_pow_eq_monomial]

lemma X0X1_eq : ((X 0 : A) * X 1) = monomial (e 1 1) 1 := by
  rw [X0_eq, X1_eq, monomial_mul, mul_one, e_add]

/-! ## Normal forms in degree ≤ 1 and ≤ 2 -/

/-- A polynomial of total degree ≤ 1, in normal form. -/
noncomputable def lin (a b c : K) : A :=
  monomial (e 0 0) a + monomial (e 1 0) b + monomial (e 0 1) c

/-- A polynomial of total degree ≤ 2, in normal form. -/
noncomputable def quad (p q r s t u : K) : A :=
  monomial (e 0 0) p + monomial (e 1 0) q + monomial (e 0 1) r
    + monomial (e 2 0) s + monomial (e 1 1) t + monomial (e 0 2) u

lemma lin_eq_CX (a b c : K) : lin a b c = C a + C b * X 0 + C c * X 1 := by
  rw [X0_eq, X1_eq]
  simp only [lin, C_mul_monomial, mul_one, monomial_e00]

lemma quad_eq_CX (p q r s t u : K) :
    quad p q r s t u
      = C p + C q * X 0 + C r * X 1 + C s * X 0 ^ 2 + C t * (X 0 * X 1) + C u * X 1 ^ 2 := by
  rw [X0sq_eq, X0X1_eq, X1sq_eq, X0_eq, X1_eq]
  simp only [quad, C_mul_monomial, mul_one, monomial_e00]

lemma lin_mul (a b c a' b' c' : K) :
    lin a b c * lin a' b' c' =
      quad (a * a') (a * b' + b * a') (a * c' + c * a') (b * b') (b * c' + c * b') (c * c') := by
  rw [lin_eq_CX, lin_eq_CX, quad_eq_CX]
  simp only [map_add, map_mul]
  ring

/-! ## Coefficients -/

@[simp] lemma coeff_lin_00 (a b c : K) : coeff (e 0 0) (lin a b c) = a := by
  simp [lin, coeff_monomial]
@[simp] lemma coeff_lin_10 (a b c : K) : coeff (e 1 0) (lin a b c) = b := by
  simp [lin, coeff_monomial]
@[simp] lemma coeff_lin_01 (a b c : K) : coeff (e 0 1) (lin a b c) = c := by
  simp [lin, coeff_monomial]

@[simp] lemma coeff_quad_10 (p q r s t u : K) : coeff (e 1 0) (quad p q r s t u) = q := by
  simp [quad, coeff_monomial]
@[simp] lemma coeff_quad_01 (p q r s t u : K) : coeff (e 0 1) (quad p q r s t u) = r := by
  simp [quad, coeff_monomial]
@[simp] lemma coeff_quad_02 (p q r s t u : K) : coeff (e 0 2) (quad p q r s t u) = u := by
  simp [quad, coeff_monomial]

/-! ## Degrees -/

lemma finsupp_sum_eq (m : Fin 2 →₀ ℕ) : (m.sum fun _ n => n) = m 0 + m 1 := by
  rw [Finsupp.sum_fintype _ _ (fun _ => rfl), Fin.sum_univ_two]

lemma coeff_eq_zero_of_totalDegree_lt {p : A} {m : Fin 2 →₀ ℕ}
    (h : p.totalDegree < m 0 + m 1) : coeff m p = 0 := by
  by_contra hc
  have hm : m ∈ p.support := by simpa [MvPolynomial.mem_support_iff] using hc
  have h2 := MvPolynomial.le_totalDegree hm
  rw [finsupp_sum_eq] at h2
  omega

lemma totalDegree_monomial_e (i j : ℕ) {c : K} (hc : c ≠ 0) :
    (monomial (e i j) c : A).totalDegree = i + j := by
  rw [totalDegree_monomial _ hc, finsupp_sum_eq, e_apply_zero, e_apply_one]

lemma totalDegree_monomial_e_le (i j : ℕ) (c : K) :
    (monomial (e i j) c : A).totalDegree ≤ i + j := by
  rcases eq_or_ne c 0 with rfl | hc
  · simp
  · exact le_of_eq (totalDegree_monomial_e i j hc)

lemma coeff_lin_other {i j : ℕ} (h00 : ¬(i = 0 ∧ j = 0)) (h10 : ¬(i = 1 ∧ j = 0))
    (h01 : ¬(i = 0 ∧ j = 1)) (a b c : K) : coeff (e i j) (lin a b c) = 0 := by
  have g1 : ¬ ((0 : ℕ) = i ∧ (0 : ℕ) = j) := by omega
  have g2 : ¬ ((1 : ℕ) = i ∧ (0 : ℕ) = j) := by omega
  have g3 : ¬ ((0 : ℕ) = i ∧ (1 : ℕ) = j) := by omega
  simp [lin, coeff_monomial, g1, g2, g3]

/-- Normal form for a polynomial of total degree at most `1`. -/
lemma eq_lin {p : A} (hd : p.totalDegree ≤ 1) :
    p = lin (coeff (e 0 0) p) (coeff (e 1 0) p) (coeff (e 0 1) p) := by
  ext m
  obtain ⟨i, j, rfl⟩ : ∃ i j, m = e i j := ⟨m 0, m 1, e_self m⟩
  by_cases hij00 : i = 0 ∧ j = 0
  · obtain ⟨rfl, rfl⟩ := hij00; simp
  by_cases hij10 : i = 1 ∧ j = 0
  · obtain ⟨rfl, rfl⟩ := hij10; simp
  by_cases hij01 : i = 0 ∧ j = 1
  · obtain ⟨rfl, rfl⟩ := hij01; simp
  rw [coeff_lin_other hij00 hij10 hij01]
  exact coeff_eq_zero_of_totalDegree_lt (by simp only [e_apply_zero, e_apply_one]; omega)

lemma totalDegree_lin_le (a b c : K) : (lin a b c).totalDegree ≤ 1 := by
  refine (totalDegree_add _ _).trans (max_le ((totalDegree_add _ _).trans (max_le ?_ ?_)) ?_)
  · exact (totalDegree_monomial_e_le 0 0 a).trans (by norm_num)
  · exact (totalDegree_monomial_e_le 1 0 b).trans (by norm_num)
  · exact (totalDegree_monomial_e_le 0 1 c).trans (by norm_num)

/-! ## The certificate spaces -/

lemma one_eq_mono : (1 : A) = monomial (e 0 0) 1 := by rw [monomial_e00]; simp

/-- `P_strong = span_K {1, X, X², X·T}`. -/
noncomputable def Pstrong : Submodule K A := span K {1, X 0, X 0 ^ 2, X 0 * X 1}

/-- `P_ord = span_K {1, X², X·T}`. -/
noncomputable def Pord : Submodule K A := span K {1, X 0 ^ 2, X 0 * X 1}

lemma coeff_eq_zero_of_mem_span {m : Fin 2 →₀ ℕ} {s : Set A} (h : ∀ v ∈ s, coeff m v = 0)
    {p : A} (hp : p ∈ span K s) : coeff m p = 0 := by
  induction hp using Submodule.span_induction with
  | mem x hx => exact h x hx
  | zero => simp
  | add x y _ _ hx hy => simp [hx, hy]
  | smul a x _ hx => simp [hx]

lemma totalDegree_le_of_mem_span {n : ℕ} {s : Set A} (h : ∀ v ∈ s, (v : A).totalDegree ≤ n)
    {p : A} (hp : p ∈ span K s) : p.totalDegree ≤ n := by
  induction hp using Submodule.span_induction with
  | mem x hx => exact h x hx
  | zero => simp
  | add x y _ _ hx hy => exact (totalDegree_add x y).trans (max_le hx hy)
  | smul a x _ hx => exact (totalDegree_smul_le a x).trans hx

lemma Pord_le_Pstrong : (Pord : Submodule K A) ≤ Pstrong := by
  refine span_le.2 ?_
  rintro v (rfl | rfl | rfl) <;> exact subset_span (by simp)

lemma totalDegree_le_two_of_mem_Pstrong {p : A} (hp : p ∈ Pstrong) : p.totalDegree ≤ 2 := by
  refine totalDegree_le_of_mem_span ?_ hp
  rintro v (rfl | rfl | rfl | rfl)
  · simp
  · exact le_trans (by simpa [X0_eq] using totalDegree_monomial_e_le 1 0 (1 : K)) (by norm_num)
  · simpa [X0sq_eq] using totalDegree_monomial_e_le 2 0 (1 : K)
  · simpa [X0X1_eq] using totalDegree_monomial_e_le 1 1 (1 : K)

lemma coeff01_eq_zero_of_mem_Pstrong {p : A} (hp : p ∈ Pstrong) : coeff (e 0 1) p = 0 := by
  refine coeff_eq_zero_of_mem_span ?_ hp
  rintro v (rfl | rfl | rfl | rfl)
  · simp [one_eq_mono, coeff_monomial]
  · simp [X0_eq, coeff_monomial]
  · simp [X0sq_eq, coeff_monomial]
  · simp [X0X1_eq, coeff_monomial]

lemma coeff02_eq_zero_of_mem_Pstrong {p : A} (hp : p ∈ Pstrong) : coeff (e 0 2) p = 0 := by
  refine coeff_eq_zero_of_mem_span ?_ hp
  rintro v (rfl | rfl | rfl | rfl)
  · simp [one_eq_mono, coeff_monomial]
  · simp [X0_eq, coeff_monomial]
  · simp [X0sq_eq, coeff_monomial]
  · simp [X0X1_eq, coeff_monomial]

lemma coeff10_eq_zero_of_mem_Pord {p : A} (hp : p ∈ Pord) : coeff (e 1 0) p = 0 := by
  refine coeff_eq_zero_of_mem_span ?_ hp
  rintro v (rfl | rfl | rfl)
  · simp [one_eq_mono, coeff_monomial]
  · simp [X0sq_eq, coeff_monomial]
  · simp [X0X1_eq, coeff_monomial]

/-! ## Small subspaces -/

lemma mem_span_one_X0 {p : A} (hd : p.totalDegree ≤ 1) (h01 : coeff (e 0 1) p = 0) :
    p ∈ span K ({1, X 0} : Set A) := by
  have hrw : p = (coeff (e 0 0) p) • (1 : A) + (coeff (e 1 0) p) • (X 0 : A) := by
    conv_lhs => rw [eq_lin hd]
    rw [h01, lin_eq_CX]; simp [smul_eq_C_mul]
  rw [hrw]
  exact add_mem (smul_mem _ _ (subset_span (by simp))) (smul_mem _ _ (subset_span (by simp)))

lemma mem_span_one {p : A} (hd : p.totalDegree ≤ 1) (h01 : coeff (e 0 1) p = 0)
    (h10 : coeff (e 1 0) p = 0) : p ∈ span K ({1} : Set A) := by
  have hrw : p = (coeff (e 0 0) p) • (1 : A) := by
    conv_lhs => rw [eq_lin hd]
    rw [h01, h10, lin_eq_CX]; simp [smul_eq_C_mul]
  rw [hrw]
  exact smul_mem _ _ (subset_span rfl)

lemma mem_span_X0 {p : A} (hd : p.totalDegree ≤ 1) (h01 : coeff (e 0 1) p = 0)
    (h00 : coeff (e 0 0) p = 0) : p ∈ span K ({X 0} : Set A) := by
  have hrw : p = (coeff (e 1 0) p) • (X 0 : A) := by
    conv_lhs => rw [eq_lin hd]
    rw [h01, h00, lin_eq_CX]; simp [smul_eq_C_mul]
  rw [hrw]
  exact smul_mem _ _ (subset_span rfl)

lemma eq_zero_of_coeffs {p : A} (hd : p.totalDegree ≤ 1) (h00 : coeff (e 0 0) p = 0)
    (h10 : coeff (e 1 0) p = 0) (h01 : coeff (e 0 1) p = 0) : p = 0 := by
  conv_lhs => rw [eq_lin hd]
  rw [h00, h10, h01, lin_eq_CX]; simp

lemma rank_le_one_of_le_span {Z : Submodule K A} {v : A} (h : Z ≤ span K ({v} : Set A)) :
    Module.rank K Z ≤ 1 := by
  refine (Submodule.rank_mono h).trans ((rank_span_le _).trans ?_)
  simp

lemma rank_le_two_of_le_span {Z : Submodule K A} {v w : A} (h : Z ≤ span K ({v, w} : Set A)) :
    Module.rank K Z ≤ 2 := by
  refine (Submodule.rank_mono h).trans ((rank_span_le _).trans ?_)
  refine Cardinal.mk_insert_le.trans ?_
  simp
  norm_num

/-! ## Assorted small lemmas -/

@[simp] lemma coeff_e01_C (c : K) : coeff (e 0 1) (C c : A) = 0 := by
  rw [← monomial_e00, coeff_monomial]; simp

@[simp] lemma coeff_e00_C (c : K) : coeff (e 0 0) (C c : A) = c := by
  rw [← monomial_e00, coeff_monomial]; simp

lemma not_isUnit_X0 : ¬ IsUnit (X 0 : A) := by
  intro h
  obtain ⟨q, hq⟩ := h.exists_right_inv
  have hX : (X 0 : A) ≠ 0 := X_ne_zero 0
  have hq0 : q ≠ 0 := by rintro rfl; rw [mul_zero] at hq; exact one_ne_zero hq.symm
  have h2 := totalDegree_mul_of_isDomain hX hq0
  rw [hq] at h2
  simp [totalDegree_X] at h2
  omega

lemma totalDegree_le_of_mul {g h : A} (hg : g ≠ 0) {n m : ℕ} (hgd : n ≤ g.totalDegree)
    (hd : (g * h).totalDegree ≤ n + m) : h.totalDegree ≤ m := by
  rcases eq_or_ne h 0 with rfl | hh
  · simp
  · rw [totalDegree_mul_of_isDomain hg hh] at hd; omega

/-- The computation that drives the `deg g = 1` branch: if the product of two linear
polynomials has no `T` and no `T²` coefficient, and the first one is not a multiple of
`X`, then the second one has no `T` coefficient. -/
lemma key_no_T {a c a' c' : K} (h02 : c * c' = 0) (h01 : a * c' + c * a' = 0)
    (hp : ¬(a = 0 ∧ c = 0)) : c' = 0 := by
  rcases eq_or_ne c 0 with rfl | hc
  · have ha : a ≠ 0 := by tauto
    simpa [ha] using h01
  · exact (mul_eq_zero.1 h02).resolve_left hc

lemma mul_mem_span_two (g : A) {h : A} (hd : h.totalDegree ≤ 1) (h01 : coeff (e 0 1) h = 0) :
    g * h ∈ span K ({g, g * X 0} : Set A) := by
  have hrw : g * h = (coeff (e 0 0) h) • g + (coeff (e 1 0) h) • (g * X 0) := by
    conv_lhs => rw [eq_lin hd]
    rw [h01, lin_eq_CX]
    simp only [map_zero, zero_mul, add_zero, smul_eq_C_mul]
    ring
  rw [hrw]
  exact add_mem (smul_mem _ _ (subset_span (by simp))) (smul_mem _ _ (subset_span (by simp)))

lemma lin_zero_mid_zero (b : K) : lin 0 b 0 = C b * X 0 := by rw [lin_eq_CX]; simp

/-- Polynomial core of part 1 of the theorem of §5.3, two-variable cut-down.

If `f/g` is in lowest terms and multiplication by it maps a `≥ 3`-dimensional subspace
`Z ⊆ P_strong` back into `P_strong`, then both `f` and `g` are constants. -/
theorem core_strong {f g : A} (hf : f ≠ 0) (hg : g ≠ 0) (hcop : IsRelPrime g f)
    {Z : Submodule K A} (hZP : Z ≤ Pstrong) (hdim : 3 ≤ Module.rank K Z)
    (hmul : ∀ z ∈ Z, ∃ w ∈ Pstrong, f * z = g * w) :
    f.totalDegree = 0 ∧ g.totalDegree = 0 := by
  have hcon1 : ∀ v : A, ¬ (Z ≤ span K ({v} : Set A)) := by
    intro v h
    have h1 : (3 : Cardinal) ≤ 1 := hdim.trans (rank_le_one_of_le_span h)
    norm_num at h1
  have hcon2 : ∀ v w : A, ¬ (Z ≤ span K ({v, w} : Set A)) := by
    intro v w h
    have h1 : (3 : Cardinal) ≤ 2 := hdim.trans (rank_le_two_of_le_span h)
    norm_num at h1
  have hdvd : ∀ z ∈ Z, g ∣ z := by
    intro z hz
    obtain ⟨w, _, hfz⟩ := hmul z hz
    exact hcop.dvd_of_dvd_mul_left ⟨w, hfz⟩
  have hdeg2 : ∀ z ∈ Z, (z : A).totalDegree ≤ 2 := fun z hz =>
    totalDegree_le_two_of_mem_Pstrong (hZP hz)
  by_cases hgd0 : g.totalDegree = 0
  · -- `deg g = 0`: then `s = f` up to a constant, and `deg f ≥ 1` squeezes `Z` into
    -- `span {1, X}`.
    refine ⟨?_, hgd0⟩
    by_contra hfd
    have hf1 : 1 ≤ f.totalDegree := Nat.one_le_iff_ne_zero.mpr hfd
    have hgC : g = C (g.coeff 0) := totalDegree_eq_zero_iff_eq_C.mp hgd0
    have hgne : (C (g.coeff 0) : A) ≠ 0 := hgC ▸ hg
    refine hcon2 1 (X 0) ?_
    intro z hz
    rcases eq_or_ne z 0 with rfl | hz0
    · exact zero_mem _
    obtain ⟨w, hw, hfz⟩ := hmul z hz
    have hwd : w.totalDegree ≤ 2 := totalDegree_le_two_of_mem_Pstrong hw
    have hd : (f * z).totalDegree ≤ 2 := by
      rw [hfz]
      nth_rewrite 1 [hgC]
      rcases eq_or_ne w 0 with rfl | hw0
      · simp
      · rw [totalDegree_mul_of_isDomain hgne hw0]
        simpa using hwd
    rw [totalDegree_mul_of_isDomain hf hz0] at hd
    exact mem_span_one_X0 (by omega) (coeff01_eq_zero_of_mem_Pstrong (hZP hz))
  by_cases hgd1 : g.totalDegree = 1
  · -- `deg g = 1`
    exfalso
    obtain ⟨a, b, c, hglin⟩ : ∃ a b c : K, g = lin a b c :=
      ⟨_, _, _, eq_lin (le_of_eq hgd1)⟩
    by_cases hac : a = 0 ∧ c = 0
    · -- `g ∼ X`: recurse with `f` in place of `g`.
      obtain ⟨rfl, rfl⟩ := hac
      rw [lin_zero_mid_zero] at hglin
      have hb : b ≠ 0 := by
        rintro rfl; rw [hglin] at hg; simp at hg
      have hXg : (X 0 : A) ∣ g := ⟨C b, by rw [hglin]; ring⟩
      have hXf : ¬ ((X 0 : A) ∣ f) := fun hd => not_isUnit_X0 (hcop hXg hd)
      refine hcon2 (X 0) (X 0 * X 0) ?_
      intro z hz
      obtain ⟨z0, rfl⟩ : ∃ z0, z = X 0 * z0 := hXg.trans (hdvd z hz)
      have hz0d : z0.totalDegree ≤ 1 :=
        totalDegree_le_of_mul (X_ne_zero 0) (n := 1) (m := 1) (by simp)
          (by simpa using hdeg2 _ hz)
      obtain ⟨w, hw, hfz⟩ := hmul _ hz
      rw [hglin] at hfz
      have hcancel : f * z0 = C b * w := by
        refine mul_left_cancel₀ (X_ne_zero 0) ?_
        calc (X 0 : A) * (f * z0) = f * (X 0 * z0) := by ring
        _ = C b * X 0 * w := hfz
        _ = (X 0 : A) * (C b * w) := by ring
      have hfz0 : f * z0 ∈ Pstrong := by
        rw [hcancel, ← smul_eq_C_mul]; exact smul_mem _ _ hw
      have hkey : coeff (e 0 1) z0 = 0 := by
        by_cases hfd0 : f.totalDegree = 0
        · -- `deg f = 0`: `z0` lands in `P_strong` itself
          have hfC : f = C (f.coeff 0) := totalDegree_eq_zero_iff_eq_C.mp hfd0
          have hcne : (f.coeff 0) ≠ 0 := by
            intro h0; rw [h0, map_zero] at hfC; exact hf hfC
          have h2 : (C (f.coeff 0) : A) * z0 = C b * w := by rw [← hfC]; exact hcancel
          have hz0P : z0 ∈ Pstrong := by
            have h3 : z0 = C ((f.coeff 0)⁻¹ * b) * w := by
              rw [map_mul, mul_assoc, ← h2, ← mul_assoc, ← map_mul,
                inv_mul_cancel₀ hcne, map_one, one_mul]
            rw [h3, ← smul_eq_C_mul]
            exact smul_mem _ _ hw
          exact coeff01_eq_zero_of_mem_Pstrong hz0P
        by_cases hfd1 : f.totalDegree = 1
        · -- `deg f = 1`: the same coefficient computation, with `f` in place of `g`
          obtain ⟨a', b', c', hflin⟩ : ∃ a' b' c' : K, f = lin a' b' c' :=
            ⟨_, _, _, eq_lin (le_of_eq hfd1)⟩
          have hac' : ¬(a' = 0 ∧ c' = 0) := by
            rintro ⟨rfl, rfl⟩
            exact hXf ⟨C b', by rw [hflin, lin_zero_mid_zero]; ring⟩
          obtain ⟨d0, d1, dT, hzlin⟩ : ∃ d0 d1 dT : K, z0 = lin d0 d1 dT :=
            ⟨_, _, _, eq_lin hz0d⟩
          have h02 : c' * dT = 0 := by
            have := coeff02_eq_zero_of_mem_Pstrong hfz0
            rw [hflin, hzlin, lin_mul] at this
            simpa using this
          have h01 : a' * dT + c' * d0 = 0 := by
            have := coeff01_eq_zero_of_mem_Pstrong hfz0
            rw [hflin, hzlin, lin_mul] at this
            simpa using this
          rw [hzlin]
          simpa using key_no_T h02 h01 hac'
        · -- `deg f ≥ 2`
          have hf2 : 2 ≤ f.totalDegree := by omega
          rcases eq_or_ne z0 0 with rfl | hz00
          · simp
          have hd : (f * z0).totalDegree ≤ 2 := totalDegree_le_two_of_mem_Pstrong hfz0
          rw [totalDegree_mul_of_isDomain hf hz00] at hd
          have hz0z : z0.totalDegree = 0 := by omega
          rw [totalDegree_eq_zero_iff_eq_C.mp hz0z]
          exact coeff_e01_C _
      exact mul_mem_span_two (X 0) hz0d hkey
    · -- `g` is not a multiple of `X`
      refine hcon2 g (g * X 0) ?_
      intro z hz
      obtain ⟨h, hq⟩ := hdvd z hz
      have hhd : h.totalDegree ≤ 1 :=
        totalDegree_le_of_mul hg (n := 1) (m := 1) (le_of_eq hgd1.symm)
          (by rw [← hq]; simpa using hdeg2 z hz)
      obtain ⟨h0, h1, hT, hhlin⟩ : ∃ h0 h1 hT : K, h = lin h0 h1 hT := ⟨_, _, _, eq_lin hhd⟩
      have hprod : g * h ∈ Pstrong := hq ▸ hZP hz
      have h02 : c * hT = 0 := by
        have := coeff02_eq_zero_of_mem_Pstrong hprod
        rw [hglin, hhlin, lin_mul] at this
        simpa using this
      have h01 : a * hT + c * h0 = 0 := by
        have := coeff01_eq_zero_of_mem_Pstrong hprod
        rw [hglin, hhlin, lin_mul] at this
        simpa using this
      have hT0 : coeff (e 0 1) h = 0 := by
        rw [hhlin]; simpa using key_no_T h02 h01 hac
      rw [hq]
      exact mul_mem_span_two g hhd hT0
  · -- `deg g ≥ 2`
    exfalso
    have hg2 : 2 ≤ g.totalDegree := by omega
    refine hcon1 g ?_
    intro z hz
    obtain ⟨q, hq⟩ := hdvd z hz
    rcases eq_or_ne z 0 with rfl | hz0
    · exact zero_mem _
    have hq0 : q ≠ 0 := by rintro rfl; rw [mul_zero] at hq; exact hz0 hq
    have hd : z.totalDegree ≤ 2 := hdeg2 z hz
    rw [hq, totalDegree_mul_of_isDomain hg hq0] at hd
    have hqd : q.totalDegree = 0 := by omega
    rw [hq, totalDegree_eq_zero_iff_eq_C.mp hqd, mul_comm, ← smul_eq_C_mul]
    exact smul_mem _ _ (subset_span rfl)

/-! ## Extra lemmas for the ordinary case -/

lemma totalDegree_le_two_of_mem_Pord {p : A} (hp : p ∈ Pord) : p.totalDegree ≤ 2 :=
  totalDegree_le_two_of_mem_Pstrong (Pord_le_Pstrong hp)

lemma coeff01_eq_zero_of_mem_Pord {p : A} (hp : p ∈ Pord) : coeff (e 0 1) p = 0 :=
  coeff01_eq_zero_of_mem_Pstrong (Pord_le_Pstrong hp)

lemma coeff02_eq_zero_of_mem_Pord {p : A} (hp : p ∈ Pord) : coeff (e 0 2) p = 0 :=
  coeff02_eq_zero_of_mem_Pstrong (Pord_le_Pstrong hp)

lemma smul_lin (k a b c : K) : k • lin a b c = lin (k * a) (k * b) (k * c) := by
  simp [lin, smul_add, smul_monomial]

lemma X0_eq_lin : (X 0 : A) = lin 0 1 0 := by rw [lin_eq_CX]; simp

lemma coeff10_X0_mul {q : A} (hd : q.totalDegree ≤ 1) :
    coeff (e 1 0) ((X 0 : A) * q) = coeff (e 0 0) q := by
  conv_lhs => rw [eq_lin hd]
  rw [X0_eq_lin, lin_mul]
  simp

lemma mul_mem_span_one (g : A) {h : A} (hd : h.totalDegree ≤ 1) (h01 : coeff (e 0 1) h = 0)
    (h00 : coeff (e 0 0) h = 0) : g * h ∈ span K ({g * X 0} : Set A) := by
  have hrw : g * h = (coeff (e 1 0) h) • (g * X 0) := by
    conv_lhs => rw [eq_lin hd]
    rw [h01, h00, lin_eq_CX]
    simp only [map_zero, zero_mul, add_zero, zero_add, smul_eq_C_mul]
    ring
  rw [hrw]
  exact smul_mem _ _ (subset_span rfl)

/-- Polynomial core of part 2 of the theorem of §5.3, two-variable cut-down. -/
theorem core_ord {f g : A} (hf : f ≠ 0) (hg : g ≠ 0) (hcop : IsRelPrime g f)
    {Z : Submodule K A} (hZP : Z ≤ Pord) (hdim : 2 ≤ Module.rank K Z)
    (hmul : ∀ z ∈ Z, ∃ w ∈ Pord, f * z = g * w) :
    f.totalDegree = 0 ∧ g.totalDegree = 0 := by
  have hcon1 : ∀ v : A, ¬ (Z ≤ span K ({v} : Set A)) := by
    intro v h
    have h1 : (2 : Cardinal) ≤ 1 := hdim.trans (rank_le_one_of_le_span h)
    norm_num at h1
  have hdvd : ∀ z ∈ Z, g ∣ z := by
    intro z hz
    obtain ⟨w, _, hfz⟩ := hmul z hz
    exact hcop.dvd_of_dvd_mul_left ⟨w, hfz⟩
  have hdeg2 : ∀ z ∈ Z, (z : A).totalDegree ≤ 2 := fun z hz =>
    totalDegree_le_two_of_mem_Pord (hZP hz)
  by_cases hgd0 : g.totalDegree = 0
  · refine ⟨?_, hgd0⟩
    by_contra hfd
    have hf1 : 1 ≤ f.totalDegree := Nat.one_le_iff_ne_zero.mpr hfd
    have hgC : g = C (g.coeff 0) := totalDegree_eq_zero_iff_eq_C.mp hgd0
    have hgne : (C (g.coeff 0) : A) ≠ 0 := hgC ▸ hg
    refine hcon1 1 ?_
    intro z hz
    rcases eq_or_ne z 0 with rfl | hz0
    · exact zero_mem _
    obtain ⟨w, hw, hfz⟩ := hmul z hz
    have hwd : w.totalDegree ≤ 2 := totalDegree_le_two_of_mem_Pord hw
    have hd : (f * z).totalDegree ≤ 2 := by
      rw [hfz]
      nth_rewrite 1 [hgC]
      rcases eq_or_ne w 0 with rfl | hw0
      · simp
      · rw [totalDegree_mul_of_isDomain hgne hw0]
        simpa using hwd
    rw [totalDegree_mul_of_isDomain hf hz0] at hd
    exact mem_span_one (by omega) (coeff01_eq_zero_of_mem_Pord (hZP hz))
      (coeff10_eq_zero_of_mem_Pord (hZP hz))
  by_cases hgd1 : g.totalDegree = 1
  · exfalso
    obtain ⟨a, b, c, hglin⟩ : ∃ a b c : K, g = lin a b c :=
      ⟨_, _, _, eq_lin (le_of_eq hgd1)⟩
    by_cases hac : a = 0 ∧ c = 0
    · -- `g ∼ X`
      obtain ⟨rfl, rfl⟩ := hac
      rw [lin_zero_mid_zero] at hglin
      have hb : b ≠ 0 := by rintro rfl; rw [hglin] at hg; simp at hg
      have hXg : (X 0 : A) ∣ g := ⟨C b, by rw [hglin]; ring⟩
      have hXf : ¬ ((X 0 : A) ∣ f) := fun hd => not_isUnit_X0 (hcop hXg hd)
      refine hcon1 (X 0 * X 0) ?_
      intro z hz
      obtain ⟨z0, rfl⟩ : ∃ z0, z = X 0 * z0 := hXg.trans (hdvd z hz)
      have hz0d : z0.totalDegree ≤ 1 :=
        totalDegree_le_of_mul (X_ne_zero 0) (n := 1) (m := 1) (by simp)
          (by simpa using hdeg2 _ hz)
      have h00 : coeff (e 0 0) z0 = 0 := by
        rw [← coeff10_X0_mul hz0d]
        exact coeff10_eq_zero_of_mem_Pord (hZP hz)
      obtain ⟨w, hw, hfz⟩ := hmul _ hz
      rw [hglin] at hfz
      have hcancel : f * z0 = C b * w := by
        refine mul_left_cancel₀ (X_ne_zero 0) ?_
        calc (X 0 : A) * (f * z0) = f * (X 0 * z0) := by ring
        _ = C b * X 0 * w := hfz
        _ = (X 0 : A) * (C b * w) := by ring
      have hfz0 : f * z0 ∈ Pord := by
        rw [hcancel, ← smul_eq_C_mul]; exact smul_mem _ _ hw
      have hkey : coeff (e 0 1) z0 = 0 := by
        by_cases hfd0 : f.totalDegree = 0
        · have hfC : f = C (f.coeff 0) := totalDegree_eq_zero_iff_eq_C.mp hfd0
          have hcne : (f.coeff 0) ≠ 0 := by
            intro h0; rw [h0, map_zero] at hfC; exact hf hfC
          have h2 : (C (f.coeff 0) : A) * z0 = C b * w := by rw [← hfC]; exact hcancel
          have hz0P : z0 ∈ Pord := by
            have h3 : z0 = C ((f.coeff 0)⁻¹ * b) * w := by
              rw [map_mul, mul_assoc, ← h2, ← mul_assoc, ← map_mul,
                inv_mul_cancel₀ hcne, map_one, one_mul]
            rw [h3, ← smul_eq_C_mul]
            exact smul_mem _ _ hw
          exact coeff01_eq_zero_of_mem_Pord hz0P
        by_cases hfd1 : f.totalDegree = 1
        · obtain ⟨a', b', c', hflin⟩ : ∃ a' b' c' : K, f = lin a' b' c' :=
            ⟨_, _, _, eq_lin (le_of_eq hfd1)⟩
          have hac' : ¬(a' = 0 ∧ c' = 0) := by
            rintro ⟨rfl, rfl⟩
            exact hXf ⟨C b', by rw [hflin, lin_zero_mid_zero]; ring⟩
          obtain ⟨d0, d1, dT, hzlin⟩ : ∃ d0 d1 dT : K, z0 = lin d0 d1 dT :=
            ⟨_, _, _, eq_lin hz0d⟩
          have h02 : c' * dT = 0 := by
            have := coeff02_eq_zero_of_mem_Pord hfz0
            rw [hflin, hzlin, lin_mul] at this
            simpa using this
          have h01 : a' * dT + c' * d0 = 0 := by
            have := coeff01_eq_zero_of_mem_Pord hfz0
            rw [hflin, hzlin, lin_mul] at this
            simpa using this
          rw [hzlin]
          simpa using key_no_T h02 h01 hac'
        · have hf2 : 2 ≤ f.totalDegree := by omega
          rcases eq_or_ne z0 0 with rfl | hz00
          · simp
          have hd : (f * z0).totalDegree ≤ 2 := totalDegree_le_two_of_mem_Pord hfz0
          rw [totalDegree_mul_of_isDomain hf hz00] at hd
          have hz0z : z0.totalDegree = 0 := by omega
          rw [totalDegree_eq_zero_iff_eq_C.mp hz0z]
          exact coeff_e01_C _
      exact mul_mem_span_one (X 0) hz0d hkey h00
    · -- `g` is not a multiple of `X`
      have hprep : ∀ z ∈ Z, ∃ h : A, z = g * h ∧ h.totalDegree ≤ 1 ∧
          c * coeff (e 0 1) h = 0 ∧ a * coeff (e 0 1) h + c * coeff (e 0 0) h = 0 ∧
          a * coeff (e 1 0) h + b * coeff (e 0 0) h = 0 := by
        intro z hz
        obtain ⟨h, hq⟩ := hdvd z hz
        have hhd : h.totalDegree ≤ 1 :=
          totalDegree_le_of_mul hg (n := 1) (m := 1) (le_of_eq hgd1.symm)
            (by rw [← hq]; simpa using hdeg2 z hz)
        obtain ⟨h0, h1, hT, hhlin⟩ : ∃ h0 h1 hT : K, h = lin h0 h1 hT := ⟨_, _, _, eq_lin hhd⟩
        have hprod : g * h ∈ Pord := hq ▸ hZP hz
        refine ⟨h, hq, hhd, ?_, ?_, ?_⟩
        · have := coeff02_eq_zero_of_mem_Pord hprod
          rw [hglin, hhlin, lin_mul] at this
          rw [hhlin]; simpa using this
        · have := coeff01_eq_zero_of_mem_Pord hprod
          rw [hglin, hhlin, lin_mul] at this
          rw [hhlin]; simpa using this
        · have := coeff10_eq_zero_of_mem_Pord hprod
          rw [hglin, hhlin, lin_mul] at this
          rw [hhlin]; simpa using this
      by_cases hc : c = 0
      · -- `g = α + βX` with `α ≠ 0`; the extra `X`-condition cuts `H` to a line
        subst hc
        have ha : a ≠ 0 := by tauto
        refine hcon1 (g * lin a (-b) 0) ?_
        intro z hz
        obtain ⟨h, hq, hhd, -, h01, h10⟩ := hprep z hz
        have hT0 : coeff (e 0 1) h = 0 := by
          have := h01; simp at this; tauto
        have hrw : h = (coeff (e 0 0) h * a⁻¹) • lin a (-b) 0 := by
          conv_lhs => rw [eq_lin hhd]
          rw [hT0, smul_lin]
          congr 1
          · field_simp
          · field_simp; linear_combination h10
          · ring
        rw [hq, hrw, mul_smul_comm]
        exact smul_mem _ _ (subset_span rfl)
      · -- `γ ≠ 0`
        refine hcon1 (g * X 0) ?_
        intro z hz
        obtain ⟨h, hq, hhd, h02, h01, -⟩ := hprep z hz
        have hT0 : coeff (e 0 1) h = 0 := (mul_eq_zero.1 h02).resolve_left hc
        have h000 : coeff (e 0 0) h = 0 := by
          rw [hT0, mul_zero, zero_add] at h01
          exact (mul_eq_zero.1 h01).resolve_left hc
        rw [hq]
        exact mul_mem_span_one g hhd hT0 h000
  · -- `deg g ≥ 2`
    exfalso
    have hg2 : 2 ≤ g.totalDegree := by omega
    refine hcon1 g ?_
    intro z hz
    obtain ⟨q, hq⟩ := hdvd z hz
    rcases eq_or_ne z 0 with rfl | hz0
    · exact zero_mem _
    have hq0 : q ≠ 0 := by rintro rfl; rw [mul_zero] at hq; exact hz0 hq
    have hd : z.totalDegree ≤ 2 := hdeg2 z hz
    rw [hq, totalDegree_mul_of_isDomain hg hq0] at hd
    have hqd : q.totalDegree = 0 := by omega
    rw [hq, totalDegree_eq_zero_iff_eq_C.mp hqd, mul_comm, ← smul_eq_C_mul]
    exact smul_mem _ _ (subset_span rfl)

variable {F : Type*} [Field F] [Algebra (MvPolynomial (Fin 2) K) F]
  [IsFractionRing (MvPolynomial (Fin 2) K) F]

/-- **Theorem (§5.3, part 1), two-variable cut-down.**
Let `A = K[X, T]`, `P_strong = span_K {1, X, X², X·T} ⊆ A`, let `s` be an element of the
fraction field of `A` and let `Z` be a `K`-subspace of `A`.  If `Z ⊆ P_strong`,
`dim_K Z ≥ 3` and `s · Z ⊆ P_strong`, then `s` is a constant. -/
theorem nogo_strong (s : F) {Z : Submodule K A}
    (hZP : Z ≤ Pstrong) (hdim : 3 ≤ Module.rank K Z)
    (hs : ∀ z ∈ Z, ∃ w ∈ Pstrong, s * algebraMap A F z = algebraMap A F w) :
    ∃ k : K, s = algebraMap A F (C k) := by
  obtain ⟨f, g, hcop, hmk⟩ :=
    IsFractionRing.exists_reduced_fraction (MvPolynomial (Fin 2) K) s
  have hg0 : (g : A) ≠ 0 := nonZeroDivisors.coe_ne_zero g
  have hgne : algebraMap A F (g : A) ≠ 0 :=
    IsFractionRing.to_map_ne_zero_of_mem_nonZeroDivisors g.2
  have hspec : s * algebraMap A F (g : A) = algebraMap A F f := by
    rw [← hmk]; exact IsLocalization.mk'_spec _ _ _
  rcases eq_or_ne f 0 with rfl | hf0
  · refine ⟨0, ?_⟩
    rw [map_zero] at hspec
    have hs0 : s = 0 := (mul_eq_zero.1 hspec).resolve_right hgne
    simp [hs0]
  have hmul : ∀ z ∈ Z, ∃ w ∈ Pstrong, f * z = (g : A) * w := by
    intro z hz
    obtain ⟨w, hw, hw2⟩ := hs z hz
    refine ⟨w, hw, ?_⟩
    refine IsFractionRing.injective (MvPolynomial (Fin 2) K) F ?_
    rw [map_mul, map_mul]
    calc algebraMap A F f * algebraMap A F z
        = (s * algebraMap A F (g : A)) * algebraMap A F z := by rw [hspec]
      _ = (s * algebraMap A F z) * algebraMap A F (g : A) := by ring
      _ = algebraMap A F w * algebraMap A F (g : A) := by rw [hw2]
      _ = algebraMap A F (g : A) * algebraMap A F w := by ring
  obtain ⟨hfd, hgd⟩ := core_strong hf0 hg0 hcop.symm hZP hdim hmul
  obtain ⟨cf, hfC⟩ : ∃ cf, f = C cf := ⟨_, totalDegree_eq_zero_iff_eq_C.mp hfd⟩
  obtain ⟨cg, hgC⟩ : ∃ cg, (g : A) = C cg := ⟨_, totalDegree_eq_zero_iff_eq_C.mp hgd⟩
  have hcg : cg ≠ 0 := by rintro rfl; rw [map_zero] at hgC; exact hg0 hgC
  have hpoly : (C (cf / cg) : A) * C cg = C cf := by
    rw [← map_mul, div_mul_cancel₀ _ hcg]
  refine ⟨cf / cg, mul_right_cancel₀ hgne ?_⟩
  rw [hspec, ← map_mul, hfC, hgC, hpoly]

/-- **Theorem (§5.3, part 2), two-variable cut-down.**
Same, with `P_ord = span_K {1, X², X·T}` and the dimension threshold `2`. -/
theorem nogo_ord (s : F) {Z : Submodule K A}
    (hZP : Z ≤ Pord) (hdim : 2 ≤ Module.rank K Z)
    (hs : ∀ z ∈ Z, ∃ w ∈ Pord, s * algebraMap A F z = algebraMap A F w) :
    ∃ k : K, s = algebraMap A F (C k) := by
  obtain ⟨f, g, hcop, hmk⟩ :=
    IsFractionRing.exists_reduced_fraction (MvPolynomial (Fin 2) K) s
  have hg0 : (g : A) ≠ 0 := nonZeroDivisors.coe_ne_zero g
  have hgne : algebraMap A F (g : A) ≠ 0 :=
    IsFractionRing.to_map_ne_zero_of_mem_nonZeroDivisors g.2
  have hspec : s * algebraMap A F (g : A) = algebraMap A F f := by
    rw [← hmk]; exact IsLocalization.mk'_spec _ _ _
  rcases eq_or_ne f 0 with rfl | hf0
  · refine ⟨0, ?_⟩
    rw [map_zero] at hspec
    have hs0 : s = 0 := (mul_eq_zero.1 hspec).resolve_right hgne
    simp [hs0]
  have hmul : ∀ z ∈ Z, ∃ w ∈ Pord, f * z = (g : A) * w := by
    intro z hz
    obtain ⟨w, hw, hw2⟩ := hs z hz
    refine ⟨w, hw, ?_⟩
    refine IsFractionRing.injective (MvPolynomial (Fin 2) K) F ?_
    rw [map_mul, map_mul]
    calc algebraMap A F f * algebraMap A F z
        = (s * algebraMap A F (g : A)) * algebraMap A F z := by rw [hspec]
      _ = (s * algebraMap A F z) * algebraMap A F (g : A) := by ring
      _ = algebraMap A F w * algebraMap A F (g : A) := by rw [hw2]
      _ = algebraMap A F (g : A) * algebraMap A F w := by ring
  obtain ⟨hfd, hgd⟩ := core_ord hf0 hg0 hcop.symm hZP hdim hmul
  obtain ⟨cf, hfC⟩ : ∃ cf, f = C cf := ⟨_, totalDegree_eq_zero_iff_eq_C.mp hfd⟩
  obtain ⟨cg, hgC⟩ : ∃ cg, (g : A) = C cg := ⟨_, totalDegree_eq_zero_iff_eq_C.mp hgd⟩
  have hcg : cg ≠ 0 := by rintro rfl; rw [map_zero] at hgC; exact hg0 hgC
  have hpoly : (C (cf / cg) : A) * C cg = C cf := by
    rw [← map_mul, div_mul_cancel₀ _ hcg]
  refine ⟨cf / cg, mul_right_cancel₀ hgne ?_⟩
  rw [hspec, ← map_mul, hfC, hgC, hpoly]

/-! ## Non-vacuity and sharpness

The statements above are not vacuous, and the dimension threshold `3` in part 1 cannot
be lowered to `2`.  The witness is exactly the `2 × 2` template that strong four
exponentials does provide (`x = (1, c/X)`, `y = (1, X)`, entries `1, X, c/X, c`);
after clearing the denominator it becomes `Z = span {X, X²}` and `s = 1/X`. -/

lemma li_monomials {i j i' j' : ℕ} (h : ¬(i = i' ∧ j = j')) :
    LinearIndependent K ![(monomial (e i j) (1 : K) : A), monomial (e i' j') 1] := by
  have h' : ¬(i' = i ∧ j' = j) := by omega
  rw [LinearIndependent.pair_iff]
  intro u v hs
  simp only [smul_monomial, smul_eq_mul, mul_one] at hs
  refine ⟨?_, ?_⟩
  · have hu := congrArg (coeff (e i j)) hs
    simpa [coeff_monomial, h'] using hu
  · have hv := congrArg (coeff (e i' j')) hs
    simpa [coeff_monomial, h] using hv

lemma rank_span_pair_monomials {i j i' j' : ℕ} (h : ¬(i = i' ∧ j = j')) :
    Module.rank K
        (span K ({monomial (e i j) (1 : K), monomial (e i' j') (1 : K)} : Set A)) = 2 := by
  have hr : Set.range ![(monomial (e i j) (1 : K) : A), monomial (e i' j') 1]
      = ({monomial (e i j) (1 : K), monomial (e i' j') (1 : K)} : Set A) := by
    ext x; simp only [Set.mem_range, Fin.exists_fin_two, Matrix.cons_val_zero,
      Matrix.cons_val_one, Set.mem_insert_iff, Set.mem_singleton_iff]
    tauto
  have h' : ¬(i' = i ∧ j' = j) := by omega
  have hne : (monomial (e i j) (1 : K) : A) ≠ monomial (e i' j') 1 := by
    intro hc
    have hcc := congrArg (coeff (e i j)) hc
    simp [coeff_monomial, h'] at hcc
  rw [← hr, rank_span (li_monomials h), hr, Cardinal.mk_insert (by simpa using hne)]
  simp
  norm_num

/-- Sharpness of part 1: with `dim_K Z = 2` the conclusion fails. -/
theorem sharp_strong :
    ∃ (Z : Submodule K A) (s : F), Z ≤ Pstrong ∧ 2 ≤ Module.rank K Z ∧
      (∀ z ∈ Z, ∃ w ∈ Pstrong, s * algebraMap A F z = algebraMap A F w) ∧
      ¬ ∃ k : K, s = algebraMap A F (C k) := by
  have hXne : algebraMap A F (X 0 : A) ≠ 0 := by
    intro h
    rw [← map_zero (algebraMap A F)] at h
    exact X_ne_zero 0 (IsFractionRing.injective (MvPolynomial (Fin 2) K) F h)
  refine ⟨span K ({X 0, (X 0 : A) ^ 2} : Set A), (algebraMap A F (X 0 : A))⁻¹, ?_, ?_, ?_, ?_⟩
  · exact span_le.2 (by rintro v (rfl | rfl) <;> exact subset_span (by simp))
  · have hset : ({X 0, (X 0 : A) ^ 2} : Set A)
        = {monomial (e 1 0) (1 : K), monomial (e 2 0) (1 : K)} := by
      rw [X0sq_eq, X0_eq]
    rw [hset, rank_span_pair_monomials (by omega)]
  · intro z hz
    obtain ⟨u, v, rfl⟩ := Submodule.mem_span_pair.1 hz
    refine ⟨u • (1 : A) + v • (X 0 : A), ?_, ?_⟩
    · exact add_mem (smul_mem _ _ (subset_span (by simp))) (smul_mem _ _ (subset_span (by simp)))
    · have hzz : u • (X 0 : A) + v • ((X 0 : A) ^ 2) = X 0 * (u • (1 : A) + v • (X 0 : A)) := by
        simp only [smul_eq_C_mul]; ring
      rw [hzz, map_mul, ← mul_assoc, inv_mul_cancel₀ hXne, one_mul]
  · rintro ⟨k, hk⟩
    have h1 : algebraMap A F (X 0 : A) * algebraMap A F (C k) = 1 := by
      rw [← hk]; exact mul_inv_cancel₀ hXne
    rw [← map_mul, ← map_one (algebraMap A F)] at h1
    have h2 : (X 0 : A) * C k = 1 := IsFractionRing.injective (MvPolynomial (Fin 2) K) F h1
    exact not_isUnit_X0 ⟨⟨X 0, C k, h2, by rw [mul_comm]; exact h2⟩, rfl⟩

/-- Non-vacuity of part 2: there is a `Z ≤ P_ord` of dimension `2`. -/
theorem exists_two_dim_in_Pord :
    ∃ Z : Submodule K A, Z ≤ Pord ∧ 2 ≤ Module.rank K Z := by
  refine ⟨span K ({1, (X 0 : A) ^ 2} : Set A), ?_, ?_⟩
  · exact span_le.2 (by rintro v (rfl | rfl) <;> exact subset_span (by simp))
  · have hset : ({1, (X 0 : A) ^ 2} : Set A)
        = {monomial (e 0 0) (1 : K), monomial (e 2 0) (1 : K)} := by
      rw [X0sq_eq, one_eq_mono]
    rw [hset, rank_span_pair_monomials (by omega)]

end DiazFreeRing

-- Axiom audit for the main results.
#print axioms DiazFreeRing.core_strong
#print axioms DiazFreeRing.core_ord
#print axioms DiazFreeRing.nogo_strong
#print axioms DiazFreeRing.nogo_ord
#print axioms DiazFreeRing.sharp_strong
#print axioms DiazFreeRing.exists_two_dim_in_Pord
