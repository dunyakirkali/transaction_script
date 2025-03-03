(* Define the Suit and Rank types as variants *)
type suit = Club | Diamond | Spade | Heart
type rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

(* A Card is a tuple (Suit, Rank) *)
type card = suit * rank

(* Hand and Deck are lists of cards *)
type hand = card list
type deck = card list

(* Player and Game are records *)
type player = { name: string; hand: hand }
type game = { deck: deck; players: player list }

(* Generate a full deck of cards *)
let full_deck () : deck =
  let suits = [Club; Diamond; Spade; Heart] in
  let ranks = [Two; Three; Four; Five; Six; Seven; Eight; Nine; Ten; Jack; Queen; King; Ace] in
  List.flatten (List.map (fun s -> List.map (fun r -> (s, r)) ranks) suits)

(* Shuffle the deck using random permutations *)
let shuffle_deck (deck: deck) : deck =
  let rand = Random.self_init () in
  let deck_len = List.length deck in
  let list_copy = List.map (fun x -> x) deck in
  let rec shuffle lst =
    if List.length lst <= 1 then lst
    else
      let n = Random.int (List.length lst) in
      let x = List.nth lst n in
      let rest = List.filter (fun y -> y <> x) lst in
      x :: shuffle rest
  in
  shuffle list_copy

(* Deal the top card from the deck *)
let deal (deck: deck) : (card option * deck) =
  match deck with
  | [] -> (None, [])
  | card :: rest -> (Some card, rest)

(* Pickup a card into a player's hand *)
let pickup_card (hand: hand) (card: card) : hand =
  card :: hand

(* Example usage *)
let () =
  let deck = full_deck () |> shuffle_deck in
  let player1 = { name = "Alice"; hand = [] } in
  let player2 = { name = "Bob"; hand = [] } in
  let game = { deck = deck; players = [player1; player2] } in

  (* Deal a card to player1 *)
  let (card, new_deck) = deal game.deck in
  match card with
  | Some c ->
      let updated_player1 = { player1 with hand = pickup_card player1.hand c } in
      let updated_game = { game with deck = new_deck; players = [updated_player1; player2] } in
      Printf.printf "%s has: %s of %s\n" updated_player1.name (match fst c with Club -> "Club" | Diamond -> "Diamond" | Spade -> "Spade" | Heart -> "Heart") (match snd c with Two -> "Two" | Three -> "Three" | Four -> "Four" | Five -> "Five" | Six -> "Six" | Seven -> "Seven" | Eight -> "Eight" | Nine -> "Nine" | Ten -> "Ten" | Jack -> "Jack" | Queen -> "Queen" | King -> "King" | Ace -> "Ace")
  | None -> print_endline "No more cards to deal"
