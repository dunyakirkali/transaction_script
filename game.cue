package cardgame

#Suit: "Club" | "Diamond" | "Spade" | "Heart"

#Rank: "Two" | "Three" | "Four" | "Five" | "Six" | "Seven" | "Eight" |
  "Nine" | "Ten" | "Jack" | "Queen" | "King" | "Ace"

#Card: {
  suit: #Suit
  rank: #Rank
}

#Hand: [...#Card]
#Deck: [...#Card]

#Player: {
  name: string
  hand: #Hand
}

#Game: {
  deck: #Deck
  players: [...#Player]
}

// CUE cannot model functions, so these define their input and output shapes.
#DealInput: #Deck
#DealOutput: [#Deck, #Card]
#PickupCardInput: [#Hand, #Card]
#PickupCardOutput: #Hand
