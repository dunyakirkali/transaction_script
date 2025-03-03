export enum Suit {
	Club = 'CLUB',
	Diamond = 'DIAMOND',
	Spade = 'SPADE',
	Heart = 'HEART'
}

export enum Rank {
	Two = 'TWO',
	Three = 'THREE',
	Four = 'FOUR',
	Five = 'FIVE',
	Six = 'SIX',
	Seven = 'SEVEN',
	Eight = 'EIGHT',
	Nine = 'NINE',
	Ten = 'TEN',
	Jack = 'JACK',
	Queen = 'QUEEN',
	King = 'KING',
	Ace = 'ACE'
}

export type Card = [Suit, Rank];
export type Hand = Card[];
export type Deck = Card[];

export interface Player {
	name: string;
	hand: Hand;
}

export interface Game {
	deck: Deck;
	players: Player[];
}

export type Deal = (deck: Deck) => [Deck, Card];
export type PickupCard = (params: [Hand, Card]) => Hand;
