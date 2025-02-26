#!/bin/bash

# Funkcja czyszcząca terminal przy zamknięciu skryptu
cleanup() {
    tput cnorm  # Przywróć kursor
    clear
    exit 0
}
trap cleanup SIGINT

# Ukryj kursor
tput civis

# Definicje kolorów tęczy (ANSI)
colors=(31 33 32 36 34 35 91)

# Zdefiniuj klatki animacji jednorożca
frame1="
      /)___(\\
     (  •.•  )
      >  ^  <
"

frame2="
      /)___(\\
     (  •o•  )
      >  v  <
"

frame3="
      /)___(\\
     (  o•o  )
      >  ~  <
"

frames=("$frame1" "$frame2" "$frame3")

# Pętla animacji
while true; do
  for frame in "${frames[@]}"; do
    clear
    line_index=0
    while IFS= read -r line; do
      color=${colors[line_index % ${#colors[@]}]}
      printf "\033[1;%sm%s\033[0m\n" "$color" "$line"
      line_index=$((line_index+1))
    done <<< "$frame"
    sleep 0.25
  done
done
