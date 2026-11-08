# Entry 6: Separation, with Theorem A

Chapter 14 class: routine.

## The part not found, on its own

Over any subfield K ⊆ F, numbers algebraically independent over F never enter a configuration in V₀ + Kw₁ + … + Kw_m with V₀ ⊆ F. With the bound p + q ≤ 4 in the hull it gives Theorem A: no 2 × 3 configuration on generic data, whatever numbers are added.

## Printed results named as nearby (these do not count as finds)

[Wal00, Proposition 12.2 and the Remark on p. 424], which is the case V₀ = K = Q̄; the case m = 0 of Theorem A is Roy's.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:rank_one_config_separation} (separation): over any subfield $K\subseteq F$, numbers algebraically independent over $F$ never enter a configuration in $V_0+Kw_1+\dots+Kw_m$, $V_0\subseteq F$. With the bound $p+q\le4$ in the hull (Corollary~\ref{cor:generic_circle_point_config_is_two_by_two}) it gives Theorem~\ref{thm:generic_circle_point_no_two_by_three_configuration} (Theorem~A: no $2\times3$ configuration on generic data, whatever numbers are added; its case $m=0$ is Roy's), and it contains Theorem~\ref{thm:generic_period_never_enters}. Its case $V_0=K=\Qbar$ is \cite[Proposition 12.2 and the Remark on p.~424]{Wal00}, whose argument it extends.

## Statements, copied from the blueprint

### DiazModulus.rank_one_config_separation

A $p\times q$ \emph{configuration over $K$} in a $K$-space $V\subseteq\C$ is a pair of families $x_1,\dots,x_p$ and $y_1,\dots,y_q$, each linearly independent over $K$, with every product $x_iy_j$ in $V$.

Let $K\subseteq F$ be subfields of $\C$, $V_0\subseteq F$ a $K$-space and $w_1,\dots,w_m$ algebraically independent over $F$. Every $p\times q$ configuration over $K$ with $p,q\ge2$ in $V_0+Kw_1+\dots+Kw_m$ lies in $V_0$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It contains the separation steps of Theorems~\ref{thm:generic_circle_point_no_two_by_three_configuration} and~\ref{thm:generic_period_never_enters}, which are over $\Qbar$. Its case $V_0=K=\Qbar$ follows from \cite[Proposition 12.2 and the Remark on p.~424]{Wal00}, whose argument it extends.

### DiazModulus.generic_circle_point_config_is_two_by_two

Let $u,w_1,\dots,w_m$ be algebraically independent over a subfield $K\subseteq\C$, with $\rho=u\bar u\in K$. Every $p\times q$ configuration over $K$ with $p,q\ge2$ in $K+Ku+K\bar u+Kw_1+\dots+Kw_m$ is $2\times2$ and lies in $K+Ku+K\bar u$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). For $K=\Qbar$ it contains Theorem~\ref{thm:generic_circle_point_no_two_by_three_configuration}.

### DiazModulus.generic_circle_point_no_two_by_three_configuration

Let $u\neq0$ with $u\bar u$ algebraic, and let $w_1,\dots,w_m\in\C$ be such that $u,w_1,\dots,w_m$ are algebraically independent over $\Qbar$. Then there are no $x_1,x_2$, linearly independent over $\Qbar$, and $y_1,y_2,y_3$, linearly independent over $\Qbar$, with all six products $x_iy_j$ in $\Qbar+\Qbar u+\Qbar\bar u+\sum_j\Qbar w_j$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). The case $m=0$ is \cite[Theorem 3.4]{Roy95} and \cite[Lemma 12.16 and Exercise 12.10]{Wal00}; see also \cite[\S3.2]{Roy95} and \cite[p.~186]{Fis01}. The general statement was not found in the sources read. It follows from Theorem~\ref{thm:rank_one_config_separation} and the bound $p+q\le4$ in the hull (Corollary~\ref{cor:generic_circle_point_config_is_two_by_two}).

### DiazModulus.generic_period_never_enters

Let $u\neq0$ with $\rho=u\bar u$ algebraic, and suppose that $u$ and $i\pi$ are algebraically independent over $\Qbar$. Let $M$ be a singular $2\times2$ matrix with entries $c_{ij0}+c_{ij1}u+c_{ij2}\bar u+c_{ij3}\,i\pi$, $c_{ijk}$ algebraic, whose rows are linearly independent over $\Qbar$ and whose columns are linearly independent over $\Qbar$. Then $c_{ij3}=0$ for all $i,j$: the coefficient of $i\pi$ vanishes in every entry.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It is a case of Theorem~\ref{thm:rank_one_config_separation}, with $w_1=i\pi$ over $\Qbar(u)$.

## References named above

- [Wal00] M.~Waldschmidt, \emph{Diophantine Approximation on Linear Algebraic Groups}, Grundlehren der mathematischen Wissenschaften 326, Springer, 2000.
- [Roy95] D.~Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, \emph{Acta Math.} 175 (1995), 49--73.
- [Fis01] S.~Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, \emph{Acta Arith.} 100 (2001), 167--187.
