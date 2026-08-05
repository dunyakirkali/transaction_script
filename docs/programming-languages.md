# Programming-language comparison

This comparison answers: **How cleanly can a programming language express the card-game domain model for application-local use?**

It intentionally excludes CUE, Dhall, JSON Schema, Pkl, Protocol Buffers, and TypeSpec. Those technologies are compared separately in [Portable model and schema comparison](portable-models.md).

## Evaluation

Score each dimension from 1 (poor) to 5 (excellent). The current scores are provisional and should be replaced with measured evidence.

| Dimension | Weight | What it measures |
|---|---:|---|
| Readability | 25% | Domain clarity, visual noise, and ceremony |
| Model fidelity | 25% | Sums, products, aliases, records, and function types |
| Safety | 20% | Invalid states rejected by the compiler or runtime |
| Authoring | 10% | Setup, syntax, iteration speed, and dependencies |
| Diagnostics | 10% | Error clarity and source location |
| Tooling | 5% | Formatter, compiler, LSP, and documentation |
| Runtime | 5% | Runtime requirements and deployment simplicity |

## Results

| Language | Readability | Fidelity | Safety | Authoring | Diagnostics | Tooling | Runtime | Total | Observation |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| BQN | 1 | 2 | 1 | 2 | 1 | 1 | 4 | 1.50 | Compact and executable, but untyped and difficult to approach |
| C# | 4 | 4 | 4 | 4 | 5 | 5 | 3 | 4.10 | Records and delegates map cleanly |
| Elm | 5 | 5 | 5 | 4 | 5 | 4 | 4 | 4.80 | Excellent algebraic types and diagnostics |
| Erlang | 3 | 4 | 3 | 4 | 3 | 4 | 3 | 3.40 | Compact specs and tuples with gradual checking |
| Elixir | 4 | 4 | 3 | 5 | 4 | 4 | 3 | 3.85 | Readable model; types are not runtime-enforced |
| F# | 5 | 5 | 5 | 4 | 4 | 4 | 3 | 4.65 | Direct expression of the original algebraic model |
| Gleam | 5 | 5 | 5 | 4 | 5 | 4 | 4 | 4.80 | Clear ML-style model with strong checking |
| Go | 4 | 4 | 4 | 5 | 4 | 5 | 5 | 4.20 | Simple model, although enum values admit invalid integers |
| C | 3 | 3 | 2 | 3 | 2 | 5 | 5 | 2.90 | Portable, but invariants and memory are manual |
| C++ | 3 | 4 | 3 | 2 | 2 | 4 | 5 | 3.20 | Expressive but comparatively complex |
| Haskell | 5 | 5 | 5 | 3 | 4 | 3 | 3 | 4.50 | Near-direct algebraic model and exhaustive checking |
| Java | 4 | 4 | 4 | 4 | 5 | 5 | 3 | 4.10 | Clear records and functional interfaces with some ceremony |
| JavaScript | 3 | 2 | 1 | 5 | 3 | 5 | 4 | 2.70 | Easy to write; contracts remain comments and conventions |
| Kotlin | 5 | 4 | 4 | 4 | 5 | 5 | 3 | 4.35 | Concise JVM model; type aliases remain structural |
| OCaml | 5 | 5 | 5 | 3 | 4 | 3 | 4 | 4.55 | Direct algebraic model with exhaustive checking |
| Perl | 2 | 2 | 2 | 4 | 2 | 2 | 3 | 2.25 | Flexible but dependent on runtime discipline |
| Python | 5 | 4 | 3 | 5 | 4 | 5 | 3 | 4.15 | Highly readable; runtime enforcement is optional |
| Ruby | 4 | 2 | 3 | 5 | 4 | 4 | 3 | 3.35 | Readable runtime model with conventional contracts |
| Roc | 5 | 5 | 5 | 3 | 3 | 2 | 5 | 4.45 | Direct functional model with young tooling |
| Rust | 4 | 5 | 5 | 4 | 5 | 5 | 5 | 4.65 | Strong enums, safety, and mature tooling |
| Swift | 5 | 5 | 5 | 4 | 4 | 4 | 4 | 4.70 | Natural enums, tuples, and function aliases |
| TypeScript | 5 | 5 | 4 | 5 | 5 | 5 | 4 | 4.75 | Excellent structural model; types disappear at runtime |
| Zig | 4 | 4 | 4 | 3 | 4 | 4 | 5 | 3.95 | Explicit model with limited sum-type ergonomics |

The total is the weighted sum of the seven dimensions. It measures application-local modeling, not interoperability.

## Current leaders by use case

- **Most readable:** Elm, F#, Gleam, Haskell, Kotlin, OCaml, Python, Roc, Swift, and TypeScript all score 5; this needs independent reviewer scoring to break the tie.
- **Strongest model fidelity and safety:** Elm, F#, Gleam, Haskell, OCaml, Roc, Rust, and Swift.
- **Best overall provisional scores:** Elm and Gleam (4.80), TypeScript (4.75), and Swift (4.70).
- **Simplest runtime/deployment:** Go, C, C++, Roc, Rust, and Zig.

## Standard test tasks

Apply the same tasks to every language:

1. Define the original card-game model.
2. Create a valid `Game`.
3. Reject an invalid suit.
4. Reject a player without a hand.
5. Represent `Deal` and `PickupCard`.
6. Add a `Joker` card with no suit.
7. Require a non-empty deck.
8. Prevent duplicate cards.
9. Add an optional player identifier.

Record compiler output, commands, dependencies, lines of domain code, and the evolution diff before replacing provisional scores.
