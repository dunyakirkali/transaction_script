#pragma once
#include <string>
#include <vector>
#include <utility>
#include <functional>

namespace CardGame {
    enum class Suit {
        Club,
        Diamond,
        Spade,
        Heart
    };

    enum class Rank {
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
    };

    using Card = std::pair<Suit, Rank>;
    using Hand = std::vector<Card>;
    using Deck = std::vector<Card>;

    struct Player {
        std::string name;
        Hand hand;
    };

    struct Game {
        Deck deck;
        std::vector<Player> players;
    };

    using Deal = std::function<std::pair<Deck, Card>(Deck)>;
    using PickupCard = std::function<Hand(std::pair<Hand, Card>)>;
}
