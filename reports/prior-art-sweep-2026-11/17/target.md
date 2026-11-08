# Entry 17: (log 2)² + π² and (log 3)² + π² not both rational

Chapter 14 class: routine.

## The part not found, on its own

(log 2)² + π² and (log 3)² + π² are not both rational; the torsion-rational-modulus uniqueness behind it; and that the two open boundary statements cannot both fail at rational data.

## Printed results named as nearby (these do not count as finds)

Waldschmidt 1973 and the four exponentials theorem in the relevant form are inputs. Search for this exact pair of numbers, or for a statement that implies it.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Corollaries~\ref{cor:torsion_rational_modulus_unique} and~\ref{cor:log_two_log_three_not_both_rational}: $(\log2)^{2}+\pi^{2}$ and $(\log3)^{2}+\pi^{2}$ are not both rational; and Corollary~\ref{cor:recip_pi_log_of_torsion_rational_modulus}: the two open boundary statements cannot both fail at rational data.

## Statements, copied from the blueprint

### DiazModulus.torsion_rational_modulus_unique

Let $t_0,t_1$ be real with $e^{t_0},e^{t_1}$ algebraic. If $t_0^{2}+\pi^{2}$ and $t_1^{2}+\pi^{2}$ are both rational, then $t_1=\pm t_0$.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}). One substitution in \cite[Corollary 7]{Bro74}.

### DiazModulus.log_two_log_three_not_both_rational

The numbers $(\log2)^{2}+\pi^{2}$ and $(\log3)^{2}+\pi^{2}$ are not both rational.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.recip_pi_log_of_torsion_rational_modulus

Let $t\neq0$ be real with $e^{t}$ algebraic and $t^{2}+\pi^{2}\in\Q$. Then $e^{i\gamma/\pi}$ is transcendental for every $\gamma\in\Q$, $\gamma\neq0$.

Source line: Not found in the sources read, but routine (Chapter~\ref{chap:14-not-found-in-the-sources}): the two open boundary statements of the library cannot both fail at rational data. The key step is \cite[Corollary 5]{Bro74} at $\eta=t/\pi$.

## References named above

- [Bro74] W.~D.~Brownawell, The algebraic independence of certain numbers related by the exponential function, \emph{J. Number Theory} 6 (1974), 22--31.
