import System.Random (randomRIO)
import Data.List (delete)

-- Define suits and ranks
data Suit = Club | Diamond | Spade | Heart deriving (Show, Eq, Enum, Bounded)
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten
          | Jack | Queen | King | Ace deriving (Show, Eq, Enum, Bounded)

type Card = (Suit, Rank)
type Hand = [Card]
type Deck = [Card]

data Player = Player { name :: String, hand :: Hand } deriving (Show)
data Game = Game { deck :: Deck, players :: [Player] } deriving (Show)

-- Generate a full deck
fullDeck :: Deck
fullDeck = [(s, r) | s <- [minBound .. maxBound], r <- [minBound .. maxBound]]

-- Shuffle the deck (naïve implementation using IO)
shuffleDeck :: Deck -> IO Deck
shuffleDeck [] = return []
shuffleDeck d = do
    i <- randomRIO (0, length d - 1)
    let card = d !! i
    rest <- shuffleDeck (delete card d)
    return (card : rest)

-- Deal a card from the deck
deal :: Deck -> (Deck, Maybe Card)
deal []     = ([], Nothing)
deal (c:cs) = (cs, Just c)

-- Pickup a card into a player's hand
pickupCard :: Hand -> Card -> Hand
pickupCard hand card = card : hand

-- Example game setup
main :: IO ()
main = do
    shuffledDeck <- shuffleDeck fullDeck
    let player1 = Player "Alice" []
        player2 = Player "Bob" []
        game = Game shuffledDeck [player1, player2]

    let (newDeck, maybeCard) = deal (deck game)
    let updatedPlayer = case maybeCard of
            Just card -> player1 { hand = pickupCard (hand player1) card }
            Nothing -> player1

    putStrLn $ name updatedPlayer ++ " has: " ++ show (hand updatedPlayer)
