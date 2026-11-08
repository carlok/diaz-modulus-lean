# Entry 7: The 2 × 2 normal form in K + Ku + Kū

Chapter 14 class: routine.

## The part not found, on its own

The 2 × 2 configurations in K + Ku + Kū form one orbit, that of (1, u) ⊗ (1, ū), under GL₂(K) × GL₂(K); their constant terms form an invertible matrix; at a candidate they are never matrices of logarithms; on generic data every quadratic relation is a multiple of the norm form, and the singular pencil of such a matrix is only the norm form.

## Printed results named as nearby (these do not count as finds)

[BSZ17, Lemmas 4 and 5], the two-dimensional critical-pair lemma it extends.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:circle_point_two_by_two_normal_form}: the $2\times2$ configurations in $K+Ku+K\bar u$ form one orbit, that of $(1,u)\otimes(1,\bar u)$ under $\mathrm{GL}_2(K)\times\mathrm{GL}_2(K)$. Their constant terms form an invertible matrix (Corollary~\ref{cor:circle_point_config_constant_matrix_det_ne_zero}), and at a candidate they are never matrices of logarithms (Corollary~\ref{cor:candidate_two_by_two_config_entry_not_mem_span_logAlg}). Theorems~\ref{thm:generic_quadratic_relation_is_norm}, \ref{thm:no_vanishing_coeff} and~\ref{thm:det_pencil_eq_conic} are, in substance, its corollaries: on generic data every quadratic relation is a multiple of the norm form, and the matrix a counterexample would give has no vanishing coefficient and only the norm form as singular pencil. It extends the two-dimensional critical-pair lemma of \cite[Lemmas 4 and 5]{BSZ17}.

## Statements, copied from the blueprint

### DiazModulus.circle_point_two_by_two_normal_form

Let $u$ be transcendental over a subfield $K\subseteq\C$ with $\rho=u\bar u\in K$. Then $x_1,x_2$ and $y_1,y_2$ form a $2\times2$ configuration over $K$ in $K+Ku+K\bar u$ if and only if $x_i=\mu(P_{i1}+P_{i2}u)$ and $y_j=\mu^{-1}(Q_{1j}+Q_{2j}\bar u)$ for some $\mu\neq0$ and invertible $P,Q\in K^{2\times2}$: the configurations form the orbit of $(1,u)\otimes(1,\bar u)$ under $\mathrm{GL}_2(K)\times\mathrm{GL}_2(K)$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It extends the two-dimensional critical-pair lemma of \cite[Lemmas 4 and 5]{BSZ17}; the configuration $(1,u)\otimes(1,\bar u)$ itself is \cite[p.~431]{Wal00}.

### DiazModulus.circle_point_config_constant_matrix_det_ne_zero

In the setting of Corollary~\ref{cor:generic_circle_point_config_is_two_by_two}, for every $2\times2$ configuration there is an invertible $c\in K^{2\times2}$ with $x_iy_j-c_{ij}\in Ku+K\bar u$. In particular no $2\times2$ configuration lies in $Ku+K\bar u+Kw_1+\dots+Kw_m$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It sharpens \texttt{Diaz.generic\_qbar\_homogeneous\_four\_exp\_barrier}, the homogeneous barrier of the companion note.

### DiazModulus.candidate_two_by_two_config_entry_not_mem_span_logAlg

Let $u$ be a candidate with $u,w_1,\dots,w_m$ algebraically independent over $\Qbar$. In every $2\times2$ configuration over $\Qbar$ in $\Qbar+\Qbar u+\Qbar\bar u+\Qbar w_1+\dots+\Qbar w_m$, each row and each column has an entry outside $\Qbar\mathcal L$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.generic_quadratic_relation_is_norm

Let $u\neq0$ with $\rho=u\bar u$ algebraic, and suppose that $u$ and $i\pi$ are algebraically independent over $\Qbar$. Every quadratic form with algebraic coefficients that vanishes at $(1,u,\bar u,i\pi)$ is an algebraic multiple of $X_1X_2-\rho X_0^{2}$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It is the generic-point fact for the quadric cone $X_1X_2=\rho X_0^{2}$, and $i\pi$ may be any number algebraically independent of $u$; it also follows from Theorems~\ref{thm:rank_one_config_separation} and~\ref{thm:circle_point_two_by_two_normal_form}.

### Diaz.no_vanishing_coeff

Let $K\subseteq\C$ be a subfield, $r\in K$, and $u\notin K$ with $u\bar u=r^{2}$, and put $H=\begin{pmatrix}u&r\\r&\bar u\end{pmatrix}$. Then $w^{\mathsf T}Hv\neq0$ for all non-zero $w,v\in K^{2}$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). The nearest printed passage is \cite[\S3.2, p.~65]{Roy95}: Roy's rank method cannot exclude points of $xy=z^{2}$ with $\Qbar$-free coordinates, and $(u,\bar u,r)$ is such a point; see also \cite[p.~186]{Fis01}. In substance it is a corollary of Theorem~\ref{thm:circle_point_two_by_two_normal_form}.

### Diaz.det_pencil_eq_conic

Let $K\subseteq\C$ be a subfield, let $u\neq0$ be transcendental over $K$ with $u\bar u\in K$, and let $A,B,C$ be $2\times2$ matrices over $K$ with $\det(A+uB+\bar uC)=0$. Then there is $c\in K$ with
\[ \det(xA+yB+zC)=c\,\bigl(yz-(u\bar u)\,x^{2}\bigr)\qquad\text{for all }x,y,z\in\C. \]

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). Roy has neither this classification nor Theorem~\ref{thm:no_vanishing_coeff}; the nearest printed passage is \cite[\S3.2, p.~65]{Roy95}. It follows from Theorem~\ref{thm:circle_point_two_by_two_normal_form} in a few lines.

## References named above

- [BSZ17] C.~Bachoc, O.~Serra and G.~Zémor, An analogue of Vosper's theorem for extension fields, \emph{Math. Proc. Cambridge Philos. Soc.} (2017); arXiv:1501.00602.
- [Wal00] M.~Waldschmidt, \emph{Diophantine Approximation on Linear Algebraic Groups}, Grundlehren der mathematischen Wissenschaften 326, Springer, 2000.
- [Roy95] D.~Roy, Points whose coordinates are logarithms of algebraic numbers on algebraic varieties, \emph{Acta Math.} 175 (1995), 49--73.
- [Fis01] S.~Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, \emph{Acta Arith.} 100 (2001), 167--187.
