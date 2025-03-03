%% Define suits and ranks as atoms
-define(SUITS, [club, diamond, spade, heart]).
-define(RANKS, [two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace]).

%% Type Aliases (Informal, as Erlang doesn't have type aliases)
%% - Card: {Suit, Rank}
%% - Hand: List of Cards
%% - Deck: List of Cards

-record(player, {name :: string(), hand :: list()}).
-record(game, {deck :: list(), players :: list()}).

%% Function type equivalents (not strictly enforced in Erlang)
%% - Deal: fun(Deck) -> {Deck, Card}.
%% - PickupCard: fun(Hand, Card) -> Hand.

%% Example function: Deal a card from the deck
deal([Card | RestOfDeck]) -> {RestOfDeck, Card}.

%% Example function: Add a card to a hand
pickup_card(Hand, Card) -> [Card | Hand].
