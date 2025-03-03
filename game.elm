module Main exposing (..)

import Browser
import Html exposing (Html, div, text, button)
import Html.Attributes exposing (style)
import List exposing (reverse)

-- Define the Suit and Rank types as custom types
type Suit = Club | Diamond | Spade | Heart
type Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

-- Define a Card as a tuple of Suit and Rank
type alias Card =
    { suit : Suit, rank : Rank }

-- Define Player and Game as records
type alias Player =
    { name : String, hand : List Card }

type alias Game =
    { deck : List Card, players : List Player }

-- Generate a full deck of cards
fullDeck : List Card
fullDeck =
    let
        suits = [Club, Diamond, Spade, Heart]
        ranks = [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
    in
    List.concatMap (\suit -> List.map (\rank -> { suit = suit, rank = rank }) ranks) suits

-- Shuffle the deck (simple version using reverse for demo)
shuffleDeck : List Card -> List Card
shuffleDeck deck =
    reverse deck  -- Simple reversal of the deck for demo purposes

-- Deal a card from the deck
deal : List Card -> ( Maybe Card, List Card )
deal deck =
    case deck of
        [] -> (Nothing, [])
        card :: rest -> (Just card, rest)

-- Pickup a card into a player's hand
pickupCard : List Card -> Card -> List Card
pickupCard hand card =
    card :: hand

-- Initialize the game with players
init : Game
init =
    let
        shuffledDeck = shuffleDeck fullDeck
        player1 = { name = "Alice", hand = [] }
        player2 = { name = "Bob", hand = [] }
    in
    { deck = shuffledDeck, players = [ player1, player2 ] }

-- Update the game by dealing a card to the first player
update : Game -> Game
update game =
    let
        (card, newDeck) = deal game.deck
    in
    case card of
        Just c ->
            let
                updatedPlayer = { name = "Alice", hand = pickupCard (List.head game.players |> Maybe.withDefault { hand = [] }).hand c }
                updatedPlayers = updatedPlayer :: List.tail game.players |> Maybe.withDefault []
            in
            { game | deck = newDeck, players = updatedPlayers }

        Nothing -> game

-- View function to display the game state
view : Game -> Html Msg
view game =
    div []
        [ text ("Deck has " ++ String.fromInt (List.length game.deck) ++ " cards left")
        , text ("Player 1 hand: " ++ showHand (List.head game.players |> Maybe.withDefault { hand = [] }))
        , button [ onClick Update ] [ text "Deal Card" ]
        ]

-- Helper function to show the player's hand
showHand : Player -> String
showHand player =
    String.join ", " (List.map showCard player.hand)

-- Show a card as a string
showCard : Card -> String
showCard card =
    (case card.rank of
        Two -> "Two"
        Three -> "Three"
        Four -> "Four"
        Five -> "Five"
        Six -> "Six"
        Seven -> "Seven"
        Eight -> "Eight"
        Nine -> "Nine"
        Ten -> "Ten"
        Jack -> "Jack"
        Queen -> "Queen"
        King -> "King"
        Ace -> "Ace"
    )
    ++ " of "
    ++ (case card.suit of
        Club -> "Club"
        Diamond -> "Diamond"
        Spade -> "Spade"
        Heart -> "Heart"
    )

-- Initialize and run the program
main =
    Browser.sandbox { init = init, update = update, view = view }
