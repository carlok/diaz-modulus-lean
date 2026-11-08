# Entry 5: The Laurent hull and sumset theorem

Chapter 14 class: routine.

## The part not found, on its own

For u transcendental over K ⊆ ℂ and S ⊂ ℤ finite, the K-span of the u^s, s ∈ S, contains the products of a p × q configuration if and only if S contains a sumset A + B with |A| = p, |B| = q. The consequences: in Q̄u⁻ᵏ + Q̄u⁻¹ + Q̄ + Q̄u + Q̄uᵏ a configuration exists only for k = 2, 3; which pairs of powers are excluded; the powers u^{4^j} are not.

## Printed results named as nearby (these do not count as finds)

[BSZ17, §7], the valuation method it applies; [Fis01, Lemma 6.1]; initial-form arguments as a method only.

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:laurent_hull_config_iff}: the span of the powers $u^{s}$, $s\in S$, carries a $p\times q$ configuration exactly when $S$ contains a sumset $A+B$ with $|A|=p$, $|B|=q$. It decides every such hull: in $\Qbar u^{-k}+\Qbar u^{-1}+\Qbar+\Qbar u+\Qbar u^{k}$ a configuration exists only for $k=2,3$ (Theorem~\ref{thm:power_hull_strong_six_exp_configuration_iff}), so through these hulls Roy's theorem excludes no single power beyond $u^{3}$; Propositions~\ref{prop:power_pair_hull_two_by_three_iff} and~\ref{prop:four_pow_hull_no_two_by_three} give the pairs of powers it does exclude, and the powers $u^{4^j}$, which it cannot. The proof is the valuation method of \cite[\S7]{BSZ17}.

## Statements, copied from the blueprint

### DiazModulus.laurent_hull_config_iff

A $p\times q$ \emph{configuration over $K$} in a $K$-space $V\subseteq\C$ is a pair of families $x_1,\dots,x_p$ and $y_1,\dots,y_q$, each linearly independent over $K$, with every product $x_iy_j$ in $V$.

Let $u$ be transcendental over a subfield $K\subseteq\C$ and $S\subseteq\Z$ finite. The $K$-span of the $u^s$, $s\in S$, carries a $p\times q$ configuration ($p,q\ge1$) if and only if $A+B\subseteq S$ for some $|A|=p$, $|B|=q$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). Theorem~\ref{thm:power_hull_strong_six_exp_configuration_iff} is the case $S=\{0,\pm1,\pm k\}$; the nearest printed result is \cite[Lemma 6.1]{Fis01}. Its proof is the valuation method of \cite[\S7]{BSZ17}.

### DiazModulus.power_hull_strong_six_exp_configuration_iff

Let $u\in\C\setminus\Qbar$ and $k\ge1$. There are $x_1,x_2$, linearly independent over $\Qbar$, and $y_1,y_2,y_3$, linearly independent over $\Qbar$, with all six products $x_iy_j$ in $\Qbar u^{-k}+\Qbar u^{-1}+\Qbar+\Qbar u+\Qbar u^{k}$ if and only if $k=2$ or $k=3$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). For $k=2,3$ the configurations are geometric progressions of four elements, which \cite[Théorème 7(2)]{Dia07} excludes from $\widetilde{\mathcal L}$ with Roy's theorem (\cite[Lemma 6.1]{Fis01} excludes them from $\mathcal L$ with the six exponentials theorem); at a candidate they give \cite[Corollaire 5(1) and 5(2)]{Dia07}. The direction ``only for $k=2,3$'' was not found; Diaz remarks that inside that theorem one cannot hope to go very far \cite[p.~390]{Dia07}. It is the case $S=\{0,\pm1,\pm k\}$ of Theorem~\ref{thm:laurent_hull_config_iff}; it concerns a single power $u^{k}$ through its hull, and Proposition~\ref{prop:power_pair_hull_two_by_three_iff} still excludes pairs of higher powers.

### DiazModulus.power_pair_hull_two_by_three_iff

Let $u$ be transcendental over a subfield $K\subseteq\C$ and $4\le k<l$. The span of the $u^s$, $s\in\{0,\pm1,\pm k,\pm l\}$, carries a $2\times3$ configuration if and only if $l\in\{k+1,k+2,2k-1,2k,2k+1,3k\}$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). The exclusions it gives at a candidate are substitutions in \cite{Dia07} (Corollary~\ref{cor:candidate_power_pair_not_both_mem_logAlgTilde}).

### DiazModulus.four_pow_hull_no_two_by_three

Let $u$ be transcendental over a subfield $K\subseteq\C$. The span of the $u^s$, $s\in\{0,\pm1\}\cup\{\pm4^j:j\ge1\}$, carries no $2\times3$ configuration. So at a candidate, Roy's theorem used through Laurent hulls cannot exclude $u^{4^j}\in\widetilde{\mathcal L}$ for all $j$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). Not in \cite{Dia07} (p.~390) nor \cite{Fis01}.

## References named above

- [BSZ17] C.~Bachoc, O.~Serra and G.~Zémor, An analogue of Vosper's theorem for extension fields, \emph{Math. Proc. Cambridge Philos. Soc.} (2017); arXiv:1501.00602.
- [Fis01] S.~Fischler, Orbits under algebraic groups and logarithms of algebraic numbers, \emph{Acta Arith.} 100 (2001), 167--187.
- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
