# Portable model and schema comparison

This comparison answers two separate questions:

1. **How cleanly does the technology express the card-game model?**
2. **How effectively can that model be consumed from multiple programming languages?**

The candidates are CUE, Dhall, JSON Schema, Pkl, and Protocol Buffers. Unlike the [programming-language comparison](programming-languages.md), interoperability is central here.

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
| Pkl | 28 | 5 | Low | Native function type aliases | Primarily a configuration language, not a wire protocol |
| CUE | 30 | 4 | Low | Input/output shapes only | Cannot model executable functions |
| Dhall | 42 | 5 | Low | Native function types | Limited mainstream language integration |
| Protocol Buffers | 74 | 3 | High | RPC request/response messages and services | Wrappers, numeric tags, and unspecified enum values add ceremony |
| JSON Schema | 92 | 3 | High | Input/output schemas only | Verbose and behavior-free |

Source lines are only supporting evidence: fewer lines do not automatically mean a better model. The Pkl and Dhall files most closely resemble the original F# type model. Protobuf is more verbose because it describes a durable wire contract rather than application-local aliases.

## Language reach

| Technology | Official typed targets or host bindings | Standard outputs / interchange | Reach assessment |
|---|---|---|---|
| Pkl | Go, Java, Kotlin, Swift bindings and typed code generators | JSON, JSONnet, YAML, XML, plist, properties, and custom text output | Strong official typed integration for four ecosystems; broad untyped reach through standard output formats |
| Protocol Buffers | C++, C#, Dart, Go, Java, Kotlin, Objective-C, PHP, Python, and Ruby code generation; other languages use third-party implementations | Stable protobuf binary and JSON mapping | Strongest official multi-language contract and code-generation story |
| JSON Schema | No single official code generator; the official tools catalog lists validators and generators across many ecosystems | JSON | Broadest validation reach, but type generation quality is ecosystem-dependent |
| CUE | Official Go API; other languages generally consume exported data | JSON, YAML, TOML, JSON Schema, OpenAPI, and Protocol Buffers integration | Excellent validation and format bridge; limited native host-language integration |
| Dhall | Reference implementation plus community implementations and bindings | JSON and YAML are the common interoperability path | Portable configuration with weaker typed integration into mainstream application languages |

Language support changes over time. Recheck the linked official compatibility pages before using this table for a technology decision.

## Capability matrix

Scores run from 1 (poor) to 5 (excellent).

| Technology | Clean model | Type fidelity | Validation | Typed language support | Standard-format reach | Evolution | Best fit |
|---|---:|---:|---:|---:|---:|---:|---|
| Pkl | 5 | 4 | 5 | 4 | 5 | 4 | Typed, programmable configuration shared with Go/JVM/Swift applications |
| Protocol Buffers | 3 | 4 | 3 | 5 | 4 | 5 | Durable cross-language APIs and messages |
| JSON Schema | 3 | 3 | 5 | 2 | 5 | Validating JSON at system boundaries |
| CUE | 4 | 4 | 5 | 2 | 5 | Constraint-based configuration, validation, and schema unification |
| Dhall | 5 | 5 | 5 | 2 | 4 | Typed, deterministic configuration where JSON/YAML output is sufficient |

## Practical conclusions

- **Cleanest representation:** Pkl and Dhall.
- **Best official target-language coverage:** Protocol Buffers.
- **Best JSON validation ecosystem:** JSON Schema.
- **Best constraints and schema composition:** CUE.
- **Best balance of clean authoring and typed application integration:** Pkl, when Go, Java, Kotlin, or Swift cover the consumers.
- **Best choice when consumers span many languages:** Protocol Buffers for generated APIs; JSON Schema when JSON validation matters more than generated types.

## Standard comparison tasks

Each technology should be tested with the same evidence:

1. Validate a correct and an incorrect `Game`.
2. Generate or consume the model from TypeScript, Python, and Go.
3. Serialize and deserialize a game.
4. Add a `Joker` card with no suit.
5. Require a non-empty deck and prevent duplicate cards.
6. Add an optional player identifier.
7. Rename a field while preserving old consumers.
8. Record commands, generated code, runtime dependencies, errors, and evolution diffs.

## Official references

- [Pkl documentation](https://pkl-lang.org/main/current/index.html), including its [Java](https://pkl-lang.org/main/current/java-binding/index.html), [Kotlin](https://pkl-lang.org/main/current/kotlin-binding/index.html), [Go](https://pkl-lang.org/go/current/index.html), and [Swift](https://pkl-lang.org/swift/current/index.html) integrations.
- [Protocol Buffers language reference](https://protobuf.dev/reference/).
- [JSON Schema tools directory](https://json-schema.org/tools/).
- [CUE interoperation documentation](https://cuelang.org/docs/concept/how-cue-works-with-go/).
- [Dhall documentation](https://docs.dhall-lang.org/).
