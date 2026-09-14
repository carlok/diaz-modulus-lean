# Waldschmidt's auxiliary function for four exponentials in transcendence degree one

- **Node:** `FourExp.auxiliary_construction`
- **Status:** Open
- **Theorem id:** `98a064ef-3a62-440c-94b0-56817780aca6`
- **Source:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, §III: formula (4) and Lemmas 4, 5, 7.

**The constructive part of Waldschmidt's 1973 proof: auxiliary function, extrapolation, norms.**

Assume the hypotheses of `FourExp.small_polynomials_of_counterexample`: a rank-one $2 \times 2$ matrix $(l_{ij})$ of non-zero logarithms of algebraic numbers, whose entries span a ring of transcendence degree at most one, with neither rows nor columns $\mathbb{Q}$-dependent. The node then provides:
- a transcendental $\omega$, with growth data $\sigma_1, \sigma_2, a_1, a_2$ satisfying the hypotheses of `FourExp.transcendence_criterion`;
- $\mathbb{Q}$-independent pairs $x_1, x_2$ and $y_1, y_2$;
- for every $C$ and every large $N$: integers $S, T, R_1, R_2, S'$, not-all-zero coefficients $c(i,j,k)$ defining $G(z) = \sum c(i,j,k)\, z^i e^{(jx_1 + kx_2)z}$, and a $\lambda > 0$, such that
  - the zero-count inequality of `FourExp.nonvanishing_derivative` holds;
  - **any** non-zero value $G^{(s)}(a y_1 + b y_2)$ with $a < R_1$, $b < R_2$, $s < S'$ yields a non-zero $P \in \mathbb{Z}[X]$ with coefficients at most $e^{\sigma_1(N)}$, degree at most $\sigma_2(N)$, and $|P(\omega)| < e^{-C\sigma_1(N)\sigma_2(N)}$.

**Intended proof** (Waldschmidt 1973, §III). The pairs come from writing $l_{ij} = x_i y_j$. The field is written as $L(\omega, \omega_1)$ with $\omega$ transcendental and $\omega_1$ integral over $\mathbb{Z}[\omega]$. Take $t_0 = N$, $s_0 = [t_0^2(\log t_0)^{1/2}]$, $t_1 = [t_0(\log t_0)^{-1/2}]$, $t_2 = [t_0(\log t_0)^{1/2}]$, and $S = s_0$, $T = 2t_0$, $R_1 = 14t_1$, $R_2 = 14t_2$, $S' = [s_0/2]$, $\lambda = 1/20$.
- **Lemma 4.** Siegel's lemma gives $G$ vanishing to order $s_0$ on $\{a y_1 + b y_2 : a < t_1,\ b < t_2\}$.
- **Lemma 5.** The maximum principle gives $|G^{(s)}(t)| < \exp(-\tfrac12 t_0^4 (\log t_0)^{1/2})$ for $|t| \le t_0 \log t_0$.
- **Lemma 7.** The norm from $K$ to $\mathbb{Q}(\omega)$ turns a non-zero value into $P$, with $\deg P \ll t_0^2(\log t_0)^{-1/2}$, $\log H(P) \ll t_0^2(\log t_0)^{1/2}$ and $|P(\omega)| \le \exp(-\tfrac14 t_0^4(\log t_0)^{1/2})$. This beats every $C$.

The zero-count inequality compares about $80\, t_0^4 (\log t_0)^{1/2}$ with $98\, t_0^4 (\log t_0)^{1/2}$.

**Honesty about its shape.** As with its parent, the hypotheses are never satisfied (by the four exponentials theorem in transcendence degree one). The node records the constructive half, and is meant to be proved by the construction above.
