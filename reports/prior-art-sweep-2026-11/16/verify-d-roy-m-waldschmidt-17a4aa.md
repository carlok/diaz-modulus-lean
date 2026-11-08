# Entry 16, verification: D. Roy, M. Waldschmidt,

- **Source read:** D. Roy, M. Waldschmidt, Ann. Sci. ENS (4) 30 (1997), 753-796, full PDF from https://www.numdam.org/item/ASENS_1997_4_30_6_753_0.pdf; p. 755 viewed as image, pp. 790-792 as text layer.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "contenu dans un sous-espace vectoriel de C^n défini sur Q et contenu dans V"

**Hypotheses.** Field: P rational and the subspace rational, checked on the page image of p. 755 (only Conj. 0.3 has Q-bar). Dimension: n=4 for the point (l0,l1,conj l0,conj l1) or (u,v-bar,v,u-bar). Conjugation: Th. 0.2 has none; conjugates are supplied by hand, and they lie in L since conj(exp l)=exp(conj l) is algebraic. Trdeg: alternative is trdeg >= 2, on exactly the field Q(lambda_i), which matches the target's field and <=1. Genericity: none required. The non-real/non-imaginary hypothesis of (Qr2) is used only to exclude one ruling. Location: statement on p. 755; §7 starts p. 790, the proof is on p. 791. Neither target statement is printed; Cors. 7.3-7.4 are nearby but different.

**Explanation.** Th. 0.2 implies both statements; neither is printed. Derivation. Take a 2x2 matrix M of L-entries with rational-linear entries, det M=0, trdeg<=1. Th. 0.2 gives a rational S containing M on which det vanishes. S has dim<=2 and a rational basis of rank-1 matrices, sharing a kernel or left kernel, so a rational nonzero vector kills M on the right or left.

(Qr2): eps=+1 if ratio real, -1 if imaginary. M=[[l0,l1],[eps conj l0,conj l1]], det=0. Right: a l0+b l1=0, so l1/l0 in Q. Left: a l0+b eps conj l0=0, so conj(l0)/l0 is rational of modulus 1, hence ±1: l0 real or imaginary, excluded.

Pair: c=|u|^2/|v|^2. M=[[u,cv],[conj v,conj u]], det=0. Right: au+bcv=0, v in Qu. Left: au+b conj v=0, conj v in Qu, so v in Q conj u.

Nonvanishing of the entries forces a,b both nonzero. The source is independent of this work (1997). Not checked here: Brownawell Cor. 7, the target's own route.
