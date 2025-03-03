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
