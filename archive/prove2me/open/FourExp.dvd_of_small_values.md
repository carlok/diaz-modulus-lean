# Two integer polynomials small at the same point share a factor

- **Node:** `FourExp.dvd_of_small_values`
- **Status:** Open
- **Theorem id:** `94ad0017-5959-42e3-8dbb-5279735f4026`
- **Source:** Resultant bound as used in M. Waldschmidt, Indépendance algébrique des valeurs de la fonction exponentielle, Bull. Soc. Math. France 99 (1971), 285–304, §3, inequality (3.13), citing S. Lang, Introduction to Transcendental Numbers, 1966, V §2.

**A resultant argument: simultaneous small values force divisibility.**

Let $P, Q \in \mathbb{Z}[X]$ with $Q$ irreducible, let $\alpha \in \mathbb{C}$, and let $H, h \ge 1$ bound the coefficients of $P$ and of $Q$ respectively. Put $d = \deg P$ and $\delta = \deg Q$. If
$$\bigl((1 + |\alpha|)(d + \delta)\bigr)^{d+\delta}\; H^{\delta}\, h^{d}\; \bigl(|P(\alpha)| + |Q(\alpha)|\bigr) < 1,$$
then $Q$ divides $P$.

**Proof idea.** If $Q \nmid P$, then, $Q$ being irreducible, the two are coprime over $\mathbb{Q}$ (Gauss), so their resultant $R$ is a non-zero integer and $|R| \ge 1$. Write $R = A P + B Q$ with $A, B \in \mathbb{Z}[X]$ of degrees less than $\delta$ and $d$, whose coefficients are minors of the Sylvester matrix. Hadamard's inequality bounds them by $(d+\delta)^{d+\delta} H^{\delta} h^{d}$, up to the form above. Evaluating at $\alpha$ gives $|R| \le |A(\alpha)||P(\alpha)| + |B(\alpha)||Q(\alpha)|$, which is below $1$ under the hypothesis. A constant irreducible $Q = \pm p$ is covered as well: then the left-hand side is at least $p \ge 2$.

**What it is for.** Step (3.13) of Waldschmidt's proof of `FourExp.transcendence_criterion_continuous`. It shows $Q_q \mid P_N$ for $N = \lfloor z_q \rfloor$.
