# Transaction Script

Inspired by Scott Wlaschin's talk "Reinventing the Transaction Script", this repository demonstrates how this F# code would look like in many other languages:

```fsharp
module CardGame =

	type Suit = Club | Diamond | Spade | Heart

	type Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

	type Card = Suit * Rank

	type Hand = Card list
	type Deck = Card list

	type Player = {Name:string, Hand:Hand}
	type Game = {Deck:Deck, Players: Player list}

	type Deal = Deck -> (Deck * Card)

	type PickupCard = (Hand * Card) -> Hand
```

## Languages

- BQN
- C#
- Elm
- Erlang
- Elixir
- F#
- Gleam
- Go
- C
- C++
- CUE
- Dhall
- Haskell
- Java
- JavaScript
- JSON Schema
- Kotlin
- OCaml
- Perl
- Pkl
- Protocol Buffers
- Python
- Ruby
- Roc
- Rust
- Swift
- TypeScript
- Zig

## Comparing implementations

These implementations serve different purposes:

- **Programming languages** model application-local data and behavior.
- **Configuration and schema languages** model authoring and validation.
- **Interface definition languages** model cross-language contracts.

Compare implementations within their purpose before comparing them across categories. The goal is a fitness profile, not a single universal winner.

### Evaluation dimensions

| Dimension | What to measure | Weight |
|---|---|---:|
| Readability and beauty | Semantic clarity, visual noise, and consistency | 15% |
| Model fidelity | Support for sums, products, aliases, records, and functions | 15% |
| Safety | Which invalid states are rejected, and when | 15% |
| Authoring experience | Setup, syntax, and iteration speed | 10% |
| Diagnostics | Error clarity and location | 5% |
| Interoperability | Code generation, standard formats, and supported languages | 20% |
| Evolution | Ease and safety of changing the model | 10% |
| Tooling | Formatter, validator, LSP, and documentation | 5% |
| Runtime and dependencies | Runtime requirements and deployment complexity | 5% |

Score each dimension from 1 to 5 and attach evidence:

- **1:** Unsupported or seriously awkward.
- **2:** Possible with substantial compromises.
- **3:** Works with ordinary caveats.
- **4:** Natural and well supported.
- **5:** First-class and unusually strong.

Use **N/A** rather than zero when a capability is outside the technology's purpose. For example, JSON Schema should not lose points because it cannot execute `Deal`.

### Standard comparison tasks

Give every implementation the same tasks:

1. Define the original card-game model.
2. Create a valid `Game`.
3. Reject an invalid suit.
4. Reject a player without a hand.
5. Represent the `Deal` and `PickupCard` contracts.
6. Serialize a game to JSON or another standard wire format.
7. Consume the result from TypeScript, Python, and Go.
8. Evolve the model:
   - Add a `Joker` card with no suit.
   - Require a non-empty deck.
   - Prevent duplicate cards.
   - Add an optional player identifier.
   - Rename a field without breaking existing consumers.

The evolution tasks reveal differences that the initial model is too simple to expose.

### Assessing readability and beauty

Review each implementation using explicit criteria:

- How much syntax expresses the domain rather than ceremony?
- Can a reader understand it without knowing the language?
- Are domain concepts named and grouped clearly?
- Does it resemble the original model?
- How many comments are needed to explain it?
- Is formatting deterministic?

Have multiple people score readability independently and use the median. Lines of code, declaration count, and wrapper count are useful supporting evidence, but fewer lines are not automatically better.

### Assessing ease of use

Record measurable evidence from a clean environment:

- Installation steps.
- Time to first successful validation.
- Commands required.
- Time to add or change a field.
- Editor feedback.
- Error-message quality.
- Formatter availability.
- External package requirements.

### Assessing interoperability

Evaluate every approach against the same target languages:

- Is code generation official and deterministic?
- Are unions, required fields, and optional fields represented faithfully?
- Is a runtime dependency required?
- Can consumers safely ignore new fields?
- Is the wire format standardized?
- Are generated APIs idiomatic?

The number of supported languages matters less than the fidelity and usability of the generated output in the chosen targets.

### Recording results

Keep two forms of output:

1. **Raw evidence:** commands, timings, errors, generated code, and evolution diffs.
2. **Summary matrix:** scores and short observations.

The following provisional baseline covers the F# source and the recently added cross-language models. Replace these estimates and add the remaining languages after running the standard tasks above.

| Implementation | Readability | Fidelity | Safety | Authoring | Diagnostics | Interop | Evolution | Tooling | Runtime | Weighted total | Key observation |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| F# | 5 | 5 | 5 | 4 | 4 | 3 | 4 | 4 | 3 | 4.20 | Direct algebraic model with native function types |
| JSON Schema | 3 | 3 | 4 | 3 | 3 | 5 | 3 | 5 | 4 | 3.70 | Broad data interoperability, but no behavior |
| Pkl | 4 | 4 | 4 | 4 | 4 | 3 | 4 | 3 | 3 | 3.70 | Readable typed configuration and authoring |
| CUE | 4 | 3 | 5 | 3 | 4 | 4 | 5 | 4 | 4 | 4.00 | Strong constraints and composition, but no functions |
| Protocol Buffers | 3 | 3 | 3 | 4 | 4 | 5 | 5 | 5 | 3 | 3.85 | Excellent code generation and schema evolution |
| Dhall | 4 | 5 | 5 | 3 | 4 | 2 | 4 | 3 | 3 | 3.70 | Strong type fidelity with a smaller ecosystem |
| Zig | 4 | 4 | 4 | 3 | 4 | 2 | 3 | 4 | 5 | 3.45 | Explicit application model with limited contract tooling |

Calculate totals using only applicable dimensions: divide the weighted score by the sum of the applicable weights.

Report winners by use case instead of only by total score:

- Best application-local domain model.
- Best human-authored configuration.
- Best cross-language contract.
- Best validation language.
- Best schema-evolution story.
- Most readable implementation.
