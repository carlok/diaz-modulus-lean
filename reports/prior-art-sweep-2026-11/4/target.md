# Entry 4: Theorem F, its σ-free form, and Theorem NF

Chapter 14 class: not routine, rank 4.

## The part not found, on its own

Theorem NF and the classification built on it: in a 5-dimensional space W ∋ 1, u, u⁻¹ of rational functions of u, a 2 × 3 configuration (1, h) ⊗ Y with h of degree 2 in u forces one of three types: (D1) three independent t_j in W with every u·t_j in W; (D2a) two-orbit span; (D2b) cyclic span. Then Theorem F: for z rational in u with uū algebraic, W_z carries a configuration exactly when it is 4-dimensional with z ∈ H₀ + Q̄(u − a)⁻¹, aā = uū, or 5-dimensional of those three types. In rank-two-bundle language: the three types of colength-2 modifications of O(1) ⊕ O on ℙ¹; curves on the cubic scroll S(1,2) or cone S(0,3) whose ruling is cut by a g¹₂; one-generic 2 × 3 matrices built from a pair of linear series.

## Printed results named as nearby (these do not count as finds)

[Rei97, Ch. 2] (Grothendieck splitting; the scroll and cone as the two 2 × 3 determinantal shapes); [Wes24, Cor. 1.6.1], [CZ24, Th. 1] (codimension ≤ 2 in a Riemann–Roch space of degree 6, combinatorial genus 2); [BCZ18, Th. 8.1] (normal forms in combinatorial genus 1); [BSZ17, Lemma 4] (Case I); [Dia07, Théorème 7(1), Corollaire 5(4)] (dimension 4).

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff} (Theorem~F), with its $\sigma$-free form Theorem~\ref{thm:rational_space_two_by_three_configuration_iff}, which makes no use of complex conjugation $\sigma$, and its key step Theorem~\ref{thm:degree_two_configuration_normal_form} (Theorem~NF): for $z$ rational in $u$, with $u\bar u$ algebraic, the conjugation hull $\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$ carries a $2\times3$ configuration exactly when it is four-dimensional with $z\in\Qbar+\Qbar u+\Qbar\bar u+\Qbar(u-a)^{-1}$ for some $a$ with $a\bar a=u\bar u$, or five-dimensional and of one of three types: (D1), three free $t_j$ in it with every $ut_j$ in it too, or a two-orbit (D2a) or cyclic (D2b) span. The $\sigma$-free form gives the same answer for every five-dimensional space of rational functions of $u$ containing $1$, $u$ and $u^{-1}$, and Theorem~NF finds the three types for the configurations whose ratio has degree two in $u$, in every five-dimensional space containing $1$, $u$ and $u^{-1}$. Fourth, an editorial rank: a complete classification for every rational $z$, whose key step is proved here by an elementary route not found in the sources (the pole fractions at three values of the pencil, the multiplier complement, the eigen-forms of the multiplication matrix); it stands below Theorem~E because its answer is a list of shapes rather than a test on the coefficients of $z$, the library uses it only in two routine corollaries (Corollaries~\ref{cor:laurent_conj_hull_configuration_shape_iff_class} and~\ref{cor:candidate_rational_conj_hull_criterion_not_mem_logAlgTilde}), and its ``not found'' is the least checked. Its weakest point is that the specialist literature on scrolls and one-generic matrices was not read, Eisenbud and Harris's account of varieties of minimal degree (1987) among it. The textbook account that was read, \cite[Ch.~2]{Rei97}, prints every ingredient of the research notes' ten-line proof with rank-two vector bundles on $\mathbb P^{1}$: the Grothendieck splitting, and the cubic scroll and the cone as the two $2\times3$ determinantal shapes, which separate Case~I from Case~II. It does not contain the three types of Theorem~NF. The function-field analogues of Freiman's $3k-4$ theorem give less: \cite[Cor.~1.6.1]{Wes24} and \cite[Th.~1]{CZ24} apply to the two-orbit and cyclic spaces (combinatorial genus~$2$, checked by exact computation), but give only that such a space has codimension at most~$2$ in a Riemann--Roch space of degree~$6$; and \cite[Th.~8.1]{BCZ18} gives normal forms only one step below, in combinatorial genus~$1$. The only part of Theorem~NF found in print is its Case~I step, \cite[Lemma 4]{BSZ17}: when the six products span four dimensions, they form a progression. The configurations of dimension $4$ are \cite[Théorème 7(1)]{Dia07} at $v=1/(u-a)$, with the exclusion at a candidate in \cite[Corollaire 5(4)]{Dia07}; and for $z$ a polynomial in $u$ and $\bar u$ with a five-dimensional hull, (D1), (D2a) and (D2b) give back the classes of Theorem~E: this is proved (Corollary~\ref{cor:laurent_conj_hull_configuration_shape_iff_class}), with the maps from (P) to (D2a), (Q) to (D2b) and (R) to (D1) of Lemmas~\ref{lem:laurent_polynomial_class_conj_hull_two_orbit_form}, \ref{lem:laurent_involution_class_space_cyclic_form} and~\ref{lem:laurent_real_pencil_class_space_u_multiplier_triple}. That proof goes through Theorem~E, and Theorem~E's explicit criteria do not follow from Theorem~F, so Theorem~E keeps its own entry.

