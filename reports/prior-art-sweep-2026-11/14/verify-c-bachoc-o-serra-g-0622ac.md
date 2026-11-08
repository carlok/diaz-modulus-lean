# Entry 14, verification: C. Bachoc, O. Serra, G.

- **Source read:** C. Bachoc, O. Serra, G. Zémor, An analogue of Vosper's theorem for extension fields, arXiv:1501.00602v2 (14 Jan 2017), full PDF from https://arxiv.org/pdf/1501.00602: Theorem 2 (introduction), Theorem 33 (Section 7). Published in Math. Proc. Cambridge Philos. Soc. 163 (2017); journal version not opened.
- **Accessible:** True
- **Statement present:** True
- **Relation:** implies
- **Covers the part not found:** False
- **Printed or translation:** needs a derivation of the verifier
- **Passage:** "Then S and T have bases of the form {g, ga, ...}" (Theorem 33)

**Hypotheses.** Field: the source allows any algebraically closed F and any extension L, so F=Q̄, L=ℂ fits (Th. 2 needs F algebraically closed in L; Th. 33 needs F algebraically closed). Dimension: S, T of dimension 2 and 3 with dim ST=4; this is exactly the case needed, and Th. 2 forces ST=V. Conjugation: absent from the source. It enters only through my step ū=ρ/u, so H₀=⟨1/u,1,u⟩. Genericity: the source needs none. The target's freeness of 1,u,ū,g,ug is used only for w∉H₀ and to write w=αg+βug+h. Scope: Th. 33 is a general structure theorem. It does not mention circle points, H₀, pencils or degree bounds. Numbering is from arXiv v2; the journal version was not checked.

**Explanation.** Both theorems are there; the criterion is not printed. It follows as below, supporting the "routine" class.
V=H₀+Q̄w has dimension 4 and contains ST, so Th. 2 gives ST=V and Th. 33 gives V=G⟨1,a,a²,a³⟩. Since ρ≠0, H₀=⟨1/u,1,u⟩. So 1/(uG),1/G,u/G are p₀,p₁,p₂∈Q̄[a], degree ≤3, p₁²=p₀p₂. Writing u=A/B in lowest terms: p₀=B²e, p₁=ABe, p₂=A²e, so 2max(deg A,deg B)≤3 and u is Möbius in a. Hence V=G′⟨1,u,u²,u³⟩; the same computation gives G′=1/(uL), L≠0, deg L≤1. With w=αg+βug+h, h∈H₀⊂V, we get (α+βu)g∈V, so uRg=N with R=L(α+βu), deg N≤3.
Converse: factor R=LM over Q̄, deg L,M≤1, and set w=Mg. Then H₀+Q̄w=(⟨1,u⟩/(uL))·⟨1,u,u²⟩, and w∉H₀ by freeness.
Pencil: g=f/(s+λu) gives the same space. Reduce g=P₁/Q₁; Q₁|uR, and the minimal R gives max(deg P,deg Q+1)≤2+[Q(0)=0]+[P(−sλ̄)=0], using s≠0.
