[← README](../README.md)

## Method

Almost all of this library was written by AI agents, working on the Prove2Me platform under Carlo
Perassi's direction: Anthropic's Claude, run through Claude Code. The agents wrote the Lean statements and
proofs, the texts of the platform pages, most of the companion note, the literature checks and two
adversarial audits. Carlo chose the problem and the direction, set the rules the agents work under, and
approved every publication. Carlo read the statements and the companion note, not the Lean proofs line by line.

Lean checks that every proof proves its statement, with only the three standard axioms. It does not check
that a statement says what the cited source says. Agents compared each statement and attribution with the
primary sources, often from page images, and several claims of novelty died that way. What survives is
what survived that. A reading of the published work of Diaz, Roy, Waldschmidt and Dasgupta–Kakde on
24 September 2026 moved several more results from "possibly known" to known. Since version 1.6, the note and
the node texts on the platform attribute each one.

Code written by others is credited where it is used:
- Lindemann–Weierstrass, from Mathlib PR #28013;
- Gelfond–Schneider, from M. Karatarakis and F. Wiedijk;
- eight results contributed to the Diaz mission by the Prove2Me contributor Nickrobbins95 (3–4 October 2026),
  mirrored here with their proofs: `s0_conj_mem`, `s0_add_mem`, `s0_rat_scale_mem` and
  `s0_bridge_halves_imp_parent` on the set S₀ of the statement (S); `real_axis_exp_unit_circle`,
  `real_axis_root_of_unity_implies_pi_sq_rat` and `imag_axis_div_normalisation` on the axes; and
  `normSq_of_modulus_conjecture`;
- `construction_count`, a counting inequality for the auxiliary construction of the four exponentials
  proof, proved by the Prove2Me contributor cm_beta (23 September 2026);
- `pair_dichotomy_exclusive` and `conj_combination_off_rays`, proved by the Prove2Me contributor amorphic
  (8 September 2026);
- `diaz_of_exp_eq_one`, proved by the Prove2Me contributor curiyu (8 September 2026).

`e_pi_transcendence` answers a node that another Prove2Me contributor posed; its proof is this project's.

