import Foundation

enum Suit {
    case club, diamond, spade, heart
}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
}

struct Card {
    let suit: Suit
    let rank: Rank
}

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

func deal(deck: inout Deck) -> (Deck, Card)? {
    guard let card = deck.popLast() else { return nil }
    return (deck, card)
}

func pickupCard(hand: inout Hand, card: Card) {
    hand.append(card)
}
