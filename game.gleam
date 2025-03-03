// Define suits and ranks as enums
type Suit = Club | Diamond | Spade | Heart
type Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

// Type aliases for cards, hands, and deck
type Card = { suit: Suit, rank: Rank }
type Hand = List(Card)
type Deck = List(Card)

// Define Player and Game records
type Player = { name: String, hand: Hand }
type Game = { deck: Deck, players: List(Player) }

// Function to create a full deck
fn full_deck() -> Deck {
  let suits = [Club, Diamond, Spade, Heart]
  let ranks = [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
  List.concat_map(suits, fn(suit) {
    List.map(ranks, fn(rank) {
      { suit: suit, rank: rank }
    })
  })
}

// Function to shuffle the deck (simple shuffle for demonstration)
fn shuffle_deck(deck: Deck) -> Deck {
  List.reverse(deck) // Just reverse for simplicity, replace with actual shuffle in practice
}

// Function to deal a card (returns the card and the new deck)
fn deal(deck: Deck) -> { card: Card, new_deck: Deck } {
  case deck {
    [] -> { card: { suit: Club, rank: Two }, new_deck: [] } // Return a default card if the deck is empty
    [card | rest] -> { card: card, new_deck: rest }
  }
}

// Function to pick up a card into a player's hand
fn pickup_card(hand: Hand, card: Card) -> Hand {
  [card | hand]
}

// Example usage
fn main() {
  let deck = full_deck() |> shuffle_deck
  let player1 = { name: "Alice", hand: [] }
  let player2 = { name: "Bob", hand: [] }
  let game = { deck: deck, players: [player1, player2] }

  // Deal a card to player1
  let { card, new_deck } = deal(game.deck)
  let updated_player1 = { player1 | hand = pickup_card(player1.hand, card) }
  let updated_game = { game | deck = new_deck, players = [updated_player1, player2] }

  // Print out the hand of player1
  io.println(updated_player1.name <> " has: " <> show(updated_player1.hand))
}
