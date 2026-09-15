# The growth functions of Waldschmidt's construction satisfy the criterion's hypotheses

- **Node:** `FourExp.construction_growth`
- **Status:** Open
- **Theorem id:** `756ef0b1-6367-48de-9b97-b031f9277369`
- **Source:** Elementary real analysis; the functions correspond to σ₁(t₀) = k₆t₀²(log t₀)^{1/2}, σ₂(t₀) = k₇t₀²(log t₀)^{-1/2} in M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, end of §III.

**Explicit growth functions.**

For $k > 0$ put
$$\sigma_1(x) = k\cdot\begin{cases} x - 3 + 9\sqrt{\log 3}, & x \le 3,\\ x^2\sqrt{\log x}, & x > 3,\end{cases} \qquad \sigma_2(x) = k\cdot\begin{cases} x - 3 + 9/\sqrt{\log 3}, & x \le 3,\\ x^2/\sqrt{\log x}, & x > 3.\end{cases}$$
Then:
- $\sigma_1$ and $\sigma_2$ are strictly increasing and tend to $+\infty$;
- $\sigma_2(x) \le \sigma_1(x)$ for all $x > 0$;
- $\sigma_i(x+1) \le 3\,\sigma_i(x)$ for all $x > 0$.

These are the hypotheses of `FourExp.transcendence_criterion` with $a_1 = a_2 = 3$.

**Proof idea.**
- Both pieces are increasing. $\frac{d}{dx}\bigl(x^2/\sqrt{\log x}\bigr) = \frac{x}{\sqrt{\log x}}\bigl(2 - \tfrac{1}{2\log x}\bigr) > 0$ for $x > 3$. The pieces meet at $x = 3$ with the value of the right piece at $3$.
- $\sigma_2 \le \sigma_1$ because $\log x \ge 1$ for $x > 3$, and $9/\sqrt{\log 3} \le 9\sqrt{\log 3}$.
- The ratio $\sigma_i(x+1)/\sigma_i(x)$ is at most about $2.0$ for $\sigma_1$ and $1.6$ for $\sigma_2$ on $x > 0$, checked on each piece.

**What it is for.** It supplies the growth data in `FourExp.auxiliary_construction`, matching the sizes $\log H(P_N) \ll N^2\sqrt{\log N}$ and $\deg P_N \ll N^2/\sqrt{\log N}$ of Waldschmidt's polynomials.
