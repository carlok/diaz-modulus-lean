# Entry 18, verification: D. Roy and M. Waldschmid

- **Source read:** Roy, Waldschmidt, Ann. Sci. ENS (4) 30 (1997), 753-796: Th. 0.2 p. 755, §7 pp. 790-792. Numdam PDF https://www.numdam.org/item/10.1016/s0012-9593(97)89938-7.pdf, plus local copy, page images checked.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "le nombre Q(log α1, ..., log αn) n'est pas nul" (résumé, p. 753)

**Hypotheses.** Field: Th. 0.2 and the abstract take P, Q in Q[X] with rational subspaces (bar absent at 300 dpi; Conj. 0.3 shows one). The target's a, b, c, γ are rational, so this fits. Dimension: n = 3. Conjugation: not involved. Genericity: the abstract needs Q-independent logarithms in a field of trdeg 1, and t real gives the independence. Without t real the claim fails to follow when c = 0 (t = iπ, a = b = 1).

**Explanation.** Not printed: no dilogarithm, and no relation at²+bπ²=c; Cor. 7.4's example, on exp(√((log 2)²+π²)), is different. Derivation: suppose α=e^{iγ/π} is algebraic, γ≠0 rational. Then t, iπ, λ=iγ/π lie in ℒ, and (iπ)λ=−γ. Hence P=aX²−bY²+(c/γ)YZ, rational and nonzero since a≠0, vanishes at (t,iπ,λ): at²+bπ²−c=0. Q-independence: t is real and nonzero, the others imaginary; q₂π²=−q₃γ forces q₂=q₃=0 as π² is irrational. Trdeg: Q(t,iπ,λ) is algebraic over Q(π) since a≠0, so trdeg 1. The abstract's statement says P(t,iπ,λ)≠0: contradiction. From Th. 0.2 directly: a rational subspace containing a Q-independent point is all of C³, so V=C³, P=0. Dichotomy: t=log 2, a=−1/2, b=1/12, plus Euler's identity (not in this paper). The homogenising step, writing the constant as a product of two logarithms, is mine. So the general form and dichotomy follow in a few lines from a 1997 printed theorem; the statement itself is not printed there.
