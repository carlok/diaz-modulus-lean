# Zeros of an exponential polynomial in the degenerate cases

- **Node:** `FourExp.zero_count_degenerate`
- **Status:** Open
- **Theorem id:** `e7bb8de6-eb16-421c-a71b-a457db838e41`
- **Source:** Elementary. The degenerate cases of M. Waldschmidt, Indépendance algébrique des valeurs de la fonction exponentielle, Bull. Soc. Math. France 99 (1971), 285–304, §4, Lemma 3.

**Degenerate cases of the zero count.**

With $f$, $n$ and $\Omega$ as in `FourExp.expPoly_zero_count`, suppose $n \le 1$ or $\Omega = 0$. Then for every finite set $S$,
$$\sum_{z \in S} \operatorname{ord}_z f \;\le\; n - 1 .$$

**Proof idea.**
- If $n = 1$, then $f = b\,e^{\omega z}$ with $b \ne 0$, which has no zeros. The indices with $q_j = 0$ contribute nothing.
- If $\Omega = 0$, every $\omega_j$ is $0$. Since they are distinct there is a single index, so $f$ is a non-zero polynomial of degree less than $n$, with at most $n - 1$ zeros counted with multiplicity.

**What it is for.** With `FourExp.zero_count_arith_poly` it covers the cases of `FourExp.expPoly_zero_count` that the rescaling argument cannot handle.