## Statements, copied from the blueprint

### DiazModulus.rational_conj_hull_two_by_three_configuration_iff

Let $u\in\C\setminus\Qbar$. Suppose $u\bar u$ is algebraic, let $z\in\Qbar(u)$, and let $W_z=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$ be its conjugation hull. Then $W_z$ carries a $2\times3$ configuration ($x_0,x_1$ free over $\Qbar$, $y_0,y_1,y_2$ free over $\Qbar$, all six $x_iy_j$ in $W_z$) if and only if $\dim W_z=4$ and $z\in\Qbar+\Qbar u+\Qbar\bar u+\Qbar(u-a)^{-1}$ for some $a\in\Qbar$ with $a\bar a=u\bar u$, or $\dim W_z=5$ and $W_z$ satisfies one of the following:
\begin{enumerate}
\item[(D1)] there are $t_0,t_1,t_2\in W_z$, free over $\Qbar$, with $ut_0,ut_1,ut_2\in W_z$;
\item[(D2a)] the two-orbit form: for some polynomials $P'$, $Q'$, $S_1$, $S_2$ in $\Qbar[X]$, with $P'$ and $Q'$ coprime, $\max(\deg P',\deg Q')=2$ and $\deg S_1,\deg S_2\leq2$, $W_z=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=P'(u)S_2(u)/(uQ'(u))$;
\item[(D2b)] the cyclic form: for some such $P',Q',S_1,S_2$, $W_z=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=Q'(u)\bigl(Q'(u)S_1(u)+P'(u)S_2(u)\bigr)/(uP'(u)^{2})$.
\end{enumerate}
Since $\bar u=(u\bar u)u^{-1}$, the polynomials $z$ in $u$ and $\bar u$ of Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff} (Theorem~E) are among these.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}): the ``only if'' half, the classification. Theorem~F asks the question of Theorem~E (Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}) for every $z$ rational in $u$, and builds on Theorem~B (Theorem~\ref{thm:circle_point_extension_two_by_three_configuration_iff}), which holds for every complex $z$. For $z$ a polynomial in $u$ and $\bar u$ with a five-dimensional hull, its answer gives back the classes (P), (Q) and (R) of Theorem~E (Corollary~\ref{cor:laurent_conj_hull_configuration_shape_iff_class}, with the explicit maps of Lemmas~\ref{lem:laurent_polynomial_class_conj_hull_two_orbit_form}, \ref{lem:laurent_involution_class_space_cyclic_form} and~\ref{lem:laurent_real_pencil_class_space_u_multiplier_triple}); as that proof goes through Theorem~E, the explicit criteria of Corollaries~\ref{cor:laurent_conj_hull_large_exponent_configuration_iff_real_pencil_class} and~\ref{cor:cubic_window_conj_hull_two_by_three_configuration_iff_criterion} still do not follow from Theorem~F. Special cases of the ``if'' half are printed: in dimension $4$ the configuration is \cite[Théorème 7(1)]{Dia07} at $v=1/(u-a)$, with the exclusion at a candidate in \cite[Corollaire 5(4)]{Dia07}; for polynomials of degree $2$ and $3$ in $u$ it is \cite[Théorème 7(1)]{Dia07}; class (Q) of Theorem~E is a substitution in \cite[Théorème 2]{Dia04} and \cite[Théorème 4(1)]{Dia07}. At a candidate, its configurations give exclusions that are substitutions in Roy's strong six exponentials theorem \cite[Corollary 2]{Roy92}; Corollary~\ref{cor:candidate_rational_conj_hull_criterion_not_mem_logAlgTilde} states them.

