export const Suit = {
	CLUB: 'CLUB',
	DIAMOND: 'DIAMOND',
	SPADE: 'SPADE',
	HEART: 'HEART'
};

export const Rank = {
	TWO: 'TWO',
	THREE: 'THREE',
	FOUR: 'FOUR',
	FIVE: 'FIVE',
	SIX: 'SIX',
	SEVEN: 'SEVEN',
	EIGHT: 'EIGHT',
	NINE: 'NINE',
	TEN: 'TEN',
	JACK: 'JACK',
	QUEEN: 'QUEEN',
	KING: 'KING',
	ACE: 'ACE'
};

// Card is represented as [Suit, Rank]
// Hand is an array of Cards
// Deck is an array of Cards

export class Player {
	constructor(name, hand = []) {
			this.name = name;
			this.hand = hand;
	}
}

export class Game {
	constructor(deck = [], players = []) {
			this.deck = deck;
			this.players = players;
	}
}

// Function signatures shown in comments for reference:
// Deal = (deck) => [remainingDeck, dealtCard]
// PickupCard = ([hand, card]) => hand
