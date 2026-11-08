# Entry 12: Conjugation-swapped orbits and cyclic pairs

Chapter 14 class: routine.

## The part not found, on its own

The invisibility of the spaces built from two orbits of u ↦ −u exchanged by conjugation, and of a conjugation-stable space whose factor (1, u²) acts as a Jordan block; for the cyclic space, the absence of a factor of degree one. The configurations are printed and do not count.

## Printed results named as nearby (these do not count as finds)

[Dia07, Théorème 7(1)] at v = u, after rescaling by u^{∓1}: the configurations only.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:conj_swapped_two_orbit_configuration_invisible_to_four_dimensional_extensions}: two orbits of $u\mapsto-u$ exchanged by conjugation give conjugation-stable invisible spaces; Theorems~\ref{thm:cyclic_pair_configuration_invisible_to_four_dimensional_extensions} and~\ref{thm:cyclic_pair_space_no_mobius_ratio_configuration}: a conjugation-stable invisible space whose factor $(1,u^{2})$ acts as a Jordan block, with no factor of degree one. As for Theorem~\ref{thm:laurent_cubic_configuration_invisible_to_four_dimensional_extensions}, their configurations are printed: rescaled by $u^{\mp1}$, each is that of \cite[Théorème 7(1)]{Dia07} at $v=u$, and so is that of Theorem~\ref{thm:two_orbit_configuration_invisible_to_four_dimensional_extensions} in the conjugation-stable case of Proposition~\ref{prop:conj_stable_two_orbit_space}; what was not found is their invisibility, and for the cyclic space the absence of a factor of degree one. With the previous item, each family of the research notes' classification of these spaces has a formal member; the classification, which the notes make for every involution of the $u$-line that commutes with conjugation, is not formalised.

## Statements, copied from the blueprint

### DiazModulus.conj_swapped_two_orbit_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. Let $a,a_{1},a_{2}\in\Qbar^{\times}$ with $a\bar a\neq s^{2}$ and $a_{1}\neq a_{2}$, $g=a_{1}/(u-a)+a_{2}/(u+a)$ and $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g+\Qbar\bar g$. Then $W$ is stable under conjugation, the products of a configuration span it, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w\subseteq W$ with $w\notin \Qbar+\Qbar u+\Qbar\bar u$ carries a configuration.

Source line: The configuration is printed: rescaled by $u^{\mp1}$, it is the configuration $(v,\bar v)\otimes(1,w,\bar w)$ of \cite[Théorème 7(1)]{Dia07} at $v=u$, $w=ug$. That no four-dimensional extension inside $W$ carries a configuration was not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). Conjugation exchanges the orbits $\pm a$ and $\pm s^{2}/\bar a$ of $u\mapsto-u$; Proposition~\ref{prop:conj_stable_two_orbit_space} is the case where it fixes them.

### DiazModulus.cyclic_pair_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. With $v=u/s$, let $G_{1}=1/(v-1)+2/(v+1)$, $G_{2}=1/(v-1)^{2}+1/(v-1)-2/(v+1)^{2}+2/(v+1)$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar G_{1}+\Qbar G_{2}$. Then $W$ is stable under conjugation, the products of $(1,u^{2})$ and $(\bar u,G_{1},G_{2})$ span it, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w\subseteq W$ with $w\notin \Qbar+\Qbar u+\Qbar\bar u$ carries a configuration.

Source line: The configuration is printed: rescaled by $u^{\mp1}$, it is the configuration $(v,\bar v)\otimes(1,w,\bar w)$ of \cite[Théorème 7(1)]{Dia07} at $v=u$, $w=uG_{2}$. That no four-dimensional extension inside $W$ carries a configuration was not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). Modulo $\Qbar+\Qbar u+\Qbar\bar u$, the factor $(1,u^{2})$ acts on $G_{1},G_{2}$ as a Jordan block.