### DiazModulus.rational_space_two_by_three_configuration_iff

Let $u\in\C\setminus\Qbar$. Let $W\subseteq\C$ be a $\Qbar$-space of dimension $5$ containing $1$, $u$ and $u^{-1}$. Suppose $W\subseteq\Qbar(u)$. Then $W$ carries a $2\times3$ configuration ($x_0,x_1$ free over $\Qbar$, $y_0,y_1,y_2$ free over $\Qbar$, all six $x_iy_j$ in $W$) if and only if it satisfies one of the following:
\begin{enumerate}
\item[(D1)] there are $t_0,t_1,t_2\in W$, free over $\Qbar$, with $ut_0,ut_1,ut_2\in W$;
\item[(D2a)] the two-orbit form: for some polynomials $P'$, $Q'$, $S_1$, $S_2$ in $\Qbar[X]$, with $P'$ and $Q'$ coprime, $\max(\deg P',\deg Q')=2$ and $\deg S_1,\deg S_2\leq2$, $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=P'(u)S_2(u)/(uQ'(u))$;
\item[(D2b)] the cyclic form: for some such $P',Q',S_1,S_2$, $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=Q'(u)\bigl(Q'(u)S_1(u)+P'(u)S_2(u)\bigr)/(uP'(u)^{2})$.
\end{enumerate}
It is the form of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}) that does not use complex conjugation.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}): the ``only if'' half, the classification. The configurations of the ``if'' half give, at a candidate, exclusions that are substitutions in Roy's strong six exponentials theorem \cite[Corollary 2]{Roy92}. Applied to the conjugation hulls of rational $z$, with Lemma~\ref{lem:rational_conj_hull_le_adjoin}, it gives the five-dimensional case of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}).

### DiazModulus.degree_two_configuration_normal_form

Let $u\in\C\setminus\Qbar$. Let $W\subseteq\C$ be a $\Qbar$-space of dimension $5$ containing $1$, $u$ and $u^{-1}$. Let $x_0,x_1\in\C$ be free over $\Qbar$, and $y_0,y_1,y_2\in\C$ too, with all six products $x_iy_j$ in $W$ (a $2\times3$ configuration in $W$). Let $p,q\in\Qbar[X]$ be coprime with $\max(\deg p,\deg q)=2$, and suppose $x_1q(u)=x_0p(u)$, so that the ratio $x_1/x_0$ is $p(u)/q(u)$. Then $W$ satisfies one of the following:
\begin{enumerate}
\item[(D1)] there are $t_0,t_1,t_2\in W$, free over $\Qbar$, with $ut_0,ut_1,ut_2\in W$;
\item[(D2a)] the two-orbit form: for some polynomials $P'$, $Q'$, $S_1$, $S_2$ in $\Qbar[X]$, with $P'$ and $Q'$ coprime, $\max(\deg P',\deg Q')=2$ and $\deg S_1,\deg S_2\leq2$, $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=P'(u)S_2(u)/(uQ'(u))$;
\item[(D2b)] the cyclic form: for some such $P',Q',S_1,S_2$, $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=Q'(u)\bigl(Q'(u)S_1(u)+P'(u)S_2(u)\bigr)/(uP'(u)^{2})$.
\end{enumerate}
$W$ is not assumed to consist of rational functions of $u$; in cases (D2a) and (D2b) the conclusion shows that it does.

Source line: \textbf{Not found in the sources read, and not routine} (Chapter~\ref{chap:14-not-found-in-the-sources}). The statement is Theorem~2 of the mission's research notes (round R12), with the normal forms of its Q1.3, which become (D2a) and (D2b) after a change of coordinate, proved there with rank-two vector bundles on $\mathbb P^{1}$; the proof here is elementary. The step from a configuration spanning four dimensions to a progression is \cite[Lemma 4]{BSZ17}. Of the sources on scrolls and on vector bundles on $\mathbb P^{1}$, only the textbook account \cite[Ch.~2]{Rei97} was read; it prints the ingredients of the bundle proof but not the three types (Chapter~\ref{chap:14-not-found-in-the-sources}).

