# Entry 1: Theorem B

Chapter 14 class: not routine, rank 1.

## The part not found, on its own

The converse classification: if u ∉ Q̄ with uū algebraic, and H₀ + Q̄z (z ∉ H₀) contains all six products of a 2 × 3 configuration, then z ∈ H₀ + Q̄w with w = u², ū² or 1/(u − a), a ∈ Q̄ non-zero. Equivalently: a 4-dimensional space over an algebraically closed field containing 1, u, ρ/u that is a four-term progression (b, bh, bh², bh³) must have that shape. The step not found is the degree count forcing u to be a Möbius function of the ratio h.

## Printed results named as nearby (these do not count as finds)

[BSZ17, Lemma 4] (a 2 × 3 configuration in dimension ≤ 4 is a progression); [Fis01, Lemma 6.1]; [Dia07, Théorème 7(1), 7(2), Corollaire 5(1), 5(4)] (the 'if' direction and exclusions at a candidate).

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:circle_point_extension_two_by_three_configuration_iff} (Theorem~B): the four-dimensional extensions $\Qbar+\Qbar u+\Qbar\bar u+\Qbar z$ of a point of a circle that carry a $2\times3$ configuration are exactly those containing $u^{2}$, $\bar u^{2}$ or some $1/(u-a)$. First, because every later invisibility result goes through it, Theorem~E included. Its key step, Lemma~\ref{lem:two_by_three_configuration_forces_progression}, is \cite[Lemma 4]{BSZ17}; what was not found is the converse classification, where a degree count forces $u$ to be a M\"obius function of the ratio.

## Statements, copied from the blueprint

### DiazModulus.circle_point_extension_two_by_three_configuration_iff

Let $u\in\C\setminus\Qbar$ with $u\bar u$ algebraic, put $H_0=\Qbar+\Qbar u+\Qbar\bar u$, and let $z\notin H_0$. There are $x_1,x_2$, linearly independent over $\Qbar$, and $y_1,y_2,y_3$, linearly independent over $\Qbar$, with all six products $x_iy_j$ in $H_0+\Qbar z$ if and only if $z\in H_0+\Qbar w$ for $w=u^{2}$, $w=\bar u^{2}$, or $w=1/(u-a)$ with $a\in\Qbar$, $a\neq0$.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}). With Roy's strong six exponentials theorem \cite{Roy92}, the ``if'' direction gives at a candidate the exclusions of \cite[Corollaire 5(1) and 5(4)]{Dia07}; every configuration has the shape of \cite[Lemma 6.1]{Fis01} and \cite[Théorème 7(2)]{Dia07}. Its key step, Lemma~\ref{lem:two_by_three_configuration_forces_progression}, is \cite[Lemma 4]{BSZ17}.

### DiazModulus.two_by_three_configuration_forces_progression

Let $V\subseteq\C$ be a $\Qbar$-vector subspace of dimension at most $4$, and let $x_1,x_2$ and $y_1,y_2,y_3$ be linearly independent over $\Qbar$ with all six products $x_iy_j$ in $V$. Then
\[ V=\Qbar\,b+\Qbar\,bh+\Qbar\,bh^{2}+\Qbar\,bh^{3} \]
for some $b\neq0$ and $h\notin\Qbar$.

Source line: In print: \cite[Lemma 4]{BSZ17}, over any field. The converse direction, that such a progression carries a configuration, is used in \cite[Lemma 6.1]{Fis01} and \cite[Théorème 7(2)]{Dia07}.

## References named above

- [BSZ17] C.~Bachoc, O.~Serra and G.~Zémor, An analogue of Vosper's theorem for extension fields, \emph{Math. Proc. Cambridge Philos. Soc.} (2017); arXiv:1501.00602.
- [Fis01] S.~Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, \emph{Acta Arith.} 100 (2001), 167--187.
- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
- [Roy92] D.~Roy, Matrices whose coefficients are linear forms in logarithms, \emph{J. Number Theory} 41 (1992), 22--47.
