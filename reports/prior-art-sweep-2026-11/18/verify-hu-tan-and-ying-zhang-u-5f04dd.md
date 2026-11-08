# Entry 18, verification: Hu Tan and Ying Zhang, U

- **Source read:** H. Tan, Y. Zhang, Uniform cubic bounds for irrational values of the dilogarithm, arXiv:2611.01066v1, full PDF: https://arxiv.org/pdf/2611.01066v1 (Sec. 1, Thm 1.3, Table 1, Sec. 5, Acknowledgments, refs). Also opened [10] https://github.com/dtq1997/li2-half-irrationality (README, Li2Half.lean, Challenge.lean, NOTICE) and README and NOTICE of [11] https://github.com/siqiliu-tsinghua/Li2Rational.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** Qian Tang adapted this approach to the dilogarithm, including the value Li2(1/2) [10]

**Hypotheses.** Field and setting match: real series Li2(x) = sum x^m/m^2 at x = 1/2, irrationality over Q. Dimension, conjugation and genericity do not arise. Differences: the source says nothing about e^{i gamma/pi}, about t != 0 with e^t algebraic, or about a t^2 + b pi^2 = c. Only the identity's left-hand side appears; Euler's closed form is not used in the passage. Status: unrefereed preprint plus Lean source, with stated heavy AI authorship. The paper reports the p = 1 row as checked in Lean without its external parameters. I did not build the Lean. Independence: Tang's repository dates from Sept 2026 and derives from Fauzan's zeta(5) method. The paper, README, NOTICE, Li2Half.lean and Challenge.lean do not mention Diaz or carlok (grep covered the last three files only; the paper and README I read).

**Explanation.** Citation holds, and Theorem 1.3 prints more: Table 1, row p=1, Q+=1, gives Li2(1/q) irrational for all q>=1 (Sec. 5 credits [11] plus classical values). Tang's Lean theorem states the same at 1/2, with standard axioms only.

Derivation of the dichotomy: Theorem 1.3 at p=1, q=2 gives Li2(1/2) irrational. Euler gives Li2(1/2) = pi^2/12 - (log 2)^2/2. So the left disjunct holds, and the dichotomy follows by weakening. The dichotomy itself is not printed, and its transcendence branch gets no support.

Not covered: the general form (t, a, b, c) and any transcendence of e^{i gamma/pi}. Irrationality only rules out one line of relations, t = log 2 with b/a = -1/6, making the proposition vacuous there. Other ratios and other t remain Brownawell-with-scaling. Hence covers_part_not_found = false: half only.

Action for the entry: the source line's claim that irrationality is still open, known only for q>=6, is out of date as of Sept-Oct 2026, subject to the preprint/Lean status. The dichotomy now has a true left branch unconditionally.
