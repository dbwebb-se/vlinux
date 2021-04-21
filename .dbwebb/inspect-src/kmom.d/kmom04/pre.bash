#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

printf ">>> -------------- Pre inspect -------------------------\n"

localport="1335"
port=$(cat me/kmom04/server/dockerhub.txt | head -n1 | sed 's/.*\([0-9]\{4\}\).*/\1/')
student_docker=$(cat me/kmom04/server/dockerhub.txt | head -n2 | tail -n1 | rev | sed -E -n 's/^\s?([a-zA-Z0-9]+[:][a-zA-Z0-9\-]+[/][a-zA-Z0-9]+).*/\1/p' | rev)

printf "%s ${cyan}%s${normal}\n" "Using port:" "$localport:$port"
printf "%s ${cyan}%s${normal}\n" "Docker image:" "$student_docker"

read -p "Press any key to move on."

docker run --rm --name kmom04 -d -p "$localport":"$port" -it -v "$(pwd)"/example/json/:"/server/data/" "$student_docker"

function testServer
{
    printf "${cyan}\n\n"
    read -p "Curling localhost:$localport/$1"

    printf "${normal}\n"

    curl "http://localhost:$localport/$1"
    # tput setaf 6
    # echo ""
    # # read -p "Done viewing? <Press Enter>"
    # tput sgr0
}

testServer "all"
testServer "names"
testServer "color/Yellow"
testServer "color/yellow"

eval "$BROWSER" "http://localhost:$localport/all" &

printf "${cyan}\n\n"
read -p "[CHECK BROWSER] Press any key to continue."
printf "${normal}"

# docker kill "$dockerId"
