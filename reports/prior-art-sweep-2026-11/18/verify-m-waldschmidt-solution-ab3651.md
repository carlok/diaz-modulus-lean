# Entry 18, verification: M. Waldschmidt, Solution

- **Source read:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191-202. Read from the local copy, sources/waldschmidt-1973-huitieme-probleme-schneider.pdf, p. 192 as image. The given DOI ...90043-0 returns 404; Crossref gives the correct one, https://doi.org/10.1016/0022-314X(73)90044-9. ScienceDirect returned 403.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** Alors deux des quatre nombres log α, log β, log γ, exp(log α log β/log γ)

**Hypotheses.** Field: both over Q-bar in C, matching. Dimension: Theorem is 2x2; e^{x1y2}, e^{x2y2} algebraic (checked on the page image; OCR garbles it). Conjugation: none in the source; the target's t real is used only for Q-independence of t and iπ. Genericity: Cor. 4 needs only log α, log γ and log β, log γ Q-independent, and allows α=β. Both hold here. Mismatch: the source never mentions t, quadratic relations, Li2 or log 2.

**Explanation.** Cor. 4 is at the cited place. The target is not printed; I supplied this derivation.

Let t≠0 be real, e^t algebraic, at²+bπ²=c, a≠0, a,b,c rational. Suppose e^{iγ/π} is algebraic for some rational γ≠0.

Take α=β=e^t and the third number −1, with log = iπ. Since t is real and nonzero, t and iπ are Q-independent.

t²/(iπ) = −i(c/a)/π + i(b/a)π. So exp(t²/(iπ)) is a rational power of e^{iγ/π} times a root of unity, hence algebraic.

Cor. 4 then makes two of t, t, iπ, algebraic number algebraically independent. But aT²+bP²−c≠0 vanishes at (t,π), so trdeg Q(t,π)≤1. Contradiction.

Dichotomy: if π²/12−(log 2)²/2=q is rational, use t=log 2, a=1/2, b=−1/12, c=−q.

Directly from the Theorem: x=(t,iπ), y=(t/(iπ),1).

Nearest print: the remark after Cor. 4 also uses γ=e^{iπ}, for e^{π^r}, e^{π^{2−r}}. It is not the target. Bro74 was not read.
