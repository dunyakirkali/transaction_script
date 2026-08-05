import "@typespec/http";
import "@typespec/openapi3";

using TypeSpec.Http;

@service(#{ title: "Card Game" })
namespace CardGame;

enum Suit {
  Club,
  Diamond,
  Spade,
  Heart,
}

enum Rank {
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Nine,
  Ten,
  Jack,
  Queen,
  King,
  Ace,
}

model Card {
  suit: Suit;
  rank: Rank;
}

alias Hand = Card[];
alias Deck = Card[];

model Player {
  name: string;
  hand: Hand;
}

model Game {
  deck: Deck;
  players: Player[];
}

model DealRequest {
  deck: Deck;
}

model DealResponse {
  deck: Deck;
  card: Card;
}

model PickupCardRequest {
  hand: Hand;
  card: Card;
}

model PickupCardResponse {
  hand: Hand;
}

@route("/deal")
@post
op deal(@body request: DealRequest): DealResponse;

@route("/pickup-card")
@post
op pickupCard(@body request: PickupCardRequest): PickupCardResponse;
