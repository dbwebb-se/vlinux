#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

cd "me/kmom06/maze2/client"

printf "${cyan}\n"
read -r -p "View mazerunner.bash? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    more "mazerunner.bash"
fi
