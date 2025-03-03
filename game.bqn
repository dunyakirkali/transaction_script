Suit ← ⟜"Club" "Diamond" "Spade" "Heart"
Rank ← ⟜"Two" "Three" "Four" "Five" "Six" "Seven" "Eight" "Nine" "Ten" "Jack" "Queen" "King" "Ace"

Card ← ⊢∘⥊  ⍟(2⊸⊗)  # Creates a pair {Suit, Rank}

Deck ← ⊏˙(⊔ Suit ⊸⊔ Rank)  # Cartesian product of Suits and Ranks
Shuffle ← ⊏˙(≠⊸⊏⊣)         # Fisher-Yates-like shuffle

Player ← {⟜"name" "hand" ⥊ 𝕩 (⟜⟜'')}  # Player is a namespace with a name and a hand (empty initially)
Game ← {⟜"deck" "players" ⥊ 𝕩 (⟜⟜'')}  # Game holds the deck and a list of players

Deal ← {𝕨 "deck" (𝕨 "deck" ⊑𝕨 "deck"), (⊑𝕨 "deck")}  # Removes top card and returns it
PickupCard ← {𝕨 "hand" (𝕨 "hand" ∪ 𝕩)}  # Adds a card to player's hand
