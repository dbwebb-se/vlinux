#!/usr/bin/env bash

. ".dbwebb/inspect-src/kmom.d/colors.bash"

cd "me/kmom10/bthloggen"

printf "${CYAN}"
read -r -p "----- Run log2json.bash? [Y/n] ----- " response
printf "${NORMAL}"


if [[ ! "$response" = "n" ]]; then
    rm data/log.json
    /usr/bin/time -f "Time: %e" ./log2json.bash
    ls -alh data/
fi

read -p "----- Good filesize? ~4-5mb ----- "

function executeDockerCompose
{
    printf "${CYAN}"
    read -r -p "----- Execute $@? [Y/n] ----- " response
    printf "${NORMAL}"

    if [[ ! "$response" = "n" ]]; then
        eval "$@"
    fi
}

printf "${CYAN}"
read -r -p "----- View docker-compose? [Y/n] ----- " response
printf "${NORMAL}"

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
executeDockerCompose "docker-compose run -it client"
executeDockerCompose "docker-compose up webbclient"
executeDockerCompose "docker-compose down --remove-orphans"
