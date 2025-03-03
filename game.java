package com.cardgame.model;

import java.util.List;

public class CardGame {
    public enum Suit {
        CLUB, DIAMOND, SPADE, HEART
    }

    public enum Rank {
        TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN,
        JACK, QUEEN, KING, ACE
    }

    public record Card(Suit suit, Rank rank) {}

    public record Player(String name, List<Card> hand) {}

    public record Game(List<Card> deck, List<Player> players) {}

    @FunctionalInterface
    public interface Deal {
        DealResult apply(List<Card> deck);
    }

    public record DealResult(List<Card> remainingDeck, Card dealtCard) {}

    @FunctionalInterface
    public interface PickupCard {
        List<Card> apply(List<Card> hand, Card card);
    }
}
