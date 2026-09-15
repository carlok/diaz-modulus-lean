# At most n − 1 zeros already beats the zero count bound

- **Node:** `FourExp.zero_count_arith_poly`
- **Status:** Open
- **Theorem id:** `46d2beb4-7606-4504-994b-05af059e4f49`
- **Source:** Elementary real analysis.

**A real-variable inequality for the degenerate cases.**

For every integer $n \ge 1$, real $x \ge 0$ and $\lambda > 0$, and every integer $0 \le \sigma \le n - 1$,
$$\sigma < \frac{n}{\lambda} + 2\,\frac{1 + n^{\lambda}}{\lambda \log n}\,(1 + x).$$
For $n = 1$ the second term is read as $0$, following Lean's convention $a/0 = 0$.

**Why it holds.**
- For $n = 1$: $\sigma = 0 < 1/\lambda$.
- For $n \ge 2$ and $\lambda \le 1$: $n/\lambda \ge n > \sigma$.
- For $n \ge 2$ and $\lambda > 1$: write $u = \lambda\log n > \log n$. The right-hand side is at least $\varphi(u) = (n\log n + 2e^{u})/u$, and $\varphi(\log n) = n + 2n/\log n > n$. For $n \ge 8$ one has $2e^{u}(u-1) \ge n\log n$ at $u = \log n$, so $\varphi$ is increasing on $[\log n, \infty)$ and stays above $n$. For $2 \le n \le 7$, the minimum of $\varphi$ over $u > 0$ exceeds $n - 1$; this was checked numerically and has to be verified case by case in a proof.

**What it is for.** Together with `FourExp.zero_count_degenerate` it covers the degenerate cases of `FourExp.expPoly_zero_count`.
