namespace CardGame;

public enum Suit
{
    Club,
    Diamond,
    Spade,
    Heart
}

public enum Rank
{
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Ten,
    Jack,
    Queen,
    King,
    Ace
}

public record Card(Suit Suit, Rank Rank);

public record Player(string Name, List<Card> Hand);

public record Game(List<Card> Deck, List<Player> Players);

// Function delegates
public delegate (List<Card> RemainingDeck, Card DealtCard) Deal(List<Card> deck);
public delegate List<Card> PickupCard((List<Card> Hand, Card Card) input);
