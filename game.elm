module CardGame exposing (..)


type Suit
    = Club
    | Diamond
    | Spade
    | Heart


type Rank
    = Two
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


type alias Card =
    ( Suit, Rank )


type alias Hand =
    List Card


type alias Deck =
    List Card


type alias Player =
    { name : String
    , hand : Hand
    }


type alias Game =
    { deck : Deck
    , players : List Player
    }


type alias Deal =
    Deck -> ( Deck, Card )


type alias PickupCard =
    ( Hand, Card ) -> Hand
