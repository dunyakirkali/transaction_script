package CardGame;
use strict;
use warnings;
use Moo;

# Suit enumeration
use constant {
    CLUB    => 'club',
    DIAMOND => 'diamond',
    SPADE   => 'spade',
    HEART   => 'heart'
};

# Rank enumeration
use constant {
    TWO   => 'two',
    THREE => 'three',
    FOUR  => 'four',
    FIVE  => 'five',
    SIX   => 'six',
    SEVEN => 'seven',
    EIGHT => 'eight',
    NINE  => 'nine',
    TEN   => 'ten',
    JACK  => 'jack',
    QUEEN => 'queen',
    KING  => 'king',
    ACE   => 'ace'
};

# Card class
package Card {
    use Moo;
    has 'suit' => (is => 'ro', required => 1);
    has 'rank' => (is => 'ro', required => 1);
}

# Player class
package Player {
    use Moo;
    has 'name' => (is => 'ro', required => 1);
    has 'hand' => (is => 'rw', default => sub { [] });
}

# Game class
package Game {
    use Moo;
    has 'deck'    => (is => 'rw', default => sub { [] });
    has 'players' => (is => 'rw', default => sub { [] });
}

# Function type signatures are implemented through documentation
# since Perl is dynamically typed

# Deal: deck -> (deck, card)
# PickupCard: (hand, card) -> hand

1;
