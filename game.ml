type suit = Club | Diamond | Spade | Heart

type rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

type card = suit * rank

type hand = card list

type deck = card list

type player = {
  name: string;
  hand: hand;
}

type game = {
  deck: deck;
  players: player list;
}

type deal = deck -> deck * card

type pickup_card = hand * card -> hand
