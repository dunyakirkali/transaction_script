enum Suit {
    case club
    case diamond
    case spade
    case heart
}

enum Rank {
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

typealias Card = (suit: Suit, rank: Rank)
typealias Hand = [Card]
typealias Deck = [Card]

struct Player {
    let name: String
    var hand: Hand
}

struct Game {
    var deck: Deck
    var players: [Player]
}

typealias Deal = (Deck) -> (remainingDeck: Deck, dealtCard: Card)
typealias PickupCard = ((hand: Hand, card: Card)) -> Hand
