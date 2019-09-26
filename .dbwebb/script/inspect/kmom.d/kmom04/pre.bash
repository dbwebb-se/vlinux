#!/usr/bin/env bash

printf ">>> -------------- Pre inspect -------------------------\n"

port=$(cat me/kmom04/server/dockerhub.txt | head -n1 | sed 's/.*\([0-9]\{4\}\).*/\1/')
url=$(tail -1 me/kmom04/server/dockerhub.txt)

echo "Using port: $port"
echo "Docker image: $url"
read -p "Lets go!"

dockerId=$(docker run --rm --name testKmom04 -d -p "$port":"$port" -it -v "$(pwd)"/example/json/:/var/www/html/data/ "$url")

function testServer
{
    tput setaf 6
    read -p "Curling localhost:$port/$1 <Press Enter>"
    tput sgr0
    curl "http://localhost:$port/$1"
    tput setaf 6
    echo ""
    read -p "Done viewing? <Press Enter>"
    tput sgr0
}

testServer "all"
testServer "names"
testServer "color/Yellow"
testServer "color/yellow"

eval "$BROWSER" "http://localhost:$port/all" &

tput setaf 6
read -p "Done with viewing browser? <Press Enter>"
tput sgr0

# docker kill "$dockerId"
