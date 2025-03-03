import random

# Define Suit and Rank as enums
class Suit:
    CLUB = 'Club'
    DIAMOND = 'Diamond'
    SPADE = 'Spade'
    HEART = 'Heart'

class Rank:
    TWO = 'Two'
    THREE = 'Three'
    FOUR = 'Four'
    FIVE = 'Five'
    SIX = 'Six'
    SEVEN = 'Seven'
    EIGHT = 'Eight'
    NINE = 'Nine'
    TEN = 'Ten'
    JACK = 'Jack'
    QUEEN = 'Queen'
    KING = 'King'
    ACE = 'Ace'

# Define a Card as a tuple of (Suit, Rank)
class Card:
    def __init__(self, suit, rank):
        self.suit = suit
        self.rank = rank

    def __repr__(self):
        return f"{self.rank} of {self.suit}"

# Define Player and Game classes
class Player:
    def __init__(self, name):
        self.name = name
        self.hand = []

    def __repr__(self):
        return f"{self.name} has: {', '.join(str(card) for card in self.hand)}"

class Game:
    def __init__(self, player_names):
        self.deck = self.create_deck()
        self.shuffle_deck()
        self.players = [Player(name) for name in player_names]

    def create_deck(self):
        suits = [Suit.CLUB, Suit.DIAMOND, Suit.SPADE, Suit.HEART]
        ranks = [Rank.TWO, Rank.THREE, Rank.FOUR, Rank.FIVE, Rank.SIX, Rank.SEVEN, Rank.EIGHT, Rank.NINE,
                 Rank.TEN, Rank.JACK, Rank.QUEEN, Rank.KING, Rank.ACE]
        return [Card(suit, rank) for suit in suits for rank in ranks]

    def shuffle_deck(self):
        random.shuffle(self.deck)

    def deal(self):
        if len(self.deck) > 0:
            return self.deck.pop(0)
        return None

    def pickup_card(self, player, card):
        player.hand.append(card)

    def play_round(self):
        for player in self.players:
            card = self.deal()
            if card:
                self.pickup_card(player, card)
            else:
                print("Deck is empty!")

    def show_game_state(self):
        for player in self.players:
            print(player)

# Example usage
if __name__ == "__main__":
    # Initialize game with players
    game = Game(["Alice", "Bob"])

    # Play a round
    print("Starting the round...\n")
    game.play_round()

    # Show game state after the round
    print("\nGame state after round:")
    game.show_game_state()
