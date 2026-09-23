"""Rebuild the Prove2Me submission for `Schanuel.gelfond_schneider` from the upstream sources.

Usage: python3 assemble.py <upstream-dir> [output]

<upstream-dir> holds the files of `Mathlib/NumberTheory/Transcendental/GelfondSchneider/` and
`House.lean` from `Mathlib/NumberTheory/NumberField/`, saved as `House_fork.lean`, from
https://github.com/mkaratarakis/mathlib4 at commit cb781672b399c6badb5c70e3f73056bcb31012b0.
Every adaptation to Mathlib 0df444a (Lean v4.33.1) is listed below.
"""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
UP = sys.argv[1]
OUT = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HERE, 'GS_combined.lean')
def strip_module(src):
    out=[]
    for l in src.split('\n'):
        if re.match(r'^\s*module\s*$',l): continue
        if re.match(r'^\s*(public\s+)?import\s',l): continue
        if re.match(r'^\s*@\[expose\]\s*public\s+section\s*$',l) or re.match(r'^\s*public\s+section\s*$',l):
            out.append('section'); continue
        if re.match(r'^\s*set_option backward\.privateInPublic',l): continue   # module-system option, unknown here
        out.append(l)
    return '\n'.join(out)

house=open(os.path.join(UP, 'House_fork.lean')).read().split('\n')
start=next(i for i,l in enumerate(house) if l.startswith('namespace NumberField.house'))
sec='\n'.join(house[start:])
sec=sec.replace('namespace NumberField.house','section GSHouseSection\nvariable {K : Type*} [Field K] [NumberField K]\nopen NumberField\nnamespace GSHouse',1)
sec=re.sub(r'^end NumberField\.house\s*$','end GSHouse\nend GSHouseSection',sec,flags=re.M)
sec=re.sub(r'^private ','',sec,flags=re.M)
sec=re.sub(r'(set_option [^\n]*) in\n(private )','\\1 in\n',sec)
sec=strip_module(sec)
# Adaptations of the fork's house section to Mathlib 0df444a. Each must match exactly once.
HOUSE_PATCHES=[
  ("        integralBasis_repr_apply, eq_intCast, Rat.cast_intCast,",
   "        NumberField.integralBasis_repr_apply, eq_intCast, Rat.cast_intCast,"),
  ("  · apply sum_le_sum; intros r _; convert house_mul_le ..",
   "  · apply sum_le_sum; intros r _; convert! house_mul_le .."),
]
for o,n in HOUSE_PATCHES:
    assert sec.count(o)==1,(o,sec.count(o)); sec=sec.replace(o,n)
# the fork section closes an `@[expose] public section` opened before `namespace NumberField`; we opened none
opened=len(re.findall(r'^(?:noncomputable )?section\b',sec,re.M)); closed=len(re.findall(r'^end\s*$',sec,re.M))
print('house section: sections',opened,'bare ends',closed)

a=strip_module(open(os.path.join(UP, 'AnalyticPart.lean')).read())
CHAIN=['MainAlg','MainAlgSetup','MainOrder','MainAnalytic','MainPostAnalytic','MainAnalyticBounds','MainHol','MainBounds','statement']
def close_scopes(src):
    """Each original file is a module whose sections close at end of file. Concatenated, they would
    nest and leak `variable` declarations into the next file, so close whatever the file left open."""
    stack=[]
    for l in src.split('\n'):
        mm=re.match(r'^(?:noncomputable\s+)?section(?:\s+(\S+))?\s*$',l)
        if mm: stack.append(('section',mm.group(1))); continue
        mm=re.match(r'^namespace\s+(\S+)\s*$',l)
        if mm: stack.append(('namespace',mm.group(1))); continue
        mm=re.match(r'^end(?:\s+(\S+))?\s*$',l)
        if mm and stack: stack.pop()
    tail=[]
    for kind,name in reversed(stack):
        tail.append('end' if (kind=='section' and not name) else 'end '+name)
    return src.rstrip()+'\n\n'+'\n'.join(tail)+'\n'
m='\n\n'.join(close_scopes(strip_module(open(os.path.join(UP, f+'.lean')).read())) for f in CHAIN)
for old in ['analyticOrderAt_deriv_of_pos','analyticOrderAt_deriv_eq_top_iff_of_eq_zero','analyticOrderAt_eq_nat_iff_iteratedDeriv_eq_zero']:
    a=re.sub(r'(?<![\w.])'+old+r'(?![\w\'])','gs_'+old,a)
    m=re.sub(r'(?<![\w.])'+old+r'(?![\w\'])','gs_'+old,m)
