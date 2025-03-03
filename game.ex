# Define suits and ranks as atoms
defmodule CardGame do
  @suits [:club, :diamond, :spade, :heart]
  @ranks [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]

  def suits, do: @suits
  def ranks, do: @ranks

  # Define a card as a tuple
  @type card :: {atom, atom}
  @type hand :: [card]
  @type deck :: [card]

  # Define a Player struct
  defmodule Player do
    defstruct name: "", hand: []

    @type t :: %__MODULE__{name: String.t(), hand: CardGame.hand()}
  end

  # Define a Game struct
  defmodule Game do
    defstruct deck: [], players: []

    @type t :: %__MODULE__{deck: CardGame.deck(), players: [CardGame.Player.t()]}
  end

  # Function to deal a card from the deck
  @spec deal(deck) :: {deck, card}
  def deal([card | rest_of_deck]), do: {rest_of_deck, card}

  # Function to pick up a card into a hand
  @spec pickup_card(hand, card) :: hand
  def pickup_card(hand, card), do: [card | hand]
end
