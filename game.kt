enum class Suit { CLUB, DIAMOND, SPADE, HEART }
enum class Rank { TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE }

typealias Card = Pair<Suit, Rank>
typealias Hand = List<Card>
typealias Deck = List<Card>

data class Player(val name: String, val hand: Hand)
data class Game(val deck: Deck, val players: List<Player>)

typealias Deal = (Deck) -> Pair<Deck, Card>
typealias PickupCard = (Hand, Card) -> Hand
