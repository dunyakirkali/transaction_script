from dataclasses import dataclass
from enum import Enum
from typing import List, Tuple, Callable

class Suit(Enum):
    CLUB = "club"
    DIAMOND = "diamond"
    SPADE = "spade"
    HEART = "heart"

class Rank(Enum):
    TWO = "2"
    THREE = "3"
    FOUR = "4"
    FIVE = "5"
    SIX = "6"
    SEVEN = "7"
    EIGHT = "8"
    NINE = "9"
    TEN = "10"
    JACK = "jack"
    QUEEN = "queen"
    KING = "king"
    ACE = "ace"

Card = Tuple[Suit, Rank]
Hand = List[Card]
Deck = List[Card]

@dataclass
class Player:
    name: str
    hand: Hand

@dataclass
class Game:
    deck: Deck
    players: List[Player]

Deal = Callable[[Deck], Tuple[Deck, Card]]
PickupCard = Callable[[Tuple[Hand, Card]], Hand]
