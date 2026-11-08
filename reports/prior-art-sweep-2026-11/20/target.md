# Entry 20: Weak Schanuel reductions

Chapter 14 class: routine.

## The part not found, on its own

Under the case n = 2 of Kirby's weak Schanuel conjecture, a candidate has Im u ∈ πℚ and Diaz's conjecture reduces to one relation; with the case n = 1 of Schanuel's conjecture over the kernel 2πiℚ, Diaz's conjecture holds.

## Printed results named as nearby (these do not count as finds)

Kirby's weak Schanuel conjecture as stated; Schanuel's conjecture implying Diaz's (full Schanuel); [Dia04].

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Proposition~\ref{prop:candidate_im_mem_pi_rat_of_weak_schanuel} and Corollary~\ref{cor:diaz_iff_single_relation_of_weak_schanuel}: under the case $n=2$ of Kirby's weak Schanuel conjecture, a candidate has $\operatorname{Im}u\in\pi\Q$, and Diaz's conjecture reduces to one relation; with the case $n=1$ of Schanuel's conjecture over the kernel $2\pi i\Q$, it holds (Corollary~\ref{cor:diaz_of_weak_schanuel_and_kernel_schanuel}).

## Statements, copied from the blueprint

### DiazModulus.candidate_im_mem_pi_rat_of_weak_schanuel

Assume the case $n=2$ of Kirby's weak Schanuel conjecture \cite[Conjecture 1.5]{Kir18}: if $\trdeg_{\Q}\Q(a,b,e^{a},e^{b})<2$, then $ma+nb\in2\pi i\Z$ for some integers $(m,n)\neq(0,0)$. Then every candidate $u$ has $\operatorname{Re}u\neq0$ and $\operatorname{Im}u\in\pi\Q^{\times}$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It is not the ``weak Schanuel'' of Calegari and Mazur, which is the algebraic independence of logarithms.

### DiazModulus.diaz_iff_single_relation_of_weak_schanuel

Assume the case $n=2$ of Kirby's weak Schanuel conjecture \cite[Conjecture 1.5]{Kir18}: if $\trdeg_{\Q}\Q(a,b,e^{a},e^{b})<2$, then $ma+nb\in2\pi i\Z$ for some integers $(m,n)\neq(0,0)$. Then Diaz's conjecture holds if and only if $t^{2}+\pi^{2}$ is transcendental for every real $t\neq0$ with $e^{t}$ algebraic.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.diaz_of_weak_schanuel_and_kernel_schanuel

Assume the case $n=2$ of Kirby's weak Schanuel conjecture \cite[Conjecture 1.5]{Kir18}, and that $\trdeg_{\Q}\Q(\pi,a,e^{a})\geq2$ for every $a\notin2\pi i\Q$. Then Diaz's conjecture holds.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). The step from Schanuel over the kernel to the single relation is standard.

## References named above

- [Dia04] G.~Diaz, Utilisation de la conjugaison complexe dans l'étude de la transcendance de valeurs de la fonction exponentielle usuelle, \emph{J. Théor. Nombres Bordeaux} 16 (2004), 535--553.
- [Kir18] J.~Kirby, Variants of Schanuel's conjecture, arXiv:1801.08765 (2018).
