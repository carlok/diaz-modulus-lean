# Entry 3: Theorem E, with Corollary E(a), (b)

Chapter 14 class: not routine, rank 3.

## The part not found, on its own

The complete classification: for z a polynomial in u and ū, the hull W_z carries a 2 × 3 configuration exactly when it is 5-dimensional and in class (P), (Q) or (R); with an exponent of absolute value ≥ 4 only (R) remains; and for z ≡ Aū³ + Bū² + Cu² + Du³ the criterion NΔ(|Δ|² − |u|²N²) = 0, N = |A|² − |D|², Δ = AC̄ − BD̄. The steps not found: the shape list, the two-sided pinch, the pencil analysis. The configurations themselves are printed or substitutions and do not count.

## Printed results named as nearby (these do not count as finds)

[Dia07, Théorème 7(1), Corollaire 5] and substitutions in them; [BSZ17, Lemma 4].

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff} (Theorem~E), with Corollaries~\ref{cor:laurent_conj_hull_large_exponent_configuration_iff_real_pencil_class} and~\ref{cor:cubic_window_conj_hull_two_by_three_configuration_iff_criterion} (Corollary~E(a) and~(b)): the conjugation hull $\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$ of a polynomial $z$ in $u$ and $\bar u$ carries a $2\times3$ configuration exactly when it is five-dimensional and in one of three classes, the polynomial class (P), the involution class (Q) and the real pencil class (R); with an exponent of absolute value at least $4$ only (R) remains, and for a five-dimensional hull of $z\equiv A\bar u^{3}+B\bar u^{2}+Cu^{2}+Du^{3}$ modulo $\Qbar+\Qbar u+\Qbar\bar u$ the criterion is $N\Delta(|\Delta|^{2}-|u|^{2}N^{2})=0$, with $N=|A|^{2}-|D|^{2}$ and $\Delta=A\bar C-B\bar D$. Third: a complete classification, whose proof has steps not found in the sources (the shape list, the two-sided pinch, the pencil analysis); its configurations are printed or substitutions, and the polynomial hulls of Theorem~\ref{thm:polynomial_hull_two_by_three_configuration_iff} (routine, listed below) are its class (P).

## Statements, copied from the blueprint

### DiazModulus.laurent_conj_hull_two_by_three_configuration_iff

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ with $s^{2}=u\bar u$ (so $s=\pm|u|$ is real), and put $v=u/s$, so that $\bar v=1/v$. Let $k\geq0$, let $c_j\in\Qbar$ for $j\in\Z$, and put $z=\sum_{j=-k}^{k}c_jv^{j}$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$. Then $W$ carries a $2\times3$ configuration if and only if $\dim W=5$ and $W$ is in one of the following classes:
\begin{enumerate}
\item[(P)] $\alpha u^{2}+\beta u^{3}\in W$ for some $\alpha,\beta\in\Qbar$, not both zero;
\item[(Q)] $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar(\bar v^{2}+ev^{2})+\Qbar(\beta\bar v^{3}+\zeta v^{2}+ev^{3})$ for some $e,\beta,\zeta\in\Qbar$ with $e\bar e=\beta\bar\beta=1$ and $\zeta=-\beta e^{2}\bar\zeta$;
\item[(R)] $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar g+\Qbar\bar g$ with $g=G(v)+\kappa\,\overline{vG(v)}$, for some $\kappa\in\Qbar$ with $\kappa\bar\kappa=1$ and some $G\in\Qbar[X]$ with $G(0)=0$ and $\deg G\geq2$.
\end{enumerate}
Since $u=sv$ and $\bar u=s\bar v$, the numbers $z$ are exactly the polynomials in $u$ and $\bar u$ with algebraic coefficients, $W$ is the conjugation hull of $z$, and $\Qbar+\Qbar u+\Qbar\bar u=\Qbar+\Qbar v+\Qbar\bar v$. The three classes are pairwise disjoint (Proposition~\ref{prop:laurent_conj_hull_configuration_classes_disjoint}), and each forces $\dim W=5$ (Lemma~\ref{lem:laurent_conj_hull_class_finrank_eq_five}).

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}). The ``only if'' half, the classification, was not found in the sources read; its method is partly that of \cite[\S7 and Lemma 4]{BSZ17}. The ``if'' half consists of printed configurations or substitutions in them: class (P) is \cite[Théorème 7(1)]{Dia07}, already in \cite[Théorème 2]{Dia04}; class (Q) is the configuration of the proof of \cite[Théorème 2]{Dia04} at $x=(1,(u+\beta\bar u)/s)$, also \cite[Théorème 4(1)]{Dia07}; class (R) consists of the real pencil spaces of Proposition~\ref{prop:conj_stable_real_pencil_space_carries_two_by_three_configuration}.