### DiazModulus.laurent_conj_hull_configuration_shape_iff_class

Let $u\in\C\setminus\Qbar$. Let $s\in\Qbar$ with $s^{2}=u\bar u$, and put $v=u/s$. Let $k\geq0$, let $c_j\in\Qbar$ for $j\in\Z$, and put $z=\sum_{j=-k}^{k}c_jv^{j}$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$. Suppose $\dim W=5$. Then $W$ has one of the shapes of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}),
\begin{enumerate}
\item[(D1)] there are $t_0,t_1,t_2\in W$, free over $\Qbar$, with $ut_0,ut_1,ut_2\in W$;
\item[(D2a)] the two-orbit form: for some polynomials $P'$, $Q'$, $S_1$, $S_2$ in $\Qbar[X]$, with $P'$ and $Q'$ coprime, $\max(\deg P',\deg Q')=2$ and $\deg S_1,\deg S_2\leq2$, $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=P'(u)S_2(u)/(uQ'(u))$;
\item[(D2b)] the cyclic form: for some such $P',Q',S_1,S_2$, $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=Q'(u)\bigl(Q'(u)S_1(u)+P'(u)S_2(u)\bigr)/(uP'(u)^{2})$.
\end{enumerate}
if and only if it is in one of the classes of Theorem~E (Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}),
\begin{enumerate}
\item[(P)] $\alpha u^{2}+\beta u^{3}\in W$ for some $\alpha,\beta\in\Qbar$, not both zero;
\item[(Q)] $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar(\bar v^{2}+ev^{2})+\Qbar(\beta\bar v^{3}+\zeta v^{2}+ev^{3})$ for some $e,\beta,\zeta\in\Qbar$ with $e\bar e=\beta\bar\beta=1$ and $\zeta=-\beta e^{2}\bar\zeta$;
\item[(R)] $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar g+\Qbar\bar g$ with $g=G(v)+\kappa\,\overline{vG(v)}$, for some $\kappa\in\Qbar$ with $\kappa\bar\kappa=1$ and some $G\in\Qbar[X]$ with $G(0)=0$ and $\deg G\geq2$.
\end{enumerate}
Both theorems say when $W$ carries a $2\times3$ configuration; for Laurent $z$ their criteria agree. The explicit maps are Lemmas~\ref{lem:laurent_polynomial_class_conj_hull_two_orbit_form}, \ref{lem:laurent_involution_class_space_cyclic_form} and~\ref{lem:laurent_real_pencil_class_space_u_multiplier_triple}: (P) to (D2a), (Q) to (D2b), and (R) to (D1).

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). A corollary of two equivalences, Theorem~E (Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}) and Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}), which both say when the hull carries a $2\times3$ configuration; Theorem~F asks Theorem~E's question for every $z$ rational in $u$. That their criteria agree on Laurent hulls was earlier checked by exact computation only; here it is proved. The proof goes through Theorem~E: it does not derive Theorem~E from Theorem~F, and the explicit criteria of Corollaries~\ref{cor:laurent_conj_hull_large_exponent_configuration_iff_real_pencil_class} and~\ref{cor:cubic_window_conj_hull_two_by_three_configuration_iff_criterion} still do not follow from Theorem~F.

### DiazModulus.candidate_rational_conj_hull_criterion_not_mem_logAlgTilde

Assume Roy's strong six exponentials theorem: there is no $2\times3$ configuration in $\widetilde{\mathcal L}$, the $\Qbar$-span of $1$ and the logarithms of algebraic numbers. Let $u$ be a candidate: $u\neq0$, $|u|$ algebraic and $e^{u}$ algebraic. Let $z\in\Qbar(u)$, the field generated by $\Qbar$ and $u$, and let $W_z=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$ be its conjugation hull. Suppose $W_z$ meets the criterion of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}): $\dim W_z=4$ and $z\in\Qbar+\Qbar u+\Qbar\bar u+\Qbar(u-a)^{-1}$ for some $a\in\Qbar$ with $a\bar a=u\bar u$, or $\dim W_z=5$ and $W_z$ satisfies one of the following:
\begin{enumerate}
\item[(D1)] there are $t_0,t_1,t_2\in W_z$, free over $\Qbar$, with $ut_0,ut_1,ut_2\in W_z$;
\item[(D2a)] the two-orbit form: for some polynomials $P'$, $Q'$, $S_1$, $S_2$ in $\Qbar[X]$, with $P'$ and $Q'$ coprime, $\max(\deg P',\deg Q')=2$ and $\deg S_1,\deg S_2\leq2$, $W_z=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=P'(u)S_2(u)/(uQ'(u))$;
\item[(D2b)] the cyclic form: for some such $P',Q',S_1,S_2$, $W_z=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=Q'(u)\bigl(Q'(u)S_1(u)+P'(u)S_2(u)\bigr)/(uP'(u)^{2})$.
\end{enumerate}
Then $z\notin\widetilde{\mathcal L}$.

