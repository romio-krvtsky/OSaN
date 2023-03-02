#!/bin/bash

# initialize the board
board=(" " " " " " " " " " " " " " " " " ")

# display the board
function display_board {
  echo " ${board[0]} | ${board[1]} | ${board[2]} "
  echo "---+---+---"
  echo " ${board[3]} | ${board[4]} | ${board[5]} "
  echo "---+---+---"
  echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

# check if the game is over
function game_over {
  if [ "${board[0]}" != " " ] && [ "${board[0]}" == "${board[1]}" ] && [ "${board[1]}" == "${board[2]}" ]; then
    return 0
  elif [ "${board[3]}" != " " ] && [ "${board[3]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[5]}" ]; then
    return 0
  elif [ "${board[6]}" != " " ] && [ "${board[6]}" == "${board[7]}" ] && [ "${board[7]}" == "${board[8]}" ]; then
    return 0
  elif [ "${board[0]}" != " " ] && [ "${board[0]}" == "${board[3]}" ] && [ "${board[3]}" == "${board[6]}" ]; then
    return 0
  elif [ "${board[1]}" != " " ] && [ "${board[1]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[7]}" ]; then
    return 0
  elif [ "${board[2]}" != " " ] && [ "${board[2]}" == "${board[5]}" ] && [ "${board[5]}" == "${board[8]}" ]; then
    return 0
  elif [ "${board[0]}" != " " ] && [ "${board[0]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[8]}" ]; then
    return 0
  elif [ "${board[2]}" != " " ] && [ "${board[2]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[6]}" ]; then
    return 0
  elif ! [[ " ${board[@]} " =~ " " ]]; then
    echo "It's a tie!"
    exit 0
  else
    return 1
  fi
}

# start the game
display_board
player="X"
while true; do
  # get the player's move
  echo "Player $player's turn"
  read -p "Enter row (1-3) and column (1-3) separated by a space: " row col
  index=$((($row - 1) * 3 + $col - 1))
  if [ "${board[$index]}" != " " ]; then
    echo "That spot is already taken. Please try again."
    continue
  fi
  board[$index]=$player
  display_board
  if game_over; then
    echo "Player $player wins!"
    exit 0
  fi
  # switch to the other player
  if [ "$player" == "X" ]; then
    player="O"
  else
    player="X"
  fi
done
