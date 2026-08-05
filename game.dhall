let Suit = < Club | Diamond | Spade | Heart >

let Rank =
      < Two
      | Three
      | Four
      | Five
      | Six
      | Seven
      | Eight
      | Nine
      | Ten
      | Jack
      | Queen
      | King
      | Ace
      >

let Card = { suit : Suit, rank : Rank }

let Hand = List Card

let Deck = List Card

let Player = { name : Text, hand : Hand }

let Game = { deck : Deck, players : List Player }

let Deal = Deck → { deck : Deck, card : Card }

let PickupCard = { hand : Hand, card : Card } → Hand

in  { Suit = Suit
    , Rank = Rank
    , Card = Card
    , Hand = Hand
    , Deck = Deck
    , Player = Player
    , Game = Game
    , Deal = Deal
    , PickupCard = PickupCard
    }
