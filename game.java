import java.util.List;

enum Suit { CLUB, DIAMOND, SPADE, HEART }
enum Rank { TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE }

record Card(Suit suit, Rank rank) {}

type Hand = List<Card>;
type Deck = List<Card>;

record Player(String name, List<Card> hand) {}
record Game(List<Card> deck, List<Player> players) {}

@FunctionalInterface
interface Deal {
    Pair<List<Card>, Card> apply(List<Card> deck);
}

@FunctionalInterface
interface PickupCard {
    List<Card> apply(List<Card> hand, Card card);
}