### DiazModulus.laurent_conj_hull_large_exponent_configuration_iff_real_pencil_class

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ with $s^{2}=u\bar u$ (so $s=\pm|u|$ is real), and put $v=u/s$, so that $\bar v=1/v$. Let $k\geq0$, let $c_j\in\Qbar$ for $j\in\Z$, and put $z=\sum_{j=-k}^{k}c_jv^{j}$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$. If $c_j\neq0$ for some $j$ with $4\leq|j|\leq k$, then $W$ carries a $2\times3$ configuration if and only if $W$ is in class (R) of Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}), given Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}.

### DiazModulus.cubic_window_conj_hull_two_by_three_configuration_iff_criterion

Let $u\in\C\setminus\Qbar$ and $s\in\Qbar$ with $s^{2}=u\bar u$ (so $s=\pm|u|$ is real), and put $v=u/s$, so that $\bar v=1/v$. Let $A,B,C,D\in\Qbar$, let $z\in\C$ with $z-(A\bar u^{3}+B\bar u^{2}+Cu^{2}+Du^{3})\in\Qbar+\Qbar u+\Qbar\bar u$, and let $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$ have dimension $5$. Put $\Delta=A\bar C-B\bar D$ and $N=A\bar A-D\bar D$. Then, for the classes (P), (Q) and (R) of Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}: $W$ is in (P) if and only if $\Delta=0$; in (Q) if and only if $N=0$ and $(A,D)\neq(0,0)$; in (R) if and only if $|\Delta|^{2}=s^{2}N^{2}$ and $N\neq0$. So $W$ carries a $2\times3$ configuration if and only if $N\Delta\,(|\Delta|^{2}-s^{2}N^{2})=0$, where $s^{2}=|u|^{2}$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}), given Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}.

### DiazModulus.polynomial_hull_two_by_three_configuration_iff

Let $u\in\C\setminus\Qbar$ with $\rho=u\bar u\in\Qbar$. For $P\in\Qbar[X]$, $W_{P}=\Qbar+\Qbar u+\Qbar\bar u+\Qbar P(u)+\Qbar\overline{P(u)}$ carries a $2\times3$ configuration if and only if $\deg P\in\{2,3\}$. So at a candidate Roy's theorem excludes $P(u)$ from $\widetilde{\mathcal L}$ through its hull exactly in degrees $2$ and $3$.

Source line: The configurations of degrees $2$ and $3$ are \cite[Théorème 7(1)]{Dia07} at $v=u$, and already \cite[Théorème 2]{Dia04}; the converse was not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}).

## References named above

- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
- [BSZ17] C.~Bachoc, O.~Serra and G.~Zémor, An analogue of Vosper's theorem for extension fields, \emph{Math. Proc. Cambridge Philos. Soc.} (2017); arXiv:1501.00602.
- [Dia04] G.~Diaz, Utilisation de la conjugaison complexe dans l'étude de la transcendance de valeurs de la fonction exponentielle usuelle, \emph{J. Théor. Nombres Bordeaux} 16 (2004), 535--553.
