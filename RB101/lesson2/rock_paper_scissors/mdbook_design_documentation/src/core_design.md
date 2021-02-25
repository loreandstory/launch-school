# Main Design - Rock Paper Scissors Game

## Understanding the Problem

### Need

A program to play rock paper scissors in the terminal, allowing the user to enter their user name, select which variant of rock paper scissors they want to play (original or lizard spock), select how many rounds to play, and then play the game against the computer.

The player should be able to see who won each round, along with the current win and loss counts. The program should display the winner and prompt to quit or replay. They player should be able to quit at any time.

### Problem Description

Requirements:
- Display information/messages to the user.
    + Store the messages.
    + Display messages to the user.
- Request, receive, and process input from the user.
    + Request input.
    + Validate input.
    + Store or pass the input as needed.
- Provide a bot the user plays against, which randomly selects a game choice (rock, paper, etc.), just as the user will make their own choice.
    + Store and retrieve game choices.
    + Randomly select game choice to retrieve as bot's choice for that round.
- Calculate who the winner is and when the game is over.
    + Take in user choice and bot choice.
    + Implement game rules to determine who won.
    + Return winner.
- Store wins, loses, and ties.

## Example User Story

The user:
- Types 'ruby play_rock_paper_scissors.rb' into a terminal and presses enter.
- Sees a game title and is greeted and asked to select either the original rps or the lizard spock variant, and is also allowed to quit the game.
    + Chooses the original rock paper scissors game and inputs choice.
- Is prompted to enter a player name.
    + Enters their desired player name and submits.
- Is prompted to choose how many wins they or the bot need to be the victor.
    + Enters a number and submits.
- Is shown the round number and prompted to  make their choice (rock, paper, etc.)
    + User chooses and submits.
    + [Behind the curtain] bot makes its choice.
    + Winner is calculated and user choice, bot choice, wins, loses, and ties displayed.
    + repeated till wins required reached.
- Sees a game over page that lists the victor, the scores, and prompts the user to quit or play again.

## Data Structure

- Messages/prompt storage: YAML files for each page
- Game data (game chosen, user name, wins, etc.): hash
- Pages: modules for each.

Setup:
- main w/ game_data, calls
    + module page_select_game, calls
        * select_game_page.yml
    + module page_player_name, calls
        * player_name_page.yml
    + module page_wins_to_victory, calls
        * wins_to_victory.yml
    + module page_player_choice, calls
        * player_choice_page.yml
    + module page_round_results, calls
        * round_results_page.yml
    + module page_game_over, calls
        * game_over_page.yml
    + gameplay module
        * module game_rps
        * module game_ls

Each page module should:
- Pull message/prompt/regex data from its YAML file.
- Prompt the user for input.
- Validate the user's input using its own given regex.
- Return that input if it is valid.
- If the input is not value, the page module must give a relevant error and request the user input again.

The two game modules should:
- Expect a string with the player's choice.
- Generate a random choice for the bot.
- Determine winner.
- Return bot's choice and name of winner, or 'tie' if tie.

## Algorithms

```
START

Load gameplay modules

SET player_name = nil
SET rounds_played = 1

SET player_choice = nil
SET bot_choice = nil

SET game_data = {
                  selected_game: nil,
                  wins: 0,
                  loses: 0,
                  ties: 0,
                  round_winner: nil
                }

SET victor = nil

SET pages = {
              select_game: call module,
              player_name: call module,
              wins_to_victory: call module,
              player_choice: call module,
              round_results: call module,
              game_over: call module
            }

WHILE victor == nil
  selected_game = pages @ select_game
  player_name = pages @ player_name
  wins_to_victory = pages @ wins_to_victory
 
  WHILE game_data @ wins < wins_to_victory
    game_data = play_game(game_data)
    rounds_played = rounds_played + 1
```
