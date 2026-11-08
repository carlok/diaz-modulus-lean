# Entry 16, verification: D. Roy, M. Waldschmidt,

- **Source read:** Roy, Waldschmidt, Proc. Japan Acad. Ser. A 71 (1995), 151-153, p. 151. Read from the local library copy, roy-waldschmidt-1995-quadratic-relations.pdf, including the page image. The given Project Euclid link returned only a bot-wall page: https://projecteuclid.org/download/pdf_1/euclid.pja/1195510604
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** is contained in a vector subspace of C^n which is defined over Q

**Hypotheses.** Field: P has coefficients in Q (checked on the page image), and the target's relations are rational, so this matches. Dimension: n=4, with all four numbers in L, which is a Q-space and conjugation-stable. Conjugation: the paper never mentions it (text search finds nothing), so the verifier must add the conjugates as coordinates. Transcendence degree: the source says exactly 1, the target says at most 1; these agree because a nonzero logarithm is transcendental (Hermite-Lindemann). Genericity: the target's exclusion of real or imaginary l0 is what removes the row-proportional case. Theorem 2 is only announced here; its proof is deferred to another paper. Theorem 1, the determinant case, is the one the paper refers to Brownawell Cor. 7 for, as cited.

**Explanation.** Theorems 1 and 2 are on p. 151 as cited, but neither target statement is printed. Derivation: Theorem 2 with P=X1X4-X2X3. (A) With e=±1, the conjugate of l1/l0 is e·l1/l0, so the matrix rows (l0,l1), (e·conj l0, conj l1) have determinant 0. (B) With c=|u|²/|v|² rational, rows (u, c·conj v), (v, conj u) have determinant 0. Entries lie in L, transcendence degree 1. A Q-rational space of rank ≤1 matrices has rows or columns proportional with a fixed rational ratio. (A): rows give conj l0 in Q·l0, so l0 is real or imaginary, excluded; columns give l1 in Q·l0. (B): rows give v in Qu; columns give c·conj v in Qu, so v in Q·conj u. Theorem 1 gives both directly with x=(1,second row's first entry/first row's first entry), y=first row. So only the nearby, named four exponentials input is used; Theorem 2 adds nothing. The citation is no find for the part not found. It does confirm the "routine" class.
