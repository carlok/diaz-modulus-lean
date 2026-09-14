# A derivative of an exponential polynomial is non-zero somewhere on a lattice

- **Node:** `FourExp.nonvanishing_derivative`
- **Status:** Open
- **Theorem id:** `6b3e7ded-6c39-4625-b4ac-f87189de2224`
- **Source:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, Lemma 6; with M. Waldschmidt, Bull. Soc. Math. France 99 (1971), 285–304, §4, Lemma 3 in place of Gel'fond's zero lemma.

**Some derivative of an exponential polynomial survives on a lattice.**

Let $x_1, x_2$ be linearly independent over $\mathbb{Q}$, and likewise $y_1, y_2$. For complex coefficients $c(i, j, k)$ ($0 \le i < S$, $0 \le j, k < T$), not all zero, put
$$G(z) = \sum_{i < S} \sum_{j, k < T} c(i,j,k)\, z^{i}\, e^{(j x_1 + k x_2) z} .$$
Let $R_1, R_2, S'$ be positive integers and $\lambda > 0$, with $n = S T^2$, such that
$$\frac{n}{\lambda} + 2\,\frac{1 + n^{\lambda}}{\lambda \log n}\,\Bigl(1 + (R_1|y_1| + R_2|y_2|)\,T\,(|x_1| + |x_2|)\Bigr) \le R_1 R_2 S' .$$
Then there are $a < R_1$, $b < R_2$ and $s < S'$ with $G^{(s)}(a y_1 + b y_2) \ne 0$.

**Proof idea.** Otherwise each of the $R_1 R_2$ points $a y_1 + b y_2$ is a zero of order at least $S'$. They are distinct because $y_1, y_2$ are $\mathbb{Q}$-independent, and they lie in the disc of radius $R_1|y_1| + R_2|y_2|$. The frequencies $j x_1 + k x_2$ are distinct because $x_1, x_2$ are $\mathbb{Q}$-independent, and have modulus at most $T(|x_1| + |x_2|)$. So `FourExp.expPoly_zero_count` bounds the number of zeros strictly below $R_1 R_2 S'$. A contradiction, provided $G \not\equiv 0$.

**What it is for.** This is step (3), Lemma 6, of Waldschmidt's 1973 proof of four exponentials in transcendence degree one, with the zero estimate of his 1971 paper in place of Gel'fond's. That swap removes the need for a Baker-type lower bound on $|n_1 + n_2 x_2/x_1|$. It feeds `FourExp.small_polynomials_of_counterexample`.
