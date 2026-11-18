[← README](../README.md)

## Backup of the Prove2Me nodes

Prove2Me holds the proofs; this repository is where they are kept. Anything
proved there and worth keeping is mirrored here, because a platform is not a
place to store the only copy of a result.

`Multipliers.lean`, `SFE.lean`, `Quantisation.lean`, `Line.lean`,
`Pencil.lean`, `Kernel.lean`, `CheapLine.lean` and `Distance.lean` are that mirror. They are stated in the platform's vocabulary
— `LogAlg`, `LogAlgTilde`, `IsCandidate`, mirroring its `DiazModulus`
preamble — rather than in this repository's abstract-subfield style, so that
the declarations read the same in both places.

| Here | On the platform |
| --- | --- |
| `diaz_of_sfe`, `diaz_of_sfe_hl` | `DiazModulus.diaz_of_sfe` |
| `candidate_multiplier_module` | `DiazModulus.candidate_multiplier_module` |
| `candidate_one_log_saturation` | `DiazModulus.candidate_one_log_saturation` |
| `no_algebraic_line` | `DiazModulus.no_algebraic_generalized_line` |
| `candidate_no_real_algebraic_line` | `DiazModulus.candidate_no_real_algebraic_line` |
| `candidate_distance_transcendental` | `DiazModulus.candidate_distance_transcendental` |
| `real_quantisation` | `Diaz.real_quantisation` |
| `quantisation_orbit_iff_re_ne_zero` | `Diaz.quantisation_orbit_iff_re_ne_zero` |
| `leaf_iff_one` | `DiazModulus.leaf_iff_one` |
| `exp_ratMul_isAlgebraic`, `exp_ratio_pow_eq_one_iff` | same names |
| `det_pencil_eq_conic`, `roy_conic_implies_empty` | same names |
| `candidate_re_transcendental`, `candidate_im_transcendental`, `candidate_vanishing_ideal` | `DiazModulus.candidate_re_transcendental`, `DiazModulus.candidate_im_transcendental`, `DiazModulus.candidate_vanishing_ideal` |
| `sixExponentials_cannot_refute_candidate` | same name |
| `fibre_at_most_two` | `Diaz.fibre_at_most_two` |
| `hermite_lindemann_holds` | `DiazModulus.hermite_lindemann_holds` |
| `q_translate_unique`, `order_quantisation`, `torsion_dichotomy`, `period_plane_norm`, `indep_of_algebraic_product`, `no_holo_stab` | same names |

Every one of them is `sorry`-free and depends on no axiom of this repository:
`#print axioms` lists only `propext`, `Classical.choice`, `Quot.sound`.

That now includes `diaz_of_sfe`. Hermite–Lindemann is no longer assumed for
it: `HermiteLindemann.lean` proves `hermite_lindemann_holds`, and
`diaz_of_sfe` discharges its hypothesis from that theorem rather than from
`Axioms.lean`, where it is now proved as well.

The transcendence inputs stay explicit hypotheses of each statement rather
than joining `Axioms.lean`: on the platform they are carried the same way,
and the point of a mirror is that it reads identically.

`DiazModulus.diaz_of_schanuel`, the last to arrive, is mirrored too. An earlier
note here blamed a missing `Algebra ↥R ↥F` instance on the older Mathlib; that was
wrong. A hand port had dropped `open IntermediateField.algebraAdjoinAdjoin`, and the
mechanical port only needed the submission's open `noncomputable section` closed
before the namespace ends.

`HermiteLindemann.lean` and `Fibre.lean` share the Lindemann–Weierstrass
development ported from an unmerged Mathlib pull request. It is kept once, in
the former, and imported by the latter.

### The first two, in detail

`Multipliers.lean` was not part of the first versions of the note (its appendix now cites it). It is a local copy of two
results published on [Prove2Me](https://prove2.me) in September 2026, kept
here so that they survive independently of that platform. They are stated
in the platform's own vocabulary — `LogAlg`, `LogAlgTilde`, `IsCandidate`,
mirroring its `DiazModulus` preamble — rather than in this repository's
abstract-subfield style, so that the declarations read the same in both
places.

- `candidate_multiplier_module` — under Roy's strong six exponentials
  theorem and Hermite–Lindemann, the set of `z ∈ ℒ̃` with `u z ∈ ℒ̃` is
  exactly `Q̄ + Q̄/u`. Consequently `u² ∉ ℒ̃`, and `1/(u − a) ∉ ℒ̃` for every
  non-zero algebraic `a`, even though `1/u` itself is necessarily in `ℒ̃`.
  These are cases of Diaz (J. Théor. Nombres Bordeaux 19, 2007, Théorème 4(1)
  and Corollaire 5) and of Waldschmidt's *Variations on the six exponentials
  theorem* (2005), Corollary 2.2. Node `69387a9d-5e97-4b55-b6e6-64fa30ba558f`.
- `candidate_one_log_saturation` — a candidate lying in `Q̄ + Q̄ℓ` for a
  single `ℓ ∈ ℒ` lies in `Qℓ`; at `ℓ = iπ` this rules out candidates of the
  form `a + bπ`. Node `cf5024d1-43b6-47ac-b3dd-5298beba22a4`.

These two complement `Nodes.lean` and the dimension count behind it. That
count bounds what the three-dimensional hull `span_Q̄{1, u, ū}` of a
candidate can contain, and so says a six-exponentials template cannot be
assembled inside it. The multiplier module says what an extension of the
hull would have to be, and that no algebraic operation on `u` supplies one.

The transcendence inputs stay explicit hypotheses of each statement rather
than joining `Axioms.lean`: on the platform they are carried the same way,
and the point of a backup is that it reads identically. Neither theorem
depends on any axiom of this repository — `#print axioms` on both lists
only `propext`, `Classical.choice`, `Quot.sound`.

