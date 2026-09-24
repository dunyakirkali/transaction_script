# Portable model and schema comparison

This comparison answers two separate questions:

1. **How cleanly does the technology express the card-game model?**
2. **How effectively can that model be consumed from multiple programming languages?**

The candidates are CUE, Dhall, JSON Schema, Pkl, Protocol Buffers, and TypeSpec. Unlike the [programming-language comparison](programming-languages.md), interoperability is central here.

The concrete target is now **TypeScript in the frontend, with Elixir, Rust, and Go backends**. A useful solution must keep the source model close to F# while producing usable contracts for all four ecosystems.

## Important distinction

“Supports a language” can mean different things:

- **Typed code generation:** generates native types for a target language.
- **Runtime binding:** evaluates or validates the model from a host language.
- **Standard data exchange:** emits JSON, YAML, or another format that many languages can read.
- **Community tooling:** third-party validators or generators, with varying fidelity and maintenance.

These are not equivalent. A JSON parser does not provide the same guarantees as generated native types.

## Cleanliness of this model

| Technology | Source lines | Model clarity | Ceremony | Functions/contracts | Main compromise |
|---|---:|---:|---:|---|---|
| Pkl | 28 | 5 | Low | Native function type aliases | No official TypeScript, Elixir, or Rust generator |
| CUE | 30 | 4 | Low | Input/output shapes only | Cannot model executable functions or generate all target types directly |
| Dhall | 42 | 5 | Low | Native function types | Limited mainstream language integration |
| TypeSpec | 74 | 5 | Medium | HTTP operations and request/response models | Native types require a second code-generation step from OpenAPI |
| Protocol Buffers | 74 | 3 | High | RPC request/response messages and services | Wrappers, numeric tags, and unspecified enum values add ceremony |
| JSON Schema | 92 | 3 | High | Input/output schemas only | Verbose, behavior-free, and dependent on community generators |

Source lines are only supporting evidence: fewer lines do not automatically mean a better model. Pkl and Dhall most closely resemble the original F# declarations in isolation. TypeSpec is the cleanest candidate that also describes an API contract and reaches all four target ecosystems through OpenAPI.

## Target-language fit

The table distinguishes direct official support from indirect or community tooling.

| Technology | TypeScript | Elixir | Rust | Go | Verdict for this stack |
|---|---|---|---|---|---|
| TypeSpec → OpenAPI | Strong generators | Client/server generators available | Client/server generators available | Strong generators | **Best authoring fit:** one clean source, with OpenAPI as the portable contract |
| Protocol Buffers | Strong community/Buf generators | Community Protobuf and gRPC libraries | Mature Prost/Tonic ecosystem | Official generator | **Best wire-contract fit:** strongest evolution model, but less F#-like and tooling ownership varies |
| JSON Schema | Strong ecosystem | Validation is stronger than type generation | Validation and generation available | Validation and generation available | Broad reach, but poor source authoring and inconsistent generated APIs |
| Pkl | No official generator | No official generator | No official generator | Official binding and generator | Does not cover this stack |
| CUE | Indirect through exported schemas | Indirect through exported schemas | Indirect through exported schemas | Official API | Excellent validation, but not a direct shared-type solution |
| Dhall | Indirect through JSON/YAML | Indirect through JSON/YAML | Indirect through JSON/YAML | Indirect through JSON/YAML | Clean source model without dependable native type generation |

### TypeSpec pipeline

```text
                ┌─ TypeScript client/types
TypeSpec ──OpenAPI─┼─ Elixir client/server contract
                ├─ Rust client/server contract
                └─ Go client/server contract
```

TypeSpec itself emits the OpenAPI contract. OpenAPI tooling performs the language-specific generation, so generated-code quality must be tested separately for each target.

### Protocol Buffers pipeline

```text
                 ┌─ TypeScript via Protobuf-ES or another generator
Protobuf schema ─┼─ Elixir via community Protobuf/gRPC tooling
                 ├─ Rust via Prost/Tonic
                 └─ Go via the official generator
```

This pipeline offers a stronger binary contract and schema-evolution rules. Its drawback is that the source schema and service wrappers are more ceremonial than F# or TypeSpec.

## Capability matrix

Scores run from 1 (poor) to 5 (excellent).

