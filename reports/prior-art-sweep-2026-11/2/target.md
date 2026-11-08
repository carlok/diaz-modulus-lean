# Entry 2: Five-dimensional progression spaces and the involution spaces

Chapter 14 class: not routine, rank 2.

## The part not found, on its own

(a) A 5-dimensional space containing 1, u, u⁻¹ and a four-term progression whose ratio h is rational in u contains u², u⁻² or some 1/(u − b), or is an involution space. (b) The index bound [Q̄(u):Q̄(h)] ≤ 2 obtained through the degree formula of Lüroth's theorem. (c) The normal form for the pencil of a Möbius involution of the u-line. (d) Every involution space carries a configuration that no 4-dimensional extension inside it carries.

## Printed results named as nearby (these do not count as finds)

[BSZ17, Lemma 4], which supplies the progression and is taken as a hypothesis here. Lüroth's theorem and its degree formula as such.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:progression_space_contains_square_or_reciprocal_or_eq_involution_pencil_space}, with Lemma~\ref{lem:progression_space_ratio_degree_le_two}, Proposition~\ref{prop:quadratic_ratio_progression_space_eq_involution_pencil_space} and Theorems~\ref{thm:mobius_progression_space_contains_square_or_reciprocal} and~\ref{thm:involution_pencil_configuration_invisible_to_four_dimensional_extensions}: a five-dimensional space containing a four-term progression with ratio rational in $u$ contains $u^{2}$, $u^{-2}$ or some $1/(u-b)$, or is one of the involution spaces, which carry a configuration that no four-dimensional extension inside them carries. Second, because its proof has several steps not found in the sources (the index bound through the degree formula of L\"uroth's theorem, the normal form for an involution's pencil, the invisibility of every involution space); it covers only ratios in $\Qbar(u)$, takes the progression as a hypothesis (\cite[Lemma 4]{BSZ17} supplies it), and excludes nothing new at a candidate.

## Statements, copied from the blueprint

### DiazModulus.progression_space_contains_square_or_reciprocal_or_eq_involution_pencil_space

Let $u\in\C\setminus\Qbar$, let $p,q\in\Qbar[X]$ be coprime, $h=p(u)/q(u)$, $c\neq0$, and suppose $W=\Qbar+\Qbar u+\Qbar u^{-1}+\sum_{k\le3}\Qbar ch^{k}$ has dimension $5$. If $\max(\deg p,\deg q)\geq1$, then $W$ contains $u^{2}$, $u^{-2}$ or some $1/(u-b)$ with $b\in\Qbar$ non-zero, or $W$ is the space of Theorem~\ref{thm:involution_pencil_configuration_invisible_to_four_dimensional_extensions} for the pencil $\Qbar p+\Qbar q$.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}). The progression step (a configuration spanning four dimensions is a progression) is \cite[Lemma 4]{BSZ17} and is not used: the progression is a hypothesis.

### DiazModulus.progression_space_ratio_degree_le_two

Let $u\in\C\setminus\Qbar$, let $p,q\in\Qbar[X]$ be coprime, $h=p(u)/q(u)$, $c\neq0$, and suppose $W=\Qbar+\Qbar u+\Qbar u^{-1}+\sum_{k\le3}\Qbar ch^{k}$ has dimension $5$. If $\max(\deg p,\deg q)\geq1$, then $\max(\deg p,\deg q)\leq2$.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.quadratic_ratio_progression_space_eq_involution_pencil_space

Let $u\in\C\setminus\Qbar$, let $p,q\in\Qbar[X]$ be coprime, $h=p(u)/q(u)$, $c\neq0$, and suppose $W=\Qbar+\Qbar u+\Qbar u^{-1}+\sum_{k\le3}\Qbar ch^{k}$ has dimension $5$. If $\max(\deg p,\deg q)=2$, then $W$ is the space of Theorem~\ref{thm:involution_pencil_configuration_invisible_to_four_dimensional_extensions} for the pencil $\Qbar p+\Qbar q$, for some non-zero $l_1,l_2$ in it.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.mobius_progression_space_contains_square_or_reciprocal

Let $u\in\C\setminus\Qbar$, $h=(\alpha u+\beta)/(\gamma u+\delta)$ with $\alpha,\beta,\gamma,\delta\in\Qbar$, $\alpha\delta-\beta\gamma\neq0$, and $c\neq0$. If $\Qbar+\Qbar u+\Qbar u^{-1}+\sum_{k\le3}\Qbar ch^{k}$ has dimension $5$, it contains $u^{2}$, $u^{-2}$ or some $1/(u-b)$ with $b\in\Qbar$ non-zero.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}). With Lemma~\ref{lem:progression_space_ratio_degree_le_two} (the index is $1$ or $2$) and Proposition~\ref{prop:quadratic_ratio_progression_space_eq_involution_pencil_space} (index two) it gives Theorem~\ref{thm:progression_space_contains_square_or_reciprocal_or_eq_involution_pencil_space}.

### DiazModulus.involution_pencil_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$, let $q_1,q_2\in\Qbar[X]$ be coprime of degree at most $2$, one of degree exactly $2$ (so that $\Qbar q_1+\Qbar q_2$ is the pencil of quadratics vanishing on the orbits of a Möbius involution of the $u$-line), let $l_1,l_2$ be non-zero members of the pencil, and let $W$ be the span of $1,u,u^{-1}$ and of $q_1(u)^{i}q_2(u)^{3-i}/(u\,l_1(u)l_2(u))$, $i=0,\dots,3$. Suppose $u\bar u$ is algebraic. Then $W$ carries a $2\times3$ configuration, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w$ with $w\in W$ outside $\Qbar+\Qbar u+\Qbar\bar u$ does.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}). For $q_1=X^{2}$, $q_2=1$ it is Theorem~\ref{thm:circle_point_two_pole_configuration_invisible_to_four_dimensional_extensions}. Conversely, every five-dimensional space containing a progression with ratio rational in $u$ and invisible to Theorem~\ref{thm:circle_point_extension_two_by_three_configuration_iff} is of this form (Theorem~\ref{thm:progression_space_contains_square_or_reciprocal_or_eq_involution_pencil_space}).

## References named above

- [BSZ17] C.~Bachoc, O.~Serra and G.~Zémor, An analogue of Vosper's theorem for extension fields, \emph{Math. Proc. Cambridge Philos. Soc.} (2017); arXiv:1501.00602.