m=m.replace('NumberField.house.','GSHouse.')
for old,new in [('house.c₁','GSHouse.c₁'),('house.c₂','GSHouse.c₂'),('house.exists_ne_zero_int_vec_house_le','GSHouse.exists_ne_zero_int_vec_house_le')]:
    m=m.replace(old,new)
# Adaptations of Main.lean to Mathlib 0df444a. Regex rules apply everywhere; exact patches once.
MAIN_REGEX=[
  (r"(?<![\w.])zpow_neg(?![\w'])", "_root_.zpow_neg"),          # Matrix.zpow_neg is now in scope
  (r"rw \[deriv, ", "rw [_root_.deriv, "),                        # Differentiable.deriv is now in scope
  (r"\(zero_le _\)", "(Nat.zero_le _)"),                          # zero_le's argument became implicit
  (r"rw \[Ne, funext_iff\]", "rw [ne_eq, funext_iff]"),
  (r"(?<![\w.])sqrt(?![\w'])", "Real.sqrt"),                   # another `sqrt` is now in scope
  (r"rw \[c_coeffs\]", "unfold c_coeffs"),                       # no equation lemma to rewrite with
  (r"(?<![\w.])mem_sdiff(?![\w'])", "Finset.mem_sdiff"),         # Set/Filter versions now in scope
  (r"^(\s*)simp only at (\w+)\s*$", r"\1try simp only at \2"),     # a no-op simp is now an error
  (r"\(Or\.inl \(by simp\)\)", "(Or.inl (by simp [NumberField.house_nonneg]))"),  # house is a def here
  # simpa no longer closes by unfolding `a`, `b`, `l` at the end; unfold them explicitly
  (r"simpa \[mul_comm\] using (\(?)(Nat\.)?mul_le_mul \(\(\(finProdFinEquiv", r"simpa [mul_comm, a, b, l] using \1\2mul_le_mul (((finProdFinEquiv"),
]
for pat,rep in MAIN_REGEX: m=re.sub(pat,rep,m,flags=re.M)
MAIN_PATCHES=[
  ("       (by simpa [mul_comm, a, b, l] using (Nat.mul_le_mul (((finProdFinEquiv.symm.toFun t).1).isLt)\n         (((finProdFinEquiv.symm.toFun u).1).isLt))), Nat.sub_add_cancel (by simpa [mul_comm] using\n",
   "       (by simpa [mul_comm, a, b, l] using (Nat.mul_le_mul (((finProdFinEquiv.symm.toFun t).1).isLt)\n         (((finProdFinEquiv.symm.toFun u).1).isLt))), Nat.sub_add_cancel (by simpa [mul_comm, a, b, l] using\n"),
  ("    rw [← c₁_pow_sub_one_mul_c₁_pow_mul_c₁_pow_eq]\n",
   "    rw [← c₁_pow_sub_one_mul_c₁_pow_mul_c₁_pow_eq]\n    rfl\n"),
  ("  simpa [of_apply] using hk\n",
   "  simpa [of_apply, Matrix.vecMul, dotProduct, V, mul_comm] using hk\n"),
  # `convert` now also leaves an instance equation here, closed by `rfl`
  ("    convert hmulInt using 1\n    ac_rfl\n",
   "    convert hmulInt using 1\n    all_goals first | rfl | ring | simp only [mul_assoc, mul_comm, mul_left_comm]\n"),
  # this Lean no longer accepts a tactic block starting at column 0
  ("""  ∀ z k', deriv^[k'] (fun z => h7.R q hq0 h2mq z) z = 0 := by
intros z k'
rw [hR]
simp only [Pi.zero_apply]
rw [← iteratedDeriv_eq_iterate, iteratedDeriv]
aesop
""", """  ∀ z k', deriv^[k'] (fun z => h7.R q hq0 h2mq z) z = 0 := by
  intros z k'
  rw [hR]
  simp only [Pi.zero_apply]
  rw [← iteratedDeriv_eq_iterate, iteratedDeriv]
  aesop
"""),
  # `Matrix` is no longer unfolded to a function type here, so evaluate at the chosen entry first
  ("""  simp (config :=  {unfoldPartialApp := true} ) only [A]
  rw [ne_eq, funext_iff]
  simp only [zsmul_eq_mul, RingOfIntegers.restrict]
  intros H
  let u : Fin (h7.m * h7.n q) := ⟨0, h7.m_mul_n_pos q hq0 h2mq⟩
  specialize H u
  rw [funext_iff] at H
  let t : Fin (q * q) := ⟨0, (mul_pos hq0 hq0)⟩
  specialize H t
""", """  simp (config :=  {unfoldPartialApp := true} ) only [A]
  intro H0
  let u : Fin (h7.m * h7.n q) := ⟨0, h7.m_mul_n_pos q hq0 h2mq⟩
  let t : Fin (q * q) := ⟨0, (mul_pos hq0 hq0)⟩
  have H := congrFun (congrFun H0 u) t
  simp only [zsmul_eq_mul, RingOfIntegers.restrict] at H
  simp only [Int.cast_mul, Int.cast_pow, Matrix.zero_apply] at H
"""),
  ("  have H := congrFun (congrFun H0 u) t\n  simp only [zsmul_eq_mul, RingOfIntegers.restrict] at H\n  simp only [Int.cast_mul, Int.cast_pow, Matrix.zero_apply] at H\n  simp only [Int.cast_mul, Int.cast_pow, zero_apply] at H\n",
   "  have H := congrFun (congrFun H0 u) t\n  simp only [zsmul_eq_mul, RingOfIntegers.restrict] at H\n  simp only [Int.cast_mul, Int.cast_pow, Matrix.zero_apply] at H\n"),
  ("      rw [h7.c_coeffspow' q u t, smul_assoc]\n", "      simp only [h7.c_coeffspow' q u t, smul_assoc]\n"),
  ("    (vecMul_of_R_zero h7 q hq0 h2mq H)\n  simp only at HC\n", "    (vecMul_of_R_zero h7 q hq0 h2mq H)\n"),
  ("    have H := @Algebra.norm_algebraMap ℚ _ h7.K _ _ (h7.cρ q hq0 h2mq)\n",
   "    have H := Algebra.norm_algebraMap (S := h7.K) (h7.cρ q hq0 h2mq : ℚ)\n"),
  ("         Eq.symm (Mathlib.Tactic.Ring.mul_add rfl rfl this)\n", "         by ring\n"),
  ("      rw [triple_comm h7.K (h7.c₁^(h7.k q u))\n", "      simp only [triple_comm h7.K (h7.c₁^(h7.k q u))\n"),
  ("      simp only [nsmul_eq_mul, zsmul_eq_mul,\n        Int.cast_pow, Int.cast_mul, smul_eq_mul,mul_assoc]\n",
   "      simp only [nsmul_eq_mul, zsmul_eq_mul,\n        Int.cast_pow, Int.cast_mul, smul_eq_mul,mul_assoc]\n      rfl\n"),
]
for o,n in MAIN_PATCHES:
    c=m.count(o)
    if c!=1: print('PATCH matched',c,'times:',o.strip()[:70])
    m=m.replace(o,n)
