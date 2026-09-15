# Zeros of an exponential polynomial: the rescaled Cauchy–interpolation inequality

- **Node:** `FourExp.expPoly_zero_count_scaled`
- **Status:** Open
- **Theorem id:** `0fdacfda-2630-482e-8cf1-f159d6ba6be7`
- **Source:** M. Waldschmidt, Indépendance algébrique des valeurs de la fonction exponentielle, Bull. Soc. Math. France 99 (1971), 285–304, §4, inequality (4.14) and the rescaling that follows it.

**The analytic core of the zero count, before any choice of radius.**

Take $f(z) = \sum_j \sum_{i < q_j} b_{j,i} z^i e^{\omega_j z}$ with distinct $\omega_j$ and not all $b_{j,i}$ zero. Put $n = \sum_j q_j$ and $\Omega = \max_j|\omega_j| > 0$. Let $\sigma$ be the number of zeros of $f$, with multiplicity, at the points of a finite set $S$ inside the disc $|z - z_0| \le \rho$, and put $x = \rho\,\Omega$. Then for every $R > x + 1$,
$$\sigma \,\log\frac{R - x}{x + 1} \;\le\; \log\Bigl(n!\, 2^{n+1} \frac{R}{R-1}\Bigr) + 2R .$$

**Proof idea** (Waldschmidt 1971, §4). Two estimates bound $\max_{s<n} |g^{(s)}(0)|$ against $\max_{|u| = R}|g(u)|$ in opposite directions:
- **From above.** A Cauchy estimate that uses the $\sigma$ zeros in $|z| \le r$ gives $|g^{(s)}(0)| \le s!\, \frac{R}{R-1} \bigl(\frac{r+1}{R-r}\bigr)^{\sigma} \max_{|u|=R}|g|$. This is (4.3).
- **From below.** Solving the confluent Vandermonde system for the coefficients and bounding the interpolation polynomial gives $\max_{s < n}|g^{(s)}(0)| \ge [n(W+1)^{n+1} e^{R(W+1)}]^{-1}\max_{|u|=R}|g|$, where $W$ bounds the frequencies. These are (4.5)–(4.13).

Apply both to $g(z) = f(z_0 + z/\Omega)$, whose frequencies have modulus at most $1$ and whose zeros from $S$ lie in $|z| \le \rho\Omega$.

**What it is for.** Together with `FourExp.zero_count_arith` it gives the zero count `FourExp.expPoly_zero_count` when $n \ge 2$ and $\Omega > 0$.
