-module(card_game).
-export([]).

% Suits as atoms
-type suit() :: club | diamond | spade | heart.

% Ranks as atoms
-type rank() :: two | three | four | five | six | seven | eight | nine | ten | jack | queen | king | ace.

% Card is a tuple of suit and rank
-type card() :: {suit(), rank()}.

% Hand is a list of cards
-type hand() :: [card()].

% Deck is a list of cards
-type deck() :: [card()].

% Player is a map with name and hand
-type player() :: #{name => string(), hand => hand()}.

% Game is a map with deck and players
-type game() :: #{deck => deck(), players => [player()]}.

% Deal function type
-type deal() :: fun((deck()) -> {deck(), card()}).

% PickupCard function type
-type pickup_card() :: fun(({hand(), card()}) -> hand()).
