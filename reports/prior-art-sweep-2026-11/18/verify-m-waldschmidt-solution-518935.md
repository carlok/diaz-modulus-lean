# Entry 18, verification: M. Waldschmidt, Solution

- **Source read:** M. Waldschmidt, Solution du huitième problème de Schneider, J. Number Theory 5 (1973), 191-202; page image p. 192 read from local copy (local library) waldschmidt-1973-huitieme-probleme-schneider.pdf. The DOI given is WRONG: Crossref says 10.1016/0022-314X(73)90045-0 is Jutila, On character sums and class numbers, pp. 203-214. Correct: https://doi.org/10.1016/0022-314X(73)90044-9 (Crossref confirmed; matches PDF's PII).
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** True
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "Alors deux des quatre nombres log α, log β, log γ, exp(log α log …

**Hypotheses.** Corollaire 4 implies the target: the source is more general and the target is an instance plus a short step. Field: both use algebraic numbers and Q; the target's a,b,c rational are what make the exponential split. Dimension: the transcendence degree >=2 conclusion is exactly what is needed. Conjugation and genericity: Cor. 4 assumes neither; the target's "t real" is used only to get log alpha, log gamma Q-independent (t/(i pi) is non-real). Logarithm branch: gamma=-1, log gamma=i pi, the same choice as the printed remark (gamma=e^{i pi}). The case c=0: the exponential is algebraic unconditionally, so Cor. 4 shows no such t exists and the target holds vacuously.

**Explanation.** Location correct, DOI wrong (see source_read). Neither the dichotomy nor the (log 2)^2, pi^2 relation is printed. The remark treats only e^{i pi^r}, e^{i pi^{2-r}}, but it uses the same choice of gamma.

Derivation. Suppose e^{i g/pi} is algebraic for some rational g != 0. Then e^{i r/pi} is algebraic for all rational r (rational powers). Take alpha = beta = e^t, gamma = -1, log gamma = i pi. Then t/(i pi) is non-real, so the Q-independence holds. From a t^2 + b pi^2 = c:
t^2/(i pi) = -i(c/a)/pi + i pi (b/a).
So A = exp(t^2/(i pi)) = e^{-i(c/a)/pi} e^{i pi b/a} is algebraic. Cor. 4 says two of t, t, i pi, A are algebraically independent; since A is algebraic, t and i pi are. But a t^2 - b (i pi)^2 - c = 0 with a != 0 is a nontrivial relation. Contradiction.

Dichotomy: Li2(1/2) = q rational gives t = log 2, a = -1/2, b = 1/12, c = q. Euler's identity is the target's own. Also directly from the Théorème: x = (t, i pi), y = (t/(i pi), 1).
