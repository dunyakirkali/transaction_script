package cardgame

type Suit int

const (
    Club Suit = iota
    Diamond
    Spade
    Heart
)

type Rank int

const (
    Two Rank = iota
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
)

type Card struct {
    Suit Suit
    Rank Rank
}

type Hand []Card
type Deck []Card

type Player struct {
    Name string
    Hand Hand
}

type Game struct {
    Deck    Deck
    Players []Player
}

type Deal func(Deck) (Deck, Card)
type PickupCard func(Hand, Card) Hand
