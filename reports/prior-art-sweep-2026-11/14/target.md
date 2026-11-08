# Entry 14: Degree-one spaces seen by Theorem B

Chapter 14 class: routine.

## The part not found, on its own

A degree-one space H₀ + Q̄g + Q̄ug contains some H₀ + Q̄w carrying a configuration exactly when u·R(u)·g is a polynomial of degree ≤ 3 in u for some R ≠ 0 of degree ≤ 2; with a bound on degrees that decides it for every pencil space with rational data, without divisors.

## Printed results named as nearby (these do not count as finds)

Nothing named beyond the statement's source line.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:degree_one_space_visible_to_four_dimensional_extensions_iff_cubic_over_quadratic}: a degree-one space $\Qbar+\Qbar u+\Qbar\bar u+\Qbar g+\Qbar ug$ is seen by Theorem~B exactly when $u\,R(u)\,g$ is a polynomial of degree at most $3$ in $u$ for some $R\neq0$ of degree at most $2$; with Theorem~\ref{thm:rational_pencil_space_visible_to_four_dimensional_extensions_iff_natDegree_le}, a bound on degrees decides it for every pencil space with rational data, without divisors.

## Statements, copied from the blueprint

### DiazModulus.degree_one_space_visible_to_four_dimensional_extensions_iff_cubic_over_quadratic

Let $u\in\C\setminus\Qbar$ with $\rho=u\bar u\in\Qbar$. Call a space $W\supseteq H_{0}=\Qbar+\Qbar u+\Qbar\bar u$ visible if some $w\in W\setminus H_{0}$ makes $H_{0}+\Qbar w$ carry a $2\times3$ configuration, that is, if Theorem~\ref{thm:circle_point_extension_two_by_three_configuration_iff} sees it through a four-dimensional subspace. If $1,u,\bar u,g,ug$ are free, then $W_{g}=\Qbar+\Qbar u+\Qbar\bar u+\Qbar g+\Qbar ug$, which carries the configuration $(1,u)\otimes(\bar u,1,g)$, is visible if and only if $u\,R(u)\,g=N(u)$ for some $R,N\in\Qbar[X]$ with $R\neq0$, $\deg R\leq2$ and $\deg N\leq3$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.rational_pencil_space_visible_to_four_dimensional_extensions_iff_natDegree_le

Let $u\in\C\setminus\Qbar$, $s\in\Qbar$ with $s^{2}=u\bar u$, and $\lambda\in\Qbar$ with $|\lambda|=1$. Call a space $W\supseteq H_{0}=\Qbar+\Qbar u+\Qbar\bar u$ visible if some $w\in W\setminus H_{0}$ makes $H_{0}+\Qbar w$ carry a $2\times3$ configuration, that is, if Theorem~\ref{thm:circle_point_extension_two_by_three_configuration_iff} sees it through a four-dimensional subspace. Let $f=P(u)/Q(u)$ with $P,Q\in\Qbar[X]$ coprime, and suppose $1,u,\bar u,f,f/(s+\lambda u)$ are free. Then $W(\lambda,f)=\Qbar+\Qbar u+\Qbar\bar u+\Qbar f+\Qbar f/(s+\lambda u)$ is visible if and only if $\max(\deg P,\deg Q+1)\leq2+[Q(0)=0]+[P(-s\bar\lambda)=0]$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). For real $f$ these are the real pencil spaces of Proposition~\ref{prop:conj_stable_real_pencil_space_carries_two_by_three_configuration}; for Laurent $f$ the criterion contains Theorem~\ref{thm:laurent_real_pencil_configuration_invisible_to_four_dimensional_extensions}.

## References named above


