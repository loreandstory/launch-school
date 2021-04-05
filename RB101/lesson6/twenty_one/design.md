# Twenty-One Ruby comment line program

## Rules

1. Start with a normal deck of 52 cards, all 4 suites and values (except for jokers!).
1. goal: get as close to 21 as possible, but without going over.
1. lose: if you go over 21, it is called a "bust". and you lose the game.
 
## Setup

1. Start with 2 players: dealer and player.
1. Dealer deals 2 cards to player and to self (the player can see both of own cards, but only one of the dealer's cards on the table).
1. Player turn: player goes first, deiciding whether to "hit" or "stay" - i.e. ask for another card or pass. The player can continue to hit as many times as they want. The turn is over when the player either busts (game over, dealer wins!) or stays.
1. Dealer turn: after player stays, dealer must follow set of rules on whether to hit or stay:
    1. Must hit until the total value is at least 17.
    1. Dealer either busts (game over, player won!) or stays after.
1. Comparing cards: after dealer stays, compare value of player and dealer cards -> whoever has higher value wins! Same value a tie?

## Card values

* Number card: 2-10
* Face cards: 10 (except Ace: can be worth either 1 or 11).

-------

## Design

1. Create a deck module for handling (initializing, values, used, remaining, etc.) and dealing cards.
1. Create a "hand" and "table" display to the user.
1. Have way to add to hand/table.
1. 
