interface CardGame
    exposes [
        Suit,
        Rank,
        Card,
        Hand,
        Deck,
        Player,
        Game,
        Deal,
        PickupCard,
    ]

# Custom types for card elements
Suit : [Club, Diamond, Spade, Heart]

Rank : [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]

# Type aliases for game components
Card : (Suit, Rank)

Hand : List Card

Deck : List Card

Player : {
    name : Str,
    hand : Hand,
}

Game : {
    deck : Deck,
    players : List Player,
}

# Function type definitions
Deal : Deck -> (Deck, Card)

PickupCard : (Hand, Card) -> Hand
