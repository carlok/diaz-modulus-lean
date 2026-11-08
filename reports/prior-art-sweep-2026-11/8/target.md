# Entry 8: Conjugate pair spaces, invisible to four-dimensional extensions

Chapter 14 class: routine.

## The part not found, on its own

The spaces H₀ + Q̄z + Q̄z̄ with z = u/(u² − a) or u/(u² − a)² carry a configuration that no 4-dimensional extension of H₀ inside them carries; and the conjugation-stable case of a 4-dimensional extension carries none. The target is the invisibility.

## Printed results named as nearby (these do not count as finds)

Their consequences at a candidate are printed, in [Dia07, Corollaire 5] and substitutions in it.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions}: five-dimensional spaces $\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$, with $z=u/(u^{2}-a)$ or $u/(u^{2}-a)^{2}$, carry a configuration that no four-dimensional extension of $\Qbar+\Qbar u+\Qbar\bar u$ inside them carries; and Proposition~\ref{prop:conj_stable_circle_point_extension_no_two_by_three_configuration}, the conjugation-stable case, which carries none. Their consequences at a candidate are printed (Corollary~\ref{cor:candidate_div_sq_sub_not_mem_logAlgTilde}).

## Statements, copied from the blueprint

### DiazModulus.circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions

With $u$, $a$ and $z$ as in Proposition~\ref{prop:circle_point_conjugate_pair_extension_carries_two_by_three_configuration}, put $H_0=\Qbar+\Qbar u+\Qbar\bar u$ and $W=H_0+\Qbar z+\Qbar\bar z$. Then $W$ carries a configuration, but for no $w\in W\setminus H_0$ does $H_0+\Qbar w$ carry one.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}). The shape of the configuration is printed; see Proposition~\ref{prop:circle_point_conjugate_pair_extension_carries_two_by_three_configuration}.

### DiazModulus.conj_stable_circle_point_extension_no_two_by_three_configuration

Let $u\in\C\setminus\Qbar$ with $\rho=u\bar u$ algebraic, and let $a\in\Qbar$, $a\neq0$, with $a\bar a=\rho^{2}$. Then there are no $x_1,x_2$, linearly independent over $\Qbar$, and $y_1,y_2,y_3$, linearly independent over $\Qbar$, with all six products $x_iy_j$ in $\Qbar+\Qbar u+\Qbar\bar u+\Qbar\,u/(u^{2}-a)$.

Source line: A consequence of Theorem~\ref{thm:circle_point_conjugate_pair_configuration_invisible_to_four_dimensional_extensions}. It is where the hypotheses of \cite[Théorème 2]{Dia04} and of \cite[Corollaire 4(4) and Théorème 7(1)]{Dia07} fail for this family.

### DiazModulus.candidate_div_sq_sub_not_mem_logAlgTilde

Assume Roy's strong six exponentials theorem, and let $u$ be a candidate: $u\neq0$, $|u|$ algebraic and $e^{u}$ algebraic. Let $a\in\Qbar$, $a\neq0$, and $\rho=u\bar u$. Then $u/(u^{2}-a)\notin\widetilde{\mathcal L}$ if $a\bar a\neq\rho^{2}$, and $u/(u^{2}-a)^{2}\notin\widetilde{\mathcal L}$ if $a\bar a=\rho^{2}$.

Source line: One substitution in \cite[Théorème 2]{Dia04}, at $x=(u,\bar u)$ and $y=1/(u^{2}-a)$, and in \cite[Corollaire 4(4) and Théorème 7(1)]{Dia07}; the second part is \cite[Théorème 6(3)]{Dia07}. Roy's theorem is \cite{Roy92}.

## References named above

- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
- [Dia04] G.~Diaz, Utilisation de la conjugaison complexe dans l'étude de la transcendance de valeurs de la fonction exponentielle usuelle, \emph{J. Théor. Nombres Bordeaux} 16 (2004), 535--553.
- [Roy92] D.~Roy, Matrices whose coefficients are linear forms in logarithms, \emph{J. Number Theory} 41 (1992), 22--47.
