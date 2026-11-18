[← README](../README.md)

## Why formalize this rather than the analytic obstructions

Because this is where the error was. An earlier draft described the
involution as a `Q̄`-algebra involution, which asserts that it fixes every
algebraic number. It does not — it conjugates them — and the closure
theorem does not survive that reading. `conj_not_linear_hull` is that
error stated as a refuted proposition.

The analytic obstructions need real analysis, their formalization cost is
high, and their risk is low.

## How the model is realised

Rather than building `K(T)` with `σ T = ρ / T`, the same configuration is
realised inside `ℂ`: take `t` transcendental over `K` on the circle
`z · conj z = ρ`. Then `conj t = ρ / t` on the nose, so complex
conjugation *is* the involution and none has to be constructed. This also
sidesteps a real awkwardness — `σ` is semilinear, so Mathlib's
`liftAlgHom` does not apply to it.

