#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

cd "me/kmom06/maze2"

function executeDockerCompose
{
    printf "${cyan}\n"
    read -r -p "Execute $@? [Y/n] " response
    printf "${normal}\n"

    if [[ ! "$response" = "n" ]]; then
        eval "$@"
    fi
}

printf "${cyan}\n"
read -r -p "View docker-compose? (look for :loop tag) [Y/n] " response
printf "${normal}\n"

file=""

if [[ ! "$response" = "n" ]]; then
    if [[ -f "docker-compose.yml" ]]; then
        file="docker-compose.yml"
    else
        file="docker-compose.yaml"
    fi
    more "$file"
fi

executeDockerCompose "docker-compose up -d server"
executeDockerCompose "docker-compose run client"
executeDockerCompose "docker-compose down"
