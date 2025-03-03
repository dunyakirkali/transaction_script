#ifndef CARD_GAME_H
#define CARD_GAME_H

#include <stddef.h>

typedef enum {
    SUIT_CLUB,
    SUIT_DIAMOND,
    SUIT_SPADE,
    SUIT_HEART
} Suit;

typedef enum {
    RANK_TWO,
    RANK_THREE,
    RANK_FOUR,
    RANK_FIVE,
    RANK_SIX,
    RANK_SEVEN,
    RANK_EIGHT,
    RANK_NINE,
    RANK_TEN,
    RANK_JACK,
    RANK_QUEEN,
    RANK_KING,
    RANK_ACE
} Rank;

typedef struct {
    Suit suit;
    Rank rank;
} Card;

typedef struct {
    Card* cards;
    size_t count;
} Hand;

typedef Hand Deck;  // A deck is structurally identical to a hand

typedef struct {
    char* name;
    Hand hand;
} Player;

typedef struct {
    Deck deck;
    Player* players;
    size_t player_count;
} Game;

// Function pointer types
typedef struct {
    Deck remaining_deck;
    Card dealt_card;
} DealResult;

typedef DealResult (*Deal)(Deck deck);
typedef Hand (*PickupCard)(Hand hand, Card card);

#endif /* CARD_GAME_H */
