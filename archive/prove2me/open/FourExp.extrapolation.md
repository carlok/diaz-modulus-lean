# Extrapolation from the vanishing grid (Waldschmidt 1973, Lemma 5)

- **Node:** `FourExp.extrapolation`
- **Status:** Open
- **Theorem id:** `478273e3-7383-4cf2-98e8-dd6ab2db30f3`
- **Source:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, Lemma 5.

**Small derivatives on a larger grid.** Let $x_1, x_2 \in \mathbb{C}$ and let $y_1, y_2$ be $\mathbb{Q}$-linearly independent. For every $\kappa > 0$ there are $\kappa' > 0$ and $N_0$ such that for every $N > N_0$ the following holds, with
$$S = \lfloor N^2/\sqrt{\log N}\rfloor,\quad T = 2N,\quad t_1 = \lfloor N/\sqrt{\log N}\rfloor,\quad t_2 = \lfloor N\sqrt{\log N}\rfloor,\quad R_1 = 14t_1,\quad R_2 = 14t_2,\quad S' = \lfloor S/2\rfloor.$$
Suppose the coefficients satisfy $|c(i,j,k')| \le e^{\kappa N^2\sqrt{\log N}}$ and $F^{(m)}(ay_1+by_2) = 0$ for $a<t_1$, $b<t_2$, $m<S$, where
$$F(z) = \sum_{i<S}\ \sum_{j,k'<2N} c(i,j,k')\, z^i\, e^{(jx_1+k'x_2)z}.$$
Then $|F^{(s)}(ay_1+by_2)| \le \exp(-N^4\sqrt{\log N}/\kappa')$ for all $s<S'$, $a<R_1$, $b<R_2$.

**Proof sketch.** For $s < S/2$, $F^{(s)}$ vanishes to order at least $S/2$ at the $t_1t_2 \approx N^2$ points of the small grid. Apply `FourExp.cauchy_estimate_with_zeros` (Proved) on a disc of radius $NS$ around the target point, bounding $F^{(s)}$ there by Cauchy's estimate. The zeros gain $\approx t_1t_2\,(S/2)\log N^2 \approx N^4\sqrt{\log N}$. The cost is $S\log S + O(N\cdot NS) = O(N^4/\sqrt{\log N})$.

A purely analytic lemma; $x_1, x_2$ are arbitrary.
