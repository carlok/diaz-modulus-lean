# Entry 18: The dilogarithm at one half

Chapter 14 class: routine.

## The part not found, on its own

Li₂(1/2) is irrational, or e^{iγ/π} is transcendental for every rational γ ≠ 0; and the general form, which is Brownawell's Corollary 5 with rational scaling. Look for the dichotomy, or an equivalent one using (log 2)² and π².

## Printed results named as nearby (these do not count as finds)

[Bro74, Corollary 5], and Euler's formula for Li₂(1/2) in terms of π² and (log 2)².

## Notation

- Q̄ (`\Qbar`) is the field of algebraic numbers. ℒ is the set of logarithms of non-zero algebraic numbers; ℒ̃ = Q̄ + Q̄ℒ.
- A *point of a circle* is u ∈ ℂ, u ≠ 0, with uū algebraic. Then ū = ρ/u with ρ = uū, so conjugation acts on rational functions of u.
- H₀ = Q̄ + Q̄u + Q̄ū.
- A *p × q configuration over K* in a K-space V ⊆ ℂ is x₁,…,x_p and y₁,…,y_q, each family K-linearly independent, with every product x_i y_j in V. So a 2 × 3 configuration says V contains a product of a 2-dimensional and a 3-dimensional subspace, in the sense of all pairwise products lying in V.
- A *candidate* is u ≠ 0 with |u| and e^u algebraic; Diaz's conjecture says there is none. The *conjugation hull* of z is W_z = H₀ + Q̄z + Q̄z̄.
- A space is *invisible to four-dimensional extensions* when it carries a 2 × 3 configuration but no H₀ + Q̄w inside it carries one.

## The entry, as in chapter 14

Corollary~\ref{cor:dilog_half_irrational_or_exp_i_div_pi_transcendental}: $\mathrm{Li}_2(1/2)$ is irrational, or $e^{i\gamma/\pi}$ is transcendental for every rational $\gamma\neq0$; and its general form, Proposition~\ref{prop:recip_pi_log_of_rational_quadratic_relation}, which is Brownawell's Corollary~5 \cite{Bro74} with rational scaling.

## Statements, copied from the blueprint

### DiazModulus.dilog_half_irrational_or_exp_i_div_pi_transcendental

Either $\pi^{2}/12-(\log2)^{2}/2$ is irrational, or $e^{i\gamma/\pi}$ is transcendental for every $\gamma\in\Q$, $\gamma\neq0$.

Source line: By Euler's identity, $\pi^{2}/12-(\log2)^{2}/2=\mathrm{Li}_2(1/2)=\sum_{n\ge1}1/(n^{2}2^{n})$. Its irrationality is listed as unknown in \cite[p.~274]{Wal04} and is still open: \cite{Hat93,RV05,CDT24} cover $\mathrm{Li}_2(1/q)$ only for $q\ge6$ and $q\le-5$. The dichotomy was not found in the sources read.

### DiazModulus.recip_pi_log_of_rational_quadratic_relation

Let $t\neq0$ be real with $e^{t}$ algebraic, and let $a,b,c\in\Q$ with $a\neq0$ and $at^{2}+b\pi^{2}=c$. Then $e^{i\gamma/\pi}$ is transcendental for every $\gamma\in\Q$, $\gamma\neq0$.

Source line: Brownawell's Corollary~5 \cite[p.~23]{Bro74} at $\eta=t/\pi$, followed by rational scaling. The statement for general $a,b$ was not found in the sources read.

## References named above

- [Bro74] W.~D.~Brownawell, The algebraic independence of certain numbers related by the exponential function, \emph{J. Number Theory} 6 (1974), 22--31.
- [Wal04] M.~Waldschmidt, Open Diophantine problems, \emph{Mosc. Math. J.} 4 (2004), 245--305.
- [Hat93] M.~Hata, Rational approximations to the dilogarithm, \emph{Trans. Amer. Math. Soc.} 336 (1993), 363--387.
- [RV05] G.~Rhin and C.~Viola, The permutation group method for the dilogarithm, \emph{Ann. Sc. Norm. Super. Pisa Cl. Sci.} (5) 4 (2005), 389--437.
- [CDT24] F.~Calegari, V.~Dimitrov and Y.~Tang, The linear independence of $1$, $\zeta(2)$, and $L(2,\chi_{-3})$, arXiv:2408.15403, 2024.
