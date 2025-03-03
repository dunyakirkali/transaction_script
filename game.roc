# Define the Suit and Rank types
type Suit = Club | Diamond | Spade | Heart
type Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

# Define a Card type as a record with a Suit and Rank
type Card = { suit: Suit, rank: Rank }

# Define a Player record with a name and hand
type Player = { name: String, hand: List Card }

# Define a Game record with a deck of cards and a list of players
type Game = { deck: List Card, players: List Player }

# Generate a full deck of cards
fullDeck : List Card
fullDeck =
  let
    suits = [Club, Diamond, Spade, Heart]
    ranks = [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
  in
    List.concatMap (\suit -> List.map (\rank -> { suit = suit, rank = rank }) ranks) suits

# Shuffle the deck (simple shuffle for demonstration)
shuffleDeck : List Card -> List Card
shuffleDeck deck =
  List.reverse deck  // For demo purposes, we simply reverse the deck

# Deal a card from the deck (returns the card and the remaining deck)
deal : List Card -> (Maybe Card, List Card)
deal deck =
  case deck of
    [] -> (Nothing, [])
    card :: rest -> (Just card, rest)

# Pickup a card into a players hand
pickupCard : List Card -> Card -> List Card
pickupCard hand card =
  card :: hand

# Initialize the game with two players and a shuffled deck
init : Game
init =
  let
    shuffledDeck = shuffleDeck fullDeck
    player1 = { name = "Alice", hand = [] }
    player2 = { name = "Bob", hand = [] }
  in
    { deck = shuffledDeck, players = [player1, player2] }

# Deal a card to each player
playRound : Game -> Game
playRound game =
  case game.deck of
    [] -> game  // No cards left to deal
    _ ->
      let
        (card1, deckAfterCard1) = deal game.deck
        (card2, deckAfterCard2) = deal deckAfterCard1
        updatedPlayer1 = case card1 of
          Just card -> { name = "Alice", hand = pickupCard game.players[0].hand card }
          Nothing -> game.players[0]
        updatedPlayer2 = case card2 of
          Just card -> { name = "Bob", hand = pickupCard game.players[1].hand card }
          Nothing -> game.players[1]
        updatedPlayers = [updatedPlayer1, updatedPlayer2]
      in
        { game | deck = deckAfterCard2, players = updatedPlayers }

# Display the game state (players' hands)
showGameState : Game -> String
showGameState game =
  List.map (\player -> player.name ++ " has: " ++ showHand player.hand) game.players |> String.join "\n"

# Show a player's hand as a string
showHand : List Card -> String
showHand hand =
  List.map (\card -> showCard card) hand |> String.join ", "

# Show a card as a string
showCard : Card -> String
showCard card =
  (case card.rank of
    Two -> "Two"
    Three -> "Three"
    Four -> "Four"
    Five -> "Five"
    Six -> "Six"
    Seven -> "Seven"
    Eight -> "Eight"
    Nine -> "Nine"
    Ten -> "Ten"
    Jack -> "Jack"
    Queen -> "Queen"
    King -> "King"
    Ace -> "Ace")
  ++ " of "
  ++ (case card.suit of
    Club -> "Club"
    Diamond -> "Diamond"
    Spade -> "Spade"
    Heart -> "Heart")

# Example of running the game
main : String
main =
  let
    game = init
    updatedGame = playRound game
  in
    showGameState updatedGame