### DiazModulus.cyclic_pair_space_no_mobius_ratio_configuration

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. With $v=u/s$, let $G_{1}=1/(v-1)+2/(v+1)$, $G_{2}=1/(v-1)^{2}+1/(v-1)-2/(v+1)^{2}+2/(v+1)$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar G_{1}+\Qbar G_{2}$. Then no configuration in $W$ has ratio $x_{2}/x_{1}=(\alpha u+\beta)/(\gamma u+\delta)$ with $\alpha\delta-\beta\gamma\neq0$; so $W$ is none of the spaces of Proposition~\ref{prop:conj_stable_real_pencil_space_carries_two_by_three_configuration}.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.laurent_cubic_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ real with $s^{2}=u\bar u$. Let $F=u^{3}/s^{3}+u^{2}/s^{2}$ and $W_{1}=\Qbar+\Qbar u+\Qbar\bar u+\Qbar F+\Qbar\bar F$. Then $W_{1}$ is stable under conjugation, the products of $(1,u^{2})$ and $(\bar u,u+s,\bar F)$ span it, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w\subseteq W_{1}$ with $w\notin\Qbar+\Qbar u+\Qbar\bar u$ carries a configuration.

Source line: The configuration is printed. Rescaled by $u^{\mp1}$, $(1,u^{2})\otimes(\bar u,u+s,\bar F)$ is the configuration $(v,\bar v)\otimes(1,w,\bar w)$ of \cite[Théorème 7(1)]{Dia07} at $v=u$, $w=u^{2}+su$. So its consequence at a candidate, $F\notin\widetilde{\mathcal L}$, is one substitution there; the same substitution with $w=u^{2}+cu$ excludes $u^{3}+cu^{2}$ for every algebraic $c$. That no four-dimensional extension inside $W_{1}$ carries a configuration was not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.two_orbit_configuration_invisible_to_four_dimensional_extensions

Let $u\in\C\setminus\Qbar$, $a,b,\alpha,\beta,\gamma,\delta\in\Qbar^{\times}$ with $a^{2}\neq b^{2}$, $g_{1}=\alpha/(u-a)+\beta/(u+a)$, $g_{2}=\gamma/(u-b)+\delta/(u+b)$, and $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_{1}+\Qbar g_{2}$. If $\alpha\neq\beta$ or $\gamma\neq\delta$ and $u\bar u$ is algebraic, the products of $(1,u^{2})$ and $(u^{-1},g_{1},g_{2})$ span $W$, and no $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w\subseteq W$ outside $\Qbar+\Qbar u+\Qbar\bar u$ carries a configuration.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). With $\alpha=\beta$ and $\gamma=\delta$, which its hypothesis excludes, the space is that of Theorem~\ref{thm:circle_point_two_pole_configuration_invisible_to_four_dimensional_extensions}, whose configuration is a progression (Case~I).

### DiazModulus.conj_stable_two_orbit_space

Let $u\in\C\setminus\Qbar$, $a,b,\alpha,\beta,\gamma,\delta\in\Qbar^{\times}$ with $a^{2}\neq b^{2}$, $g_{1}=\alpha/(u-a)+\beta/(u+a)$, $g_{2}=\gamma/(u-b)+\delta/(u+b)$, and $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_{1}+\Qbar g_{2}$. Let $s\in\Qbar$ with $s^{2}=u\bar u$. If $a\bar a=b\bar b=s^{2}$ and $\beta/\alpha$, $\delta/\gamma$ are real, $W$ is stable under conjugation.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). With it, the configuration of Theorem~\ref{thm:two_orbit_configuration_invisible_to_four_dimensional_extensions} is printed: rescaled by $u^{\mp1}$, it is the configuration $(v,\bar v)\otimes(1,w,\bar w)$ of \cite[Théorème 7(1)]{Dia07} at $v=u$, for any $w$ with $\Qbar+\Qbar w+\Qbar\bar w=u\,(\Qbar u^{-1}+\Qbar g_{1}+\Qbar g_{2})$.

## References named above

- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
