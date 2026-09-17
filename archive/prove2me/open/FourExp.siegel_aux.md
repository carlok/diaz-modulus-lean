# Siegel's lemma for the auxiliary function, and why its coefficients are non-zero

- **Node:** `FourExp.siegel_aux`
- **Status:** Open
- **Theorem id:** `b421c5b8-a7f6-4c18-a1c0-d45a9e8fb2c7`
- **Source:** C. L. Siegel's lemma, as in S. Lang, Introduction to Transcendental Numbers, ch. I §2; used as in M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, Lemma 4.

**Solving the system.** Let $\omega, \omega_1 \in \mathbb{C}$ and $Q \in \mathbb{Z}[X][Y]$ with $d = \deg_Y Q \ge 1$, such that no non-zero $A \in \mathbb{Z}[X][Y]$ with $\deg_Y A < d$ vanishes at $(\omega, \omega_1)$. Let $\kappa_1 > 0$. Then there is $\kappa \ge \kappa_1$ such that for every large $N$, with $S = \lfloor N^2/\sqrt{\log N}\rfloor$, every $0 < M \le \kappa_1 S$ and every $R \times U$ integer matrix $B$ with $U = S\,(2N)^2\,M\,d$, $2R \le U$ and entries at most $e^{\kappa_1N^2\sqrt{\log N}}$, there is an integer vector $q$ with $Bq = 0$ such that:
- every $|q| \le e^{\kappa N^2\sqrt{\log N}}$;
- $c(i,j,k') = \sum_{\mu<M,\nu<d} q(i,j,k',\mu,\nu)\,\omega^\mu\omega_1^\nu$ is non-zero for some $(i,j,k')$;
- every $|c(i,j,k')| \le e^{\kappa N^2\sqrt{\log N}}$.

**Proof plan.** Siegel's lemma over $\mathbb{Z}$ (`Int.exists_ne_zero_int_vec_norm_le`) with $U \ge 2R$ gives $q \ne 0$ with $|q| \le U\max|B|$, and $\log U = O(\log N)$. If $q(i,j,k',\cdot,\cdot) \ne 0$, then $\sum_{\mu,\nu} q\,X^\mu Y^\nu$ is non-zero with $\deg_Y < d$, so by minimality $c(i,j,k') \ne 0$. The bound on $c$ absorbs $\log(Md) + M\log\max(1,|\omega|) + d\log\max(1,|\omega_1|) = O(S)$.

**Role.** The linear-algebra half of `FourExp.auxiliary_function_alg`. The hypotheses are satisfiable.
