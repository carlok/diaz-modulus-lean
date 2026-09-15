-- Open on Prove2Me: statement only, not a proof. Node `FourExp.construction_growth`, theorem id 756ef0b1-6367-48de-9b97-b031f9277369.
-- Mirrored by scripts/refresh_prove2me_archive.py; do not edit by hand.

import Mathlib

open Filter Topology

namespace FourExp

theorem construction_growth (k : ℝ) (hk : 0 < k) :
    StrictMono (fun x : ℝ => k * (if x ≤ 3 then x - 3 + 9 * Real.sqrt (Real.log 3) else x ^ 2 * Real.sqrt (Real.log x))) ∧
    StrictMono (fun x : ℝ => k * (if x ≤ 3 then x - 3 + 9 / Real.sqrt (Real.log 3) else x ^ 2 / Real.sqrt (Real.log x))) ∧
    Tendsto (fun x : ℝ => k * (if x ≤ 3 then x - 3 + 9 * Real.sqrt (Real.log 3) else x ^ 2 * Real.sqrt (Real.log x))) atTop atTop ∧
    Tendsto (fun x : ℝ => k * (if x ≤ 3 then x - 3 + 9 / Real.sqrt (Real.log 3) else x ^ 2 / Real.sqrt (Real.log x))) atTop atTop ∧
    (∀ x : ℝ, 0 < x → k * (if x ≤ 3 then x - 3 + 9 / Real.sqrt (Real.log 3) else x ^ 2 / Real.sqrt (Real.log x)) ≤ k * (if x ≤ 3 then x - 3 + 9 * Real.sqrt (Real.log 3) else x ^ 2 * Real.sqrt (Real.log x))) ∧
    (∀ x : ℝ, 0 < x → k * (if (x + 1) ≤ 3 then (x + 1) - 3 + 9 * Real.sqrt (Real.log 3) else (x + 1) ^ 2 * Real.sqrt (Real.log (x + 1))) ≤ 3 * (k * (if x ≤ 3 then x - 3 + 9 * Real.sqrt (Real.log 3) else x ^ 2 * Real.sqrt (Real.log x)))) ∧
    (∀ x : ℝ, 0 < x → k * (if (x + 1) ≤ 3 then (x + 1) - 3 + 9 / Real.sqrt (Real.log 3) else (x + 1) ^ 2 / Real.sqrt (Real.log (x + 1))) ≤ 3 * (k * (if x ≤ 3 then x - 3 + 9 / Real.sqrt (Real.log 3) else x ^ 2 / Real.sqrt (Real.log x)))) := by
  sorry

end FourExp
