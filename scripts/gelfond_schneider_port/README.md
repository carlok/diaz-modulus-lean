# Gelfond–Schneider: rebuilding the Prove2Me submission

The proof of `Schanuel.gelfond_schneider` accepted on Prove2Me, and mirrored here as
`Diaz/Mirror/gelfond_schneider.lean`, is the formalization of M. Karatarakis and F. Wiedijk:

> M. Karatarakis and F. Wiedijk, *A formalization of the Gelfond-Schneider theorem*,
> arXiv:2603.24823 (2026). Code: https://github.com/mkaratarakis/mathlib4, commit
> `cb781672b399c6badb5c70e3f73056bcb31012b0`, Apache 2.0.

Their code was not written for this library. The two scripts here rebuild the submission from
their sources, so every change made to it can be read and re-checked.

```bash
./fetch_upstream.sh upstream          # sparse clone of the fork at the pinned commit
python3 assemble.py upstream out.lean # out.lean is byte-identical to the archived submission
cmp out.lean ../../archive/prove2me/Schanuel.gelfond_schneider__129e4463.lean
```

## What `assemble.py` changes

The fork runs Lean v4.29.0-rc2; the platform runs Lean v4.33.1 with Mathlib `0df444a`.

- **Which files.** The chain `MainAlg`, `MainAlgSetup`, `MainOrder`, `MainAnalytic`,
  `AnalyticPart`, `MainPostAnalytic`, `MainAnalyticBounds`, `MainHol`, `MainBounds`, `statement`.
  `Main.lean` is not used. It contains `#exit` at line 2569, so a build of that file reports no
  errors, but its final theorem is never checked.
- **Siegel's lemma for houses.** In this Mathlib the constants `c₁`, `c₂` of
  `NumberField/House.lean` are private, and the fork's `c₂` is `max 1 (supOfBasis K)` rather than
  `supOfBasis K`; the proof needs `1 ≤ c₁`. The fork's section is therefore included under the
  namespace `GSHouse`.
- **`house`.** It is an `abbrev` in the fork and a `def` here, so `positivity` no longer sees
  through it. A small `positivity` extension is added.
- **Name clashes.** Three `analyticOrderAt_*` lemmas of `AnalyticPart.lean` have since been
  upstreamed with different signatures, so they carry a `gs_` prefix.
- **Drift.** About twenty small edits, each listed in `MAIN_REGEX` and `MAIN_PATCHES`: names that
  became ambiguous (`zpow_neg`, `sqrt`, `mem_sdiff`, `deriv`), `zero_le` taking its argument
  implicitly, a tactic block at column 0, and `simp` and `ac_rfl` steps that no longer close. The
  patch list is the full record. Some entries match nothing on this revision; the script prints
  those counts instead of failing on them.
- **Bridge.** `bridge.lean` passes from their `α ^ β` statement (principal branch) to the
  platform's logarithmic form, for any non-zero logarithm `l` of an algebraic number.

`#print axioms` on the result gives `[propext, Classical.choice, Quot.sound]`.

The submission's header comment repeats one clause eight times, an artifact of an earlier version
of this script. `header.lean` keeps it, so that the rebuild matches what was accepted. The mirror
module has it once.

## From the submission to the mirror (Mathlib v4.34.0)

The porter makes three changes, and `Diaz/Mirror/gelfond_schneider.lean` records them in its header:

- The whole development goes in the namespace `GelfondSchneider` instead of `Diaz`. The library has
  a `Diaz.Complex` namespace, which would capture every `open Complex`.
- `Complex.analyticOrderAt_iterated_deriv` is renamed `gs_analyticOrderAt_iterated_deriv` for the
  same reason.
- One `simp` set: in v4.34 `Basis.repr_reindex` produces `Finsupp.equivMapDomain`, so
  `Finsupp.equivMapDomain_apply` replaces `Finsupp.mapDomain_equiv_apply`.

The main theorem is `GelfondSchneider.gelfond_schneider`.
