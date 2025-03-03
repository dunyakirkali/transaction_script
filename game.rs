#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Suit {
    Club,
    Diamond,
    Spade,
    Heart,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Rank {
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
    Ace,
}

pub type Card = (Suit, Rank);
pub type Hand = Vec<Card>;
pub type Deck = Vec<Card>;

#[derive(Debug, Clone)]
pub struct Player {
    pub name: String,
    pub hand: Hand,
}

#[derive(Debug, Clone)]
pub struct Game {
    pub deck: Deck,
    pub players: Vec<Player>,
}

pub type Deal = fn(Deck) -> (Deck, Card);
pub type PickupCard = fn((Hand, Card)) -> Hand;
