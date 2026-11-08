# Entry 17, verification: M. Waldschmidt, Diophant

- **Source read:** Waldschmidt, DALAG, Grundlehren 326, Springer 2000, pp. 438, 593 (page images checked). Author's copy: https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf; local copy has the same byte size. DOI page was blocked. Also read Roy-Waldschmidt 1997 Th. 0.2 (local).
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "for any nonzero homogeneous polynomial Q ∈ Q[X1,…,Xn] of degree 2" (DALAG p. 593)

**Hypotheses.** Field: Q-coefficients, Q-independent elements of L, trdeg 1, which the target's data satisfies. Dimension: n=3. No conjugation or genericity hypothesis in the source; realness is used only for Q-independence. Location correction: both the theorem and the following paragraph are on p. 593, not 593-594. Prop. 12.25 is on p. 438, as cited.

**Explanation.** Target not printed; all three follow in a few lines. Y=iπ∈L, a=t0²+π²>0, b=t1²+π²; t_j²=a,b+Y², so t_j is algebraic over Q(Y): trdeg 1. t0,t1≠0 since π²∉Q.
Uniqueness: if t0,t1 are Q-independent, so are t0,t1,Y (real vs imaginary), yet bX0²−aX1²+(a−b)Y² vanishes: contradiction. If t1=rt0 with r²≠1, then t0², hence π², is rational: contradiction. So t1=±t0.
Pair: log2≠±log3.
Third: if Z=iγ/π∈L, γ≠0, then ZY=−γ, Z∈Q(Y). t,Y,Z are Q-independent (π²∉Q), yet γ(t²−Y²)+aZY=0: contradiction.
Inputs beyond the paragraph: π transcendental, log2/log3 irrational. Same content: Roy-Waldschmidt 1997 Th. 0.2. Pre-existing, independent of this work, though the target's Bro74 route differs.
