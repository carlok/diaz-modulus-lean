# A sufficient integer linear system for the auxiliary function (Waldschmidt 1973, Lemma 4)

- **Node:** `FourExp.aux_linear_system`
- **Status:** Open
- **Theorem id:** `278448f6-4953-4e99-acc6-da2040046df5`
- **Source:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, Lemma 4 (the equation count).

**The vanishing conditions as an integer linear system.** Let $x_1, x_2, y_1, y_2 \in \mathbb{C}$, suppose every $e^{x_iy_j}$ is algebraic, and suppose $\omega$ is transcendental; $\omega_1$ is a root of $Q \in \mathbb{Z}[X][Y]$, monic in $Y$ of degree $d \ge 1$ and minimal (no non-zero $A$ with $\deg_Y A < d$ vanishes at $(\omega,\omega_1)$); and $x_i$, $y_j$, $e^{x_iy_j}$ are quotients by a common $D$ of elements of $\mathbb{Z}[X][Y]$ evaluated at $(\omega,\omega_1)$. Then there is $\kappa_1 > 0$ such that for every large $N$, with
$$S = \lfloor N^2/\sqrt{\log N}\rfloor,\quad t_1 = \lfloor N/\sqrt{\log N}\rfloor,\quad t_2 = \lfloor N\sqrt{\log N}\rfloor,$$
there are an integer $M$ with $0 < M \le \kappa_1 S$ and an $R \times U$ integer matrix $B$, where $U = S\,(2N)^2\,M\,d$ and $2R \le U$, with entries at most $e^{\kappa_1 N^2\sqrt{\log N}}$ in absolute value, such that: for every integer vector $q = (q(i,j,k',\mu,\nu))$ with $Bq = 0$, the function
$$F(z) = \sum_{i<S}\sum_{j,k'<2N} c(i,j,k')\,z^i e^{(jx_1+k'x_2)z},\qquad c(i,j,k') = \sum_{\mu<M,\,\nu<d} q(i,j,k',\mu,\nu)\,\omega^\mu\omega_1^\nu,$$
satisfies $F^{(m)}(ay_1+by_2) = 0$ for all $a < t_1$, $b < t_2$, $m < S$.

**Proof plan.** Multiply each value $F^{(m)}(ay_1+by_2)$ by a common non-zero denominator and expand it as an integer combination of $\omega^h\omega_1^k$ ($k < d$), reducing powers of $\omega_1$ modulo $Q$. The powers of the algebraic numbers $e^{x_iy_j}$ reduce through their own minimal polynomials, so they add height but not degree in $\omega$. Each condition then contributes about $(M + cS)\,d$ integer linear forms in $q$, with $t_1t_2 \le N^2$ conditions, so $M \ge (c+1)S$ gives $2R \le U$. Coefficient sizes come from $S\log S \approx 2N^2\sqrt{\log N}$ and exponents up to $2N^2\sqrt{\log N}$.

**Role.** The arithmetic half of `FourExp.auxiliary_function_alg`. Only sufficiency is claimed: the forms need not be independent. The hypotheses are satisfiable.
