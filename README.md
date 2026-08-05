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
- TypeSpec
- TypeScript
- Zig

## Comparisons

The repository has two deliberately separate comparisons. Combining them in one score would unfairly compare application languages with schema and configuration technologies built for different jobs.

### 1. Programming languages

[Compare the programming-language implementations](docs/programming-languages.md) as application-local domain models. This includes F#, Rust, TypeScript, Go, Elm, and the other executable language implementations.

The comparison emphasizes readability, type-model fidelity, safety, authoring experience, diagnostics, tooling, and runtime simplicity.

### 2. Portable models and schemas

[Compare CUE, Dhall, JSON Schema, Pkl, Protocol Buffers, and TypeSpec](docs/portable-models.md) by:

- cleanliness of the card-game model;
- validation and type fidelity;
- official language bindings and typed code generation;
- standard output formats and ecosystem reach;
- schema evolution.

This comparison distinguishes typed code generation from runtime bindings, standard data exchange, and community tooling.
