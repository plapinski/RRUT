#!/bin/bash

# Function to display colored text
colorize() {
  local text="$1"
  local color="$2"
  printf "\e[38;5;${color}m%s\e[0m\n" "$text"
}

# Unicorn animation frames
frame1="
      /\\_/\\
     ( o.o )
    > ^ <
"

frame2="
      /\\_/\\
     ( O.O )
    > ^ <
"

frame3="
      /\\_/\\
     ( o.o )
    > ^ <
"

frame4="
      /\\_/\\
     ( -.- )
    > ^ <
"

# Rainbow color definitions (using 256-color palette)
colors=(
  196 # Red
  208 # Orange
  226 # Yellow
  46  # Green
  39  # Blue
  93  # Indigo
  163 # Violet
)

# Animation loop
while true; do
  for frame in "$frame1" "$frame2" "$frame3" "$frame4"; do
    clear
    i=0
    IFS=$'\n'  # Ensure that lines are split correctly
    while IFS= read -r line; do
      color=$((colors[i % ${#colors[@]}]))
      colorize "$line" "$color"
      i=$((i + 1))
    done <<< "$frame"
    sleep 0.2
  done
done
