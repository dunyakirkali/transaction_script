module CardGame
  # Enums using modules and constants
  module Suit
    CLUB = :club
    DIAMOND = :diamond
    SPADE = :spade
    HEART = :heart

    ALL = [CLUB, DIAMOND, SPADE, HEART].freeze
  end

  module Rank
    TWO = :two
    THREE = :three
    FOUR = :four
    FIVE = :five
    SIX = :six
    SEVEN = :seven
    EIGHT = :eight
    NINE = :nine
    TEN = :ten
    JACK = :jack
    QUEEN = :queen
    KING = :king
    ACE = :ace

    ALL = [TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE].freeze
  end

  # Card using Struct for immutable value object
  Card = Struct.new(:suit, :rank) do
    def initialize(suit, rank)
      raise ArgumentError unless Suit::ALL.include?(suit) && Rank::ALL.include?(rank)
      super
    end
  end

  # Player class with typed attributes
  class Player
    attr_reader :name
    attr_accessor :hand

    def initialize(name, hand = [])
      @name = name
      @hand = hand
    end
  end

  # Game class managing deck and players
  class Game
    attr_accessor :deck, :players

    def initialize(deck = [], players = [])
      @deck = deck
      @players = players
    end
  end

  # Type definitions through documentation since Ruby is duck-typed
  # Deal = Proc(Deck -> [Deck, Card])
  # PickupCard = Proc([Hand, Card] -> Hand)
end
