#!/bin/bash

# Terminal dimensions
width=$(tput cols)
height=$(tput lines)

# Number of raindrops
num_drops=100

# ANSI color codes
BLUE='\033[34m'
CYAN='\033[36m'
RESET='\033[0m'

# Clear the screen
clear

# Function to generate a random raindrop with color
generate_drop() {
  col=$((RANDOM % width))
  row=$((RANDOM % height))

  # Select a random color for the raindrop
  if (( RANDOM % 2 == 0 )); then
    color=$BLUE
  else
    color=$CYAN
  fi

  # Place the raindrop with color at a random position
  echo -ne "\033[${row};${col}H${color}!${RESET}"
}

# Main loop to simulate rainfall
while true; do
  # Generate raindrops at random positions
  for ((i = 0; i < num_drops; i++)); do
    generate_drop
  done
  # Wait for a short interval
  sleep 0.1
  # Clear the screen again for the next frame
  clear
done

