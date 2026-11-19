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

### Tools

Since 18 November 2026 the agents that write proofs have had lean-lsp-mcp, an MCP server that connects an
agent to the Lean language server. The version is 0.33.0, pinned, with its `lean_build` tool (a full
`lake build`) disabled. The agents use it to:
- read the goals before and after a line of a proof;
- try several tactics at a `sorry` in one call (`lean_multi_attempt`);
- get the errors and warnings of a file without a separate compile;
- search Mathlib and this library by name, offline, before proving a helper that may already exist;
- list the axioms a theorem depends on (`lean_verify`).

Tool output is not evidence. Every proof is still compiled, its statement compared with the frozen one,
its text searched for `sorry`, and its axioms printed, by a script run outside the agent. The remote search
tools of the server send the query text to outside services, so they are used only for Mathlib-level facts.

**A comparison, 18 November 2026.** The same agent and prompt were run with the lean-lsp tools and, as a
baseline, with only a compile command (`lake env lean`). Three pairs on small leaves used Claude Sonnet;
one pair, on DALAG Prop. 12.13 (ii) ⇒ (iv), then not yet proved, used Claude Opus. All eight runs gave
valid proofs, so the comparison shows no effect on whether a proof is found. With lean-lsp the agents were
faster in three pairs of four (by 17–36%) and slower in one (by 19%, on the Prop. 12.13 node). On the three
small leaves together they took 25% less time and 27% less cost, with API prices as the measure, and wrote
shorter proofs in three pairs of four. With four pairs of short proofs, the direction is consistent but it is
not a statistical result, and long proofs, where goal states matter more, were not tested.

**Release note-v1.47 (28 nodes, 18 November 2026).** Twenty-one nodes already had a complete proof,
written while their statements were reviewed; the agents that ported them used the server to read errors
and axioms only, and every file compiled at the first attempt. These say little about the tools. Seven
nodes were proved afresh from a paper sketch: three implications of DALAG Prop. 12.13, the proposition
itself, Cor. 12.14, Prop. 12.6 and the §12.1.6 node. Four of the seven compiled at the first attempt. In
the other three, `lean_multi_attempt` closed what was left: the one failing step of a 53-line proof (saving
two or three compile rounds, by the agent's account), both `sorry` steps of the 148-line proof of
Prop. 12.6 (one of them with `rfl`), and one `sorry` in Cor. 12.14. The four agents that wrote the seven
proofs took 3 to 8 minutes each. The failures seen:
- the file tools refuse a file outside a Lake project (no `lean-toolchain` above it), so drafts kept in a
  folder outside the project could only be compiled from the command line;
- `lean_multi_attempt` without a column replaces the whole line: on a line holding `sorry)` it dropped the
  `)` and wasted the call, and on a miscounted line number it ran without warning;
- outputs can be large: the goal view in Prop. 12.6 listed about 60 hypotheses, and `lean_multi_attempt`
  repeats the whole context for each tactic tried;
- the symbol index of the name search was still loading in several calls; its text search answered most of
  them but missed a deprecated name, which the errors tool then caught.

The repository does not commit an `.mcp.json`. A contributor who uses Claude Code can register the same
server with:

```bash
claude mcp add lean-lsp -- uvx lean-lsp-mcp==0.33.0 --disable-tools lean_build
```