hdr=open(os.path.join(HERE, 'header.lean')).read()
# The fork declares `house` as an `abbrev`; here it is a `def`. Making it reducible for this file
# lets `positivity` and `simp` see the norm underneath, as they did in the fork.
REDUCIBLE="""open Lean Meta Qq Mathlib.Meta.Positivity in
/-- `positivity` extension: the house of an algebraic number is non-negative. The fork declares
`house` as an `abbrev`, which `positivity` saw through; here it is a `def`, so this is added. -/
@[positivity NumberField.house _]
meta def evalGSHouse : PositivityExt where eval {u α} _ pα? e :=
  match pα? with | none => pure .none | some _ => do
  match u, α, e with
  | 0, ~q(ℝ), ~q(@NumberField.house $K $f $nf $a) =>
    assertInstancesCommute
    pure (.nonnegative q(NumberField.house_nonneg $a))
  | _, _, _ => throwError "not NumberField.house"
"""
out=hdr+'\n'+REDUCIBLE+'\n'+sec+'\n\n'+a+'\n\n'+m+'\n'
BRIDGE = open(os.path.join(HERE, 'bridge.lean')).read().split('\n',2)[2]
SOLUTION = """
/-- `Schanuel.gelfond_schneider`: for a non-zero logarithm `l` of an algebraic number and an
algebraic irrational `b`, `exp (b * l)` is transcendental. Karatarakis's theorem above is the
`α ^ β` (principal branch) form; the bridge lemma passes to an arbitrary logarithm. -/
theorem solution (b l : ℂ) (hb : IsAlgebraic ℚ b) (hbq : ∀ q : ℚ, b ≠ (q : ℂ))
    (hl : IsAlgebraic ℚ (Complex.exp l)) (hl0 : l ≠ 0) :
    Transcendental ℚ (Complex.exp (b * l)) :=
  gs_log_form_of_cpow_form (fun α β => Setup.transcendental_cpow_of_isAlgebraic_of_irrational α β)
    b l hb hbq hl hl0

#print axioms solution
"""
out = out + '\n' + BRIDGE + '\n' + SOLUTION
open(OUT, 'w').write(out)
print('lines',out.count('\n'))
