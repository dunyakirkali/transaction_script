pub type Suit {
  Club
  Diamond
  Spade
  Heart
}

pub type Rank {
  Two
  Three
  Four
  Five
  Six
  Seven
  Eight
  Nine
  Ten
  Jack
  Queen
  King
  Ace
}

pub type Card =
  #(Suit, Rank)

pub type Hand =
  List(Card)

pub type Deck =
  List(Card)

pub type Player {
  Player(name: String, hand: Hand)
}

pub type Game {
  Game(deck: Deck, players: List(Player))
}

pub type Deal =
  fn(Deck) -> #(Deck, Card)

pub type PickupCard =
  fn(#(Hand, Card)) -> Hand
