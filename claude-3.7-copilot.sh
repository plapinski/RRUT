#!/bin/bash

# Rainbow Running Unicorn Animation
# For MacOS terminals

# Terminal cleanup function
cleanup() {
    tput cnorm   # Show cursor
    tput sgr0    # Reset terminal colors and attributes
    clear
    exit 0
}

# Trap ctrl-c to ensure proper cleanup
trap cleanup SIGINT

# Hide cursor for animation
tput civis

# ANSI color codes for rainbow
RED='\033[1;31m'
ORANGE='\033[1;33m'
YELLOW='\033[1;93m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
INDIGO='\033[1;35m'
VIOLET='\033[1;95m'
NC='\033[0m'     # No Color

# Define unicorn animation frames
frame1="
                  /|    
             /|  / |    
            / | /  |    
           /  |/   |    
      ,~-._/___|____    
     / ${RED}^${NC}  ${YELLOW}o${NC}     ${BLUE},^${NC}  \\   
    /  ${GREEN}>--<${NC}    ${RED}O${NC}  /   
   (    ${VIOLET}V${NC}        ${YELLOW})${NC}    
    \\ ${INDIGO}===${NC}       ${GREEN}/     
     \\         /      
      \\._____./       
        ///\\\\\\      
       ///||\\\\\\     
      //  ||  \\\\    
     //   ||   \\\\   
"

frame2="
                        
             /|         
            / |   /|    
           /  |  / |    
      ,~-._/___|/__|    
     / ${YELLOW}^${NC}  ${BLUE}o${NC}     ${RED},^${NC}  \\   
    /  ${INDIGO}>--<${NC}    ${GREEN}O${NC}  /   
   (    ${RED}V${NC}        ${VIOLET})${NC}    
    \\ ${YELLOW}===${NC}       ${INDIGO}/     
     \\         /      
     _\\._____./       
    ///\\\\\\         
   /// || \\\\\\      
  //   ||   \\\\     
 //    ||    \\\\    
"

frame3="
                        
                        
            /|    /|    
           / |   / |    
      ,~-._/__|__/__|   
     / ${GREEN}^${NC}  ${VIOLET}o${NC}     ${YELLOW},^${NC}  \\  
    /  ${RED}>--<${NC}    ${INDIGO}O${NC}  /   
   (    ${GREEN}V${NC}        ${RED})${NC}    
    \\ ${BLUE}===${NC}       ${YELLOW}/     
    _\\         /      
   / _\\._____./       
  /// \\\\\\          
 ///   \\\\\\\\       
//      \\\\  \\     
/        \\\\   \\    
"

frame4="
                        
                        
                        
           /|     /|    
      ,~-._/|____/_|___ 
     / ${INDIGO}^${NC}  ${RED}o${NC}     ${GREEN},^${NC}  \\ 
    /  ${YELLOW}>--<${NC}    ${VIOLET}O${NC}  /  
   (    ${INDIGO}V${NC}        ${GREEN})${NC}   
    \\ ${RED}===${NC}       ${BLUE}/    
   __\\         /     
  /  _\\._____./      
 ///  \\\\\\         
///    \\\\\\\\      
/        \\\\ \\     
          \\\\  \\    
"

# Run animation
clear
while true; do
    # Get terminal size
    TERMINAL_HEIGHT=$(tput lines)
    TERMINAL_WIDTH=$(tput cols)
    
    # Calculate vertical position (center vertically)
    V_POS=$(( (TERMINAL_HEIGHT - 16) / 2 ))
    if [ $V_POS -lt 0 ]; then
        V_POS=0
    fi
    
    # Display frames with proper positioning
    clear
    tput cup $V_POS 0
    echo -e "$frame1"
    sleep 0.2
    
    clear
    tput cup $V_POS 0
    echo -e "$frame2"
    sleep 0.2
    
    clear
    tput cup $V_POS 0
    echo -e "$frame3"
    sleep 0.2
    
    clear
    tput cup $V_POS 0
    echo -e "$frame4"
    sleep 0.2
done
