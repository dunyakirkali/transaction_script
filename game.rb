# Define suits and ranks as constants
SUITS = [:club, :diamond, :spade, :heart]
RANKS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]

# A Card is represented as a Struct
Card = Struct.new(:suit, :rank) do
  def to_s
    "#{rank.capitalize} of #{suit.capitalize}"
  end
end

# A Player class
class Player
  attr_accessor :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end
end

# A Game class
class Game
  attr_accessor :deck, :players

  def initialize(players)
    @deck = SUITS.product(RANKS).map { |suit, rank| Card.new(suit, rank) }.shuffle
    @players = players
  end

  def deal
    @deck.pop
  end

  def pickup_card(player, card)
    player.hand << card
  end
end

# Example usage
player1 = Player.new("Alice")
player2 = Player.new("Bob")
game = Game.new([player1, player2])

# Deal a card to Alice
card = game.deal
game.pickup_card(player1, card)

# Print Alice's hand
puts "#{player1.name} has: #{card}"
