# Personal aliases
alias EDIT_BASHRC='nano /.bashrc'

## gcc and debugging
alias gc='gcc -ansi -pedantic-errors -Wall -Wextra -DNDEBUG -o3'
alias gc9='gcc -std=c99 -pedantic-errors -Wall -Wextra -DNDEBUG -o3'
alias gd='gcc -ansi -pedantic-errors -Wall -Wextra -g'
alias gd9='gcc -std=c99 -pedantic-errors -Wall -Wextra -g'
alias gdo='gcc -ansi -pedantic-errors -Wall -Wextra -g -c'
alias vlg='valgrind --leak-check=yes --track-origins=yes'

## Nano
alias nano='nano -m -q -l --minibar'
alias sudo_nano='sudo nano -m -q -l --minibar'

## apt
alias sa='sudo apt'
alias sai='sudo apt install'
alias sau='sudo apt update && sudo apt upgrade -y'
alias srm='sudo apt remove'

#Run neofetch
sleep 1 && neofetch
