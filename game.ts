enum Suit {
  Club = "Club",
  Diamond = "Diamond",
  Spade = "Spade",
  Heart = "Heart"
}

enum Rank {
  Two = "Two",
  Three = "Three",
  Four = "Four",
  Five = "Five",
  Six = "Six",
  Seven = "Seven",
  Eight = "Eight",
  Nine = "Nine",
  Ten = "Ten",
  Jack = "Jack",
  Queen = "Queen",
  King = "King",
  Ace = "Ace"
}

type Card = [Suit, Rank];
type Hand = Card[];
type Deck = Card[];

interface Player {
  name: string;
  hand: Hand;
}

interface Game {
  deck: Deck;
  players: Player[];
}

type Deal = (deck: Deck) => [Deck, Card];
type PickupCard = (hand: Hand, card: Card) => Hand;
