# Entry 11: Laurent cubic and two-orbit spaces with a factor of degree two

Chapter 14 class: routine.

## The part not found, on its own

The invisibility of conjugation-stable spaces whose configuration has a factor of degree two and none of degree one; that no factor of higher degree occurs; which Laurent f make W(λ, f) visible. The configuration of the first is printed and does not count.

## Printed results named as nearby (these do not count as finds)

[Dia07, Théorème 7(1)] at v = u, w = u² + su: the configuration only.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorems~\ref{thm:laurent_cubic_configuration_invisible_to_four_dimensional_extensions}, \ref{thm:laurent_cubic_space_no_mobius_ratio_configuration} and~\ref{thm:two_orbit_configuration_invisible_to_four_dimensional_extensions}: conjugation-stable invisible spaces whose configuration has a factor of degree two and none of degree one. The configuration of the first is printed: it is that of \cite[Théorème 7(1)]{Dia07} at $v=u$, $w=u^{2}+su$, and what was not found is its invisibility. Theorem~\ref{thm:progression_pair_span_ratio_degree_le_two}: no factor of higher degree; Theorem~\ref{thm:laurent_real_pencil_configuration_invisible_to_four_dimensional_extensions} and Proposition~\ref{prop:laurent_real_pencil_space_contains_square_of_root}: which Laurent $f$ make $W(\lambda,f)$ visible.

## Statements, copied from the blueprint

### DiazModulus.laurent_cubic_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. Let $F=u^{3}/s^{3}+u^{2}/s^{2}$ and $W_{1}=\Qbar+\Qbar u+\Qbar\bar u+\Qbar F+\Qbar\bar F$. Then $W_{1}$ is stable under conjugation, the products of $(1,u^{2})$ and $(\bar u,u+s,\bar F)$ span it, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w\subseteq W_{1}$ with $w\notin\Qbar+\Qbar u+\Qbar\bar u$ carries a configuration.

Source line: The configuration is printed. Rescaled by $u^{\mp1}$, $(1,u^{2})\otimes(\bar u,u+s,\bar F)$ is the configuration $(v,\bar v)\otimes(1,w,\bar w)$ of \cite[Théorème 7(1)]{Dia07} at $v=u$, $w=u^{2}+su$. So its consequence at a candidate, $F\notin\widetilde{\mathcal L}$, is one substitution there; the same substitution with $w=u^{2}+cu$ excludes $u^{3}+cu^{2}$ for every algebraic $c$. That no four-dimensional extension inside $W_{1}$ carries a configuration was not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.laurent_cubic_space_no_mobius_ratio_configuration

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. Let $F=u^{3}/s^{3}+u^{2}/s^{2}$ and $W_{1}=\Qbar+\Qbar u+\Qbar\bar u+\Qbar F+\Qbar\bar F$. Then no configuration in $W_{1}$ has ratio $x_{2}/x_{1}=(\alpha u+\beta)/(\gamma u+\delta)$ with $\alpha\delta-\beta\gamma\neq0$; so $W_{1}$ is none of the spaces of Proposition~\ref{prop:conj_stable_real_pencil_space_carries_two_by_three_configuration}.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.two_orbit_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$, $a,b,\alpha,\beta,\gamma,\delta\in\Qbar^{\times}$ with $a^{2}\neq b^{2}$, $g_{1}=\alpha/(u-a)+\beta/(u+a)$, $g_{2}=\gamma/(u-b)+\delta/(u+b)$, and $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_{1}+\Qbar g_{2}$. If $\alpha\neq\beta$ or $\gamma\neq\delta$ and $u\bar u$ is algebraic, the products of $(1,u^{2})$ and $(u^{-1},g_{1},g_{2})$ span $W$, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w\subseteq W$ outside $\Qbar+\Qbar u+\Qbar\bar u$ carries a configuration.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). With $\alpha=\beta$ and $\gamma=\delta$, which its hypothesis excludes, the space is that of Theorem~\ref{thm:circle_point_two_pole_configuration_invisible_to_four_dimensional_extensions}, whose configuration is a progression (Case~I).

### DiazModulus.progression_pair_span_ratio_degree_le_two

Let $u\in\C\setminus\Qbar$, $c\neq0$, and suppose $1,u,u^{-1}$ lie in the $\Qbar$-span of $c,ch,ch^{2},ck,chk$. If $h=p(u)/q(u)$ with $p,q\in\Qbar[X]$ coprime and not both constant, then $\max(\deg p,\deg q)\leq2$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.laurent_real_pencil_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. Let $\lambda\in\Qbar$ with $|\lambda|=1$, $f=\sum_{|j|\le k}c_{j}(u/s)^{j}$ with $c_{j}\in\Qbar$, $c_{-j}=\bar c_{j}$, $c_{k}\neq0$, and $W(\lambda,f)=\Qbar+\Qbar u+\Qbar\bar u+\Qbar f+\Qbar f/(s+\lambda u)$. If the five numbers are free and $k\geq3$, or $k=2$ and $f(-\bar\lambda)\neq0$, $W(\lambda,f)$ is invisible to Theorem~\ref{thm:circle_point_extension_two_by_three_configuration_iff}.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.laurent_real_pencil_space_contains_square_of_root

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. Let $\lambda\in\Qbar$ with $|\lambda|=1$, $f=\sum_{|j|\le k}c_{j}(u/s)^{j}$ with $c_{j}\in\Qbar$, $c_{-j}=\bar c_{j}$, $c_{k}\neq0$, and $W(\lambda,f)=\Qbar+\Qbar u+\Qbar\bar u+\Qbar f+\Qbar f/(s+\lambda u)$. If $k=2$ and $f(-\bar\lambda)=0$, then $u^{2},\bar u^{2}\in W(\lambda,f)$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

## References named above

- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