| Technology | Clean model | Type fidelity | Validation | Target-stack support | Evolution | Best fit |
|---|---:|---:|---:|---:|---:|---|
| TypeSpec | 5 | 5 | 4 | 5 | 4 | F#-like API authoring that emits OpenAPI for all target languages |
| Protocol Buffers | 3 | 4 | 3 | 5 | 5 | Durable cross-language APIs and binary messages |
| JSON Schema | 3 | 3 | 5 | 3 | 3 | Validating JSON at system boundaries |
| Pkl | 5 | 4 | 5 | 1 | 4 | Typed configuration when Go/JVM/Swift cover the consumers |
| CUE | 4 | 4 | 5 | 2 | 5 | Constraint-based configuration, validation, and schema unification |
| Dhall | 5 | 5 | 5 | 1 | 4 | Typed configuration where JSON/YAML output is sufficient |

## Recommendation for TypeScript + Elixir + Rust + Go

1. **Start with TypeSpec and emit OpenAPI 3.** It best matches the desired F#-like authoring experience while retaining access to generators for every target language.
2. **Keep Protocol Buffers as the alternative** when binary transport, gRPC/Connect, strict compatibility checks, or high-throughput services matter more than authoring elegance.
3. **Treat JSON Schema as an emitted validation artifact**, not the preferred hand-authored source.
4. **Remove Pkl, CUE, and Dhall from the final shortlist** for shared native types. They remain useful configuration or validation tools, but do not directly cover this target stack.

The generated-code experiment below shows that TypeSpec is useful for transport clients, but does not replace the concise handwritten domain models.

## Generated TypeSpec experiment

TypeSpec 1.14.0 emitted OpenAPI 3, then OpenAPI Generator 7.24.0 generated models and clients using `typescript-fetch`, `elixir`, `rust`, and `go`. Generated files live under the ignored `generated/` directory.

| Target | Handwritten lines | Generated model lines | Complete generated lines | Check | Main difference |
|---|---:|---:|---:|---|---|
| TypeScript | 39 | 709 | 1,334 | `tsc --noEmit` passes | Runtime serializers and HTTP client replace simple aliases and function types |
| Elixir | 28 | 233 | 909 | `mix compile` passes | Struct modules replace maps and tuples; enum specs describe empty structs although decoding returns strings |
| Rust | 43 | 337 | 780 | `cargo check` passes | Serde models and a Reqwest client replace aliases and function pointers |
| Go | 49 | 1,494 | 3,438 | `go test ./...` passes | Constructors, getters, nullable wrappers, JSON validation, and an HTTP client dominate the output |

All four generators produce `Card`, `Player`, `Game`, `Suit`, `Rank`, four request/response models, and HTTP operations. They do not preserve the original model exactly:

- `Hand` and `Deck` disappear because TypeSpec aliases are expanded in OpenAPI.
- `Card` is an object because `game.tsp` models it as an object, not the original F# tuple.
- `Deal` and `PickupCard` become network client calls rather than local function types.
- Generated enum wire values are strings such as `"Club"`; some handwritten examples use atoms, integers, or uppercase strings.

**Conclusion:** generate these clients when applications need a shared HTTP contract and serialization code. Keep handwritten types when the goal is a small, idiomatic, application-local domain model.

## Standard comparison tasks

Each technology should be tested with the same evidence:

1. Validate a correct and an incorrect `Game`.
2. Generate contracts for TypeScript, Elixir, Rust, and Go.
3. Compare generated type names, enums, optional fields, unions, and runtime dependencies.
4. Serialize and deserialize a game in every target language.
5. Add a `Joker` card with no suit.
6. Require a non-empty deck and prevent duplicate cards.
7. Add an optional player identifier.
8. Rename a field while preserving old consumers.
9. Record commands, generated code, errors, and evolution diffs.

## Official references

- [TypeSpec data types](https://typespec.io/docs/language-basics/built-in-types/) and [OpenAPI emitter](https://typespec.io/docs/emitters/openapi3/cli/).
- [OpenAPI Generator target list](https://openapi-generator.tech/docs/generators/), including TypeScript, Elixir, Rust, and Go generators.
- [Protocol Buffers language reference](https://protobuf.dev/reference/), [Protobuf-ES](https://github.com/bufbuild/protobuf-es), [Elixir Protobuf](https://github.com/elixir-protobuf/protobuf), and [Prost](https://github.com/tokio-rs/prost).
- [Pkl documentation](https://pkl-lang.org/main/current/index.html), including its [Go integration](https://pkl-lang.org/go/current/index.html).
- [JSON Schema tools directory](https://json-schema.org/tools/).
- [CUE interoperation documentation](https://cuelang.org/docs/concept/how-cue-works-with-go/).
- [Dhall documentation](https://docs.dhall-lang.org/).
