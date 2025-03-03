defmodule CardGame do
  # Suits as atoms
  @type suit :: :club | :diamond | :spade | :heart

  # Ranks as atoms
  @type rank :: :two | :three | :four | :five | :six | :seven | :eight | :nine | :ten | :jack | :queen | :king | :ace

  # Card is a tuple of suit and rank
  @type card :: {suit, rank}

  # Hand is a list of cards
  @type hand :: list(card)

  # Deck is a list of cards
  @type deck :: list(card)

  # Player is a map with name and hand
  @type player :: %{name: String.t(), hand: hand}

  # Game is a map with deck and players
  @type game :: %{deck: deck, players: list(player)}

  # Deal function type
  @type deal :: (deck -> {deck, card})

  # PickupCard function type
  @type pickup_card :: ({hand, card} -> hand)
end
