# Entry 16: Diaz's (Qr2) and pair rigidity in transcendence degree one

Chapter 14 class: routine.

## The part not found, on its own

Diaz's question (Qr2) of [Dia07] when the numbers involved generate a field of transcendence degree one, and the statement that a pair of logarithms is rigid in transcendence degree one. See the statements below for the exact form.

## Printed results named as nearby (these do not count as finds)

[Dia07], which asks (Qr2); the four exponentials theorem in transcendence degree one and [Bro74, Corollaries 5, 7], the known inputs: check those corollaries first.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:diaz_2007_qr2_of_trdeg_one}: Diaz's (Qr2) in transcendence degree one; and Theorem~\ref{thm:log_pair_rigid_of_trdeg_one}, pair rigidity in transcendence degree one.

## Statements, copied from the blueprint

### DiazModulus.diaz_2007_qr2_of_trdeg_one

Let $\ell_0,\ell_1\in\mathcal L$, neither real nor purely imaginary, with $\operatorname{trdeg}_{\Q}\Q(\ell_0,\ell_1,\bar\ell_0,\bar\ell_1)\le1$. If $\ell_1/\ell_0$ is real or purely imaginary, then $\ell_1/\ell_0\in\Q$.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}). The statement is Diaz's conjecture (Qr2) \cite[p.~376]{Dia07}, here in transcendence degree one; Diaz derives (Qr2) from the four exponentials conjecture with the same matrix \cite[p.~377]{Dia07}. It is one substitution in \cite[Corollary 7]{Bro74}, at $(\ell_1/\ell_0,\bar\ell_0/\ell_0,\ell_0)$.

### DiazModulus.log_pair_rigid_of_trdeg_one

Let $u,v\in\mathcal L\setminus\{0\}$ with $|u|^{2}/|v|^{2}\in\Q$ and $\operatorname{trdeg}_{\Q}\Q(u,v,\bar u,\bar v)\le1$. Then $v\in\Q u$ or $v\in\Q\bar u$.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It is \cite[Corollary 7]{Bro74} at $(v/u,c\bar v/u,u)$, word for word.

## References named above

- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
- [Bro74] W.~D.~Brownawell, The algebraic independence of certain numbers related by the exponential function, \emph{J. Number Theory} 6 (1974), 22--31.
