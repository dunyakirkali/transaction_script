use strict;
use warnings;

# Define suits and ranks as arrays
my @suits = qw(Club Diamond Spade Heart);
my @ranks = qw(Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace);

# A Card is represented as a hash reference
sub new_card {
    my ($suit, $rank) = @_;
    return { suit => $suit, rank => $rank };
}

# A Player is represented as a hash reference
sub new_player {
    my ($name) = @_;
    return { name => $name, hand => [] };
}

# A Game is represented as a hash reference
sub new_game {
    my (@players) = @_;
    my @deck = map { my $suit = $_; map { new_card($suit, $_) } @ranks } @suits;
    return { deck => \@deck, players => \@players };
}

# Function to deal a card from the deck
sub deal {
    my ($deck) = @_;
    return unless @$deck;
    return shift @$deck;
}

# Function to pick up a card into a hand
sub pickup_card {
    my ($hand, $card) = @_;
    push @$hand, $card;
}

# Example usage
my $player1 = new_player("Alice");
my $player2 = new_player("Bob");
my $game = new_game($player1, $player2);

# Deal a card to Alice
my $card = deal($game->{deck});
pickup_card($player1->{hand}, $card);

# Print Alice's hand
print "$player1->{name} has: $card->{rank} of $card->{suit}\n";
