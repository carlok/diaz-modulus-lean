# An exponential polynomial is controlled by its first derivatives at the origin

- **Node:** `FourExp.expPoly_value_le_derivs`
- **Status:** Open
- **Theorem id:** `aec4da14-b097-4fda-999a-687c2dbecdd4`
- **Source:** M. Waldschmidt, Indépendance algébrique des valeurs de la fonction exponentielle, Bull. Soc. Math. France 99 (1971), 285–304, §4, (4.5)–(4.13).

**Values of an exponential polynomial are bounded by its low-order derivatives at $0$.**

Let $w_1, \dots, w_l$ be distinct complex numbers with $|w_j| \le W$ for some $W \ge 0$. For each $j$ let $P_j$ be a polynomial that is zero or has degree less than $q_j$, and put
$$g(z) = \sum_j P_j(z)\,e^{w_j z}, \qquad n = \sum_j q_j .$$
If $|g^{(s)}(0)| \le D$ for every $s < n$, then for every $u$ with $|u| \le R$
$$|g(u)| \;\le\; n\,(W+1)^{n+1}\,e^{R(W+1)}\,D .$$

**Proof idea** (van der Poorten's method, as in Waldschmidt 1971).
- The $n$ numbers $g^{(s)}(0)$, $s < n$, determine the coefficients of $g$. The system is a confluent Vandermonde determinant $\Delta \ne 0$, so Cramer's rule gives $\Delta\,g(u) = \sum_s a_s(u)\,g^{(s)}(0)$.
- The $a_s(u)$ are the coefficients of the Hermite interpolation polynomial of $z \mapsto e^{uz}$ at the nodes $w_j$, each with multiplicity $q_j$.
- Newton's form with divided differences, written as contour integrals over $|\gamma| = W + 1$, gives $\sum_s |a_s(u)| \le n\,(W+1)^{n+1} e^{R(W+1)}\,|\Delta|$.

**Why polynomial coefficients.** Rescaling $z \mapsto c + z/t$ keeps a function in this form (compose each $P_j$ with an affine map), and `FourExp.expPoly_zero_count_scaled` needs exactly that.

**What it is for.** It is the second estimate behind `FourExp.expPoly_zero_count_scaled`.
