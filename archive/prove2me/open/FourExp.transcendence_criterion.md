# A Gel'fond-type transcendence criterion

- **Node:** `FourExp.transcendence_criterion`
- **Status:** Open
- **Theorem id:** `65f053a5-33bf-46c5-95a8-ac81974255c5`
- **Source:** M. Waldschmidt, Indépendance algébrique des valeurs de la fonction exponentielle, Bull. Soc. Math. France 99 (1971), 285–304, §3, Lemme fondamental (a refinement of Gel'fond's criterion, Transcendental and Algebraic Numbers, 1952, Ch. III §4 Lemma VII). Stated here with constant a_i, as in Remark 2 of that paper.

**A transcendence criterion of Gel'fond type.**

Let $\alpha \in \mathbb{C}$ and $\varepsilon > 0$. Let $\sigma_1, \sigma_2 : \mathbb{R} \to \mathbb{R}$ be strictly increasing with $\sigma_i(x) \to \infty$, and let $a_1, a_2 \ge 1$ be constants such that, for every $x > 0$,
$$\sigma_2(x) \le \sigma_1(x), \qquad \sigma_i(x+1) \le a_i\,\sigma_i(x) \quad (i = 1, 2).$$
Suppose that for every integer $N$ beyond some $N_0$ there is a non-zero $P_N \in \mathbb{Z}[X]$ with
$$\log H(P_N) \le \sigma_1(N), \qquad \deg P_N \le \sigma_2(N), \qquad |P_N(\alpha)| < \exp\bigl(-C\,\sigma_1(N)\,\sigma_2(N)\bigr),$$
where $H$ is the maximum absolute value of the coefficients and $C = \max\{10 + \varepsilon,\ (4+\varepsilon)\,a_1 a_2\}$. Then $\alpha$ is algebraic.

**What it is for.** In Gel'fond's method, transcendence of one number is proved by building integer polynomials that are too small at it. This criterion turns such a sequence into a contradiction when the number is transcendental. It is the tool that lets the Brownawell–Waldschmidt proof of four exponentials in transcendence degree one reduce to one transcendental generator $\omega$ of the field, and so it feeds `DiazModulus.four_exponentials_trdeg_one`.

**Formalization.** "$\log H \le \sigma_1(N)$" is written as a bound $|\text{coeff}| \le e^{\sigma_1(N)}$ on every coefficient. The paper also allows $a_i$ to depend on $x$; the constant case is the one its applications use (Remark 2), and it avoids a supremum over an unbounded family. The paper's second conclusion, that $P_N(\alpha) = 0$ for large $N$, is omitted.
