#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

printf ">>> -------------- Post inspect -------------------------\n"

# PORT="${DBWEBB_PORT:-1337}"
export DBWEBB_PORT="1335"
student_docker=$(cat me/kmom04/server/dockerhub.txt | head -n2 | tail -n1 | rev | sed -E -n 's/^\s?([a-zA-Z0-9]+[:][a-zA-Z0-9\-]+[/][a-zA-Z0-9]+).*/\1/p' | rev)

cd me/kmom04/client || exit 1

function testClient
{
    printf "${cyan}\n"
    read -p "Testing ./client.bash ($*)"
    printf "${normal}\n"

    ./client.bash "$@"
}

testClient "-h"
testClient "-v"
testClient "all"
testClient "color" "Yellow"
testClient "color" "yellow"
testClient "test" "https://dbwebb.se"
testClient "test"
testClient "test" "http://faultysup3rwebpage.com"
testClient "--save" "names"
ls -l

read -p "Do you see the saved file? (Created $(date +'%b %_d'))"

printf "${cyan}"
read -r -p "Do you want to look at data-file? [y/N] " response
printf "${normal}"

if [[ "$response" = "y" ]]; then
    more *.data
fi

printf "${cyan}"
read -r -p "Do you want to look at client.bash? [y/N] " response
printf "${normal}"

if [[ "$response" = "y" ]]; then
    more client.bash
fi

printf "${cyan}>>> -------------- Clean up -------------------------\n${normal}"

printf "%s\n" "Killing container!"
docker kill "kmom04"

read -p "Press any key to delete the image."
docker rmi -f "$student_docker"
