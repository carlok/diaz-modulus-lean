# Waldschmidt's parameters exceed the zero count, with the paper's derivative range

- **Node:** `FourExp.construction_count_1973`
- **Status:** Open
- **Theorem id:** `fede9f8c-c982-4629-9b09-f945e6eb22f6`
- **Source:** Asymptotic check of the parameters of M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, formula (4) and Lemma 6, against the zero estimate of M. Waldschmidt, Bull. Soc. Math. France 99 (1971), §4, Lemma 3.

**The parameters of the construction beat the zero count.**

For $X, Y_1, Y_2 \ge 0$ there is $N_0$ such that for every integer $N > N_0$, with
$$S = \lfloor N^2/\sqrt{\log N}\rfloor,\quad T = 2N,\quad R_1 = 14\lfloor N/\sqrt{\log N}\rfloor,\quad R_2 = 14\lfloor N\sqrt{\log N}\rfloor,\quad S' = \lfloor S/2\rfloor,\quad \lambda = \tfrac1{20},$$
and $n = ST^2$, one has
$$\frac{n}{\lambda} + 2\,\frac{1 + n^{\lambda}}{\lambda\log n}\bigl(1 + (R_1Y_1 + R_2Y_2)\,T X\bigr) \;\le\; R_1R_2S' .$$

**Why.** $n/\lambda \approx 80\,N^4/\sqrt{\log N}$ and $R_1R_2S' \approx 98\,N^4/\sqrt{\log N}$. The second term is $O(N^{2.2+\varepsilon})$. The floors cost only lower-order terms. Numerically the ratio of the two sides tends to $80/98$.

**Why this node exists.** It restates `FourExp.construction_count` with the derivative range $S$ of the 1973 paper. It is the counting hypothesis matching `FourExp.construction_core_1973`. The inequality is elementary and its hypotheses are satisfiable.