Source line: Not found in the sources read as a family; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). Each instance is a substitution in Roy's strong six exponentials theorem \cite[Corollary 2]{Roy92}, in the pattern of Corollary~\ref{cor:candidate_laurent_conj_hull_class_not_mem_logAlgTilde} for the classes of Theorem~E; its content is the ``if'' half of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}). With a configuration in $W_z$ as the hypothesis instead of Theorem~F's criterion, the conclusion holds for every $z\in\C$, and Theorem~F is not needed. Special cases are printed: in dimension $4$ the configuration is \cite[Théorème 7(1)]{Dia07} at $v=1/(u-a)$, with the exclusion in \cite[Corollaire 5(4)]{Dia07}; for polynomials of degree $2$ and $3$ in $u$ it is \cite[Théorème 7(1)]{Dia07}; class (Q) of Theorem~E is a substitution in \cite[Théorème 2]{Dia04} and \cite[Théorème 4(1)]{Dia07}. It concerns candidates, so it is vacuous if Diaz's conjecture holds.

### DiazModulus.laurent_polynomial_class_conj_hull_two_orbit_form

Let $u\in\C\setminus\Qbar$. Let $s\in\Qbar$ with $s^{2}=u\bar u$, and put $v=u/s$. Let $k\geq0$, let $c_j\in\C$ for $j\in\Z$ be arbitrary, and put $z=\sum_{j=-k}^{k}c_jv^{j}$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar z+\Qbar\bar z$. Let $\alpha,\beta\in\Qbar$, not both zero, with $\alpha u^{2}+\beta u^{3}\in W$ (class (P) of Theorem~E, Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}). Then there are $P',Q',S_1,S_2\in\Qbar[X]$ with $P'(u)=u^{2}$, $Q'(u)=1$, $S_1(u)=\bar\beta s^{6}+\bar\alpha s^{4}u$ and $S_2(u)=\alpha u+\beta u^{2}$, such that $P',Q'$ are coprime, $\max(\deg P',\deg Q')=2$, $\deg S_1,\deg S_2\leq2$, and $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2$ with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=P'(u)S_2(u)/(uQ'(u))$. So $W$ has the two-orbit shape (D2a) of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}) for the pencil $(X^{2},1)$, and $W=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar\bar w+\Qbar w$ for $w=\alpha u^{2}+\beta u^{3}$. No dimension is assumed, and the $c_j$ need not be algebraic.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). It writes class (P) of Theorem~E in the coordinates of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}). The configuration of class (P) is printed: \cite[Théorème 7(1)]{Dia07}, already in \cite[Théorème 2]{Dia04}.

### DiazModulus.laurent_involution_class_space_cyclic_form

