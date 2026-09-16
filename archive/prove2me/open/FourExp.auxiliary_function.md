# Siegel's lemma builds the auxiliary function (Waldschmidt 1973, Lemma 4)

- **Node:** `FourExp.auxiliary_function`
- **Status:** Open
- **Theorem id:** `cf30f7a1-b576-4a5d-b179-f5e90c1f29c3`
- **Source:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, Lemma 4; C. L. Siegel's lemma as in S. Lang, Introduction to Transcendental Numbers, ch. I §2.

**The auxiliary function.** Let $x_1, x_2, y_1, y_2 \in \mathbb{C}$ and suppose $\omega$ is transcendental; $\omega_1$ is a root of $Q \in \mathbb{Z}[X][Y]$, monic in $Y$ of degree $d \ge 1$ and minimal, in the sense that no non-zero $A \in \mathbb{Z}[X][Y]$ with $\deg_Y A < d$ vanishes at $(\omega, \omega_1)$; and $D, E_i, G_j, H_{ij} \in \mathbb{Z}[X][Y]$ with $D(\omega,\omega_1) \ne 0$, $x_i D = E_i$, $y_j D = G_j$ and $e^{x_iy_j} D = H_{ij}$ at $(\omega, \omega_1)$. Then there is $\kappa > 0$ such that for every large $N$, with $S, t_1, t_2$ as below, there are $M \le \kappa S$ and integers $q(i,j,k',\mu,\nu)$, for $i<S$, $j,k'<2N$, $\mu<M$, $\nu<d$, with the following properties.
$$S = \lfloor N^2/\sqrt{\log N}\rfloor,\quad T = 2N,\quad t_1 = \lfloor N/\sqrt{\log N}\rfloor,\quad t_2 = \lfloor N\sqrt{\log N}\rfloor,\quad R_1 = 14t_1,\quad R_2 = 14t_2,\quad S' = \lfloor S/2\rfloor.$$
- Every $|q| \le e^{\kappa N^2\sqrt{\log N}}$.
- Put $c(i,j,k') = \sum_{\mu,\nu} q(i,j,k',\mu,\nu)\,\omega^\mu\omega_1^\nu$. Some $c$ is non-zero, and every $|c| \le e^{\kappa N^2\sqrt{\log N}}$.
- The function $F$ below satisfies $F^{(m)}(ay_1+by_2) = 0$ for all $a<t_1$, $b<t_2$, $m<S$:
$$F(z) = \sum_{i<S}\ \sum_{j,k'<2N} c(i,j,k')\, z^i\, e^{(jx_1+k'x_2)z}.$$

**Proof sketch.** Write each equation, multiplied by a power of $D$, in the basis $\omega^h\omega_1^k$ with $k<d$, reducing modulo $Q$. That is a homogeneous integer linear system with roughly $48rd\,N^2S^2$ unknowns and $18rd\,N^2S^2$ equations. Siegel's lemma over $\mathbb{Z}$ (`Int.exists_ne_zero_int_vec_norm_le`) gives $q$. The monomials $\omega^\mu\omega_1^\nu$ are linearly independent, by minimality of $Q$ and transcendence of $\omega$, so some $c \ne 0$.

The paper uses algebraic integers of a number field; here all four exponentials lie in $\mathbb{Q}(\omega,\omega_1)$, so integers suffice. The hypotheses are satisfiable.
