# A rank-one matrix of logarithms factors as an outer product of independent pairs

- **Node:** `FourExp.rank_one_parametrization`
- **Status:** Open
- **Theorem id:** `30f831f0-d392-4e30-aa69-dee7d4b3ba65`
- **Source:** Elementary; the reduction of the four exponentials problem to products xᵢyⱼ, as in M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191–202, §I.

**A rank-one $2\times 2$ matrix of logarithms, written as $x_iy_j$.**

Let $l_{11}, l_{12}, l_{21}, l_{22}$ be non-zero complex numbers with $e^{l_{ij}}$ algebraic, $l_{11}l_{22} = l_{12}l_{21}$, and $\operatorname{trdeg}_{\mathbb{Q}}\mathbb{Q}[l_{ij}] \le 1$. Suppose neither the rows nor the columns are linearly dependent over $\mathbb{Q}$. Then there are $x_1, x_2, y_1, y_2 \in \mathbb{C}$ such that:
- $x_1, x_2$ are $\mathbb{Q}$-linearly independent, and so are $y_1, y_2$;
- every $e^{x_iy_j}$ is algebraic;
- $\operatorname{trdeg}_{\mathbb{Q}}\mathbb{Q}[x_1, x_2, y_1, y_2] \le 1$.

**Proof idea.** Take $x = (l_{11}, l_{21})$ and $y = (1, r)$ with $r = l_{12}/l_{11}$. Rank one gives $l_{22} = r\,l_{21}$, so $x_iy_j = l_{ij}$.
- A relation $a l_{11} + b l_{21} = 0$ would give $a l_{12} + b l_{22} = r(a l_{11} + b l_{21}) = 0$, a row dependence.
- $r \in \mathbb{Q}$ would give the column dependence $r l_{11} - l_{12} = r l_{21} - l_{22} = 0$.
- The new generators lie in the fraction field of $\mathbb{Q}[l_{ij}]$, which has the same transcendence degree.

**What it is for.** It is the first child of `FourExp.auxiliary_construction`, turning the matrix hypotheses into the $x_i, y_j$ that Waldschmidt's construction uses.