Let $u\in\C\setminus\Qbar$. Let $s\in\Qbar$ with $s^{2}=u\bar u$, and put $v=u/s$. Let $e,\beta,\zeta\in\Qbar$ with $\beta\neq0$. Then there are $P',Q',S_1,S_2\in\Qbar[X]$ with $P'(u)=su$, $Q'(u)=u^{2}+\beta s^{2}$, $S_1(u)=s/\beta+(e/s)u^{2}$ and $S_2(u)=(\zeta/s)u^{2}$, such that $P',Q'$ are coprime, $\max(\deg P',\deg Q')=2$, $\deg S_1,\deg S_2\leq2$, and
\[\Qbar+\Qbar u+\Qbar\bar u+\Qbar(\bar v^{2}+ev^{2})+\Qbar(\beta\bar v^{3}+\zeta v^{2}+ev^{3})=\Qbar+\Qbar u+\Qbar u^{-1}+\Qbar g_1+\Qbar g_2\]
with $g_1=Q'(u)S_1(u)/(uP'(u))$ and $g_2=Q'(u)\bigl(Q'(u)S_1(u)+P'(u)S_2(u)\bigr)/(uP'(u)^{2})$. The left side is the space of class (Q) of Theorem~E (Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}), which asks in addition $e\bar e=\beta\bar\beta=1$ and $\zeta=-\beta e^{2}\bar\zeta$; the identity needs none of these, and no dimension. So every hull of class (Q) has the cyclic shape (D2b) of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}) for the pencil $(sX,X^{2}+\beta s^{2})$.

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). An identity of spans that writes class (Q) of Theorem~E in the coordinates of Theorem~F. The ratio $Q'(u)/P'(u)=(u+\beta\bar u)/s$ of the pencil is that of the configuration of class (Q), which is printed: the proof of \cite[Théorème 2]{Dia04}, at $x=(1,(u+\beta\bar u)/s)$; also \cite[Théorème 4(1)]{Dia07}.

### DiazModulus.laurent_real_pencil_class_space_u_multiplier_triple

Let $u\in\C\setminus\Qbar$. Let $s\in\Qbar$ with $s^{2}=u\bar u$, and put $v=u/s$. Let $\kappa\in\Qbar$ with $\kappa\bar\kappa=1$ and $G\in\Qbar[X]$ with $\deg G\geq1$, and put $g=G(v)+\kappa\,\overline{vG(v)}$ and $W=\Qbar+\Qbar u+\Qbar\bar u+\Qbar g+\Qbar\bar g$. Then $u^{-1},1,g$ are free over $\Qbar$, and $t=(u^{-1},1,g)$ has $t_j\in W$ and $ut_j\in W$ for $j=0,1,2$. So $W$ has the shape (D1) of Theorem~F (Theorem~\ref{thm:rational_conj_hull_two_by_three_configuration_iff}); class (R) of Theorem~E (Theorem~\ref{thm:laurent_conj_hull_two_by_three_configuration_iff}) asks in addition $G(0)=0$ and $\deg G\geq2$, so every hull of class (R) has shape (D1).

Source line: Not found in the sources read; routine (Chapter~\ref{chap:14-not-found-in-the-sources}). A change of coordinates in Lemma~\ref{lem:laurent_real_pencil_normal_form_carries_two_by_three_configuration}, which gives the configuration of class (R) with the triple $(\bar v,1,g)$. The real pencil spaces are the project's (Proposition~\ref{prop:conj_stable_real_pencil_space_carries_two_by_three_configuration}).

## References named above

- [Rei97] M.~Reid, Chapters on algebraic surfaces, in \emph{Complex Algebraic Geometry}, IAS/Park City Math. Ser.~3, AMS, 1997; arXiv:alg-geom/9602006.
- [Wes24] M.~Wessel, On Freiman's theorem in a function field setting, arXiv:2405.10724, 2024.
- [CZ24] A.~Couvreur and G.~Zémor, Freiman's $3k-4$ theorem for function fields, arXiv:2408.00183, 2024.
- [BCZ18] C.~Bachoc, A.~Couvreur and G.~Zémor, Towards a function field version of Freiman's theorem, \emph{Algebraic Combinatorics} 1 (2018), 501--521; arXiv:1709.00087.
- [BSZ17] C.~Bachoc, O.~Serra and G.~Zémor, An analogue of Vosper's theorem for extension fields, \emph{Math. Proc. Cambridge Philos. Soc.} (2017); arXiv:1501.00602.
- [Dia07] G.~Diaz, Produits et quotients de combinaisons linéaires de logarithmes de nombres algébriques : conjectures et résultats partiels, \emph{J. Théor. Nombres Bordeaux} 19 (2007), 373--391.
- [Dia04] G.~Diaz, Utilisation de la conjugaison complexe dans l'étude de la transcendance de valeurs de la fonction exponentielle usuelle, \emph{J. Théor. Nombres Bordeaux} 16 (2004), 535--553.
- [Roy92] D.~Roy, Matrices whose coefficients are linear forms in logarithms, \emph{J. Number Theory} 41 (1992), 22--47.
