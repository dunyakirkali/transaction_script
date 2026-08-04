pub const Suit = enum {
    club,
    diamond,
    spade,
    heart,
};

pub const Rank = enum {
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine,
    ten,
    jack,
    queen,
    king,
    ace,
};

pub const Card = struct {
    suit: Suit,
    rank: Rank,
};

pub const Hand = []const Card;
pub const Deck = []const Card;

pub const Player = struct {
    name: []const u8,
    hand: Hand,
};

pub const Game = struct {
    deck: Deck,
    players: []const Player,
};

pub const DealResult = struct {
    deck: Deck,
    card: Card,
};

pub const Deal = *const fn (Deck) DealResult;
pub const PickupCard = *const fn (Hand, Card) Hand;
