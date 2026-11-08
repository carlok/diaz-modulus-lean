# Entry 19: Strong five exponentials implies Diaz

Chapter 14 class: routine.

## The part not found, on its own

The strong five exponentials conjecture implies Diaz's conjecture (that a non-zero logarithm of an algebraic number never has algebraic modulus).

## Printed results named as nearby (these do not count as finds)

[Dia07] (strong six and related implications), [Wal00, §11] (the conjectures as such), [Roy92].

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:diaz_of_strong_five_exponentials}: the strong five exponentials conjecture implies Diaz's.

## Statements, copied from the blueprint

### DiazModulus.diaz_of_strong_five_exponentials

Assume Waldschmidt's strong five exponentials conjecture: if $x_1,x_2$ are linearly independent over $\Q$, $y_1,y_2$ are linearly independent over $\Q$, $\eta\neq0$, the $\alpha_{ij}$ and $\beta$ are algebraic, and the five numbers $e^{x_iy_j-\alpha_{ij}}$ and $e^{\eta x_2/x_1-\beta}$ are algebraic, then $x_iy_j=\alpha_{ij}$ for all $i,j$ and $\eta x_2=\beta x_1$. Then for every $u\neq0$ with $|u|$ algebraic, $e^{u}$ is transcendental.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}): the derivation is one line. The conjecture is \cite[Conjecture 3.5]{Wal04}.

## References named above

- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
- [Wal00] M.~Waldschmidt, \emph{Diophantine Approximation on Linear Algebraic Groups}, Grundlehren der mathematischen Wissenschaften 326, Springer, 2000.
- [Roy92] D.~Roy, Matrices whose coefficients are linear forms in logarithms, \emph{J. Number Theory} 41 (1992), 22--47.
- [Wal04] M.~Waldschmidt, Open Diophantine problems, \emph{Mosc. Math. J.} 4 (2004), 245--305.
