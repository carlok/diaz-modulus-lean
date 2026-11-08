# Entry 5, verification: C. Bachoc, A. Couvreur,

- **Source read:** C. Bachoc, A. Couvreur, G. Zémor, Towards a function field version of Freiman's Theorem, arXiv:1709.00087v2 (17 Jul 2018), full PDF read at https://arxiv.org/pdf/1709.00087, sections 2, 3, 9 and keyword search of the rest. Journal data confirmed by Crossref: Algebraic Combinatorics 1 (2018), no. 4, 501-521, doi 10.5802/alco.19; journal version not opened.
- **Accessible:** True
- **Statement present:** True
- **Relation:** analogue only
- **Covers the part not found:** False
- **Passage:** v(S) + v(S) ⊆ v(S^2)

**Hypotheses.** Field: Prop. 3.1 needs a valuation with residue field K; the standing K algebraically closed assumption comes after it. Target has any subfield K of C; the place u=0 of K(u) has residue field K, so the tool applies, but the paper does not say so for this space. Dimension: paper treats S^2 (Lemma 3.2 symmetric, S=T "for simplicity"), target has p x q with A+B, A and B different; the two-space form is an easy variant, not printed. Target's x_i, y_j lie in C, not K(u); reduction to K(u) by normalising is absent from the paper. Conjugation: none in the paper; none in the target theorem itself (only its candidate consequences). Genericity: target needs u transcendental over K only; no conflict.

**Explanation.** The location is right: Prop. 3.1 (|v(S)| = dim S, filtered basis) and Lemma 3.2 are on p. 4, and the paper calls 3.1 classical. They are the valuation tool behind the "only if" direction, the same method the target already names through [BSZ17, §7], which does not count as a find. Section 2 says the same for K(x) with degrees: dim S^2 ≥ |A+A|. Nothing in the paper states the iff: no span of powers u^s for a given exponent set, no criterion that a configuration exists exactly when S contains a sumset, no p x q configurations, nothing on {0, ±1, ±k}, pairs of powers or u^{4^j}. The paper's aim is the reverse kind of result: spaces with small dim S^2, genus 0 or 1. My own check, not in the source: the target's necessity follows from these two statements in a few lines once normalised into K(u), so the paper supports "routine" as a method claim. It does not cover the part not found.
