#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
YELLOW='\033[33m'
NC='\033[0m' # No Color
CORRECT='✓'
ERROR='x'
KMOM="$2"
# STUD="$2"
# SOLUTIONPATH="../../.solutions/$KMOM"
KMOMPATH="../../me/$KMOM"

SUCCESS=0

function header
{
    printf "\n\n"
    printf "${ORANGE}### %s ###${NC}\n\n\n" "Test suite for [$2] in the course [$1] for user [$3]"
}

function printYes
{
    printf "${GREEN}%s${NC}" "${CORRECT} Yes"
    printf "\n\n"
}

function printNo
{
    printf "${RED}%s${NC}" "${ERROR} No."
    printf "\n\n"
}

function printTest
{
    printf "${ORANGE}%s${NC}\n" "$1. $2"
}

function isSuccess {
    echo "$SUCCESS"
}

function checkIfFilesExist
{
    local counter=0
    local arr=("$@")
    for i in "${arr[@]}"; do
        (( counter++ ))
        printTest "$counter" "The file $KMOM/$i is present and have correct filename."

        if [[ -f "$KMOMPATH/$i" ]]; then
            printYes
        else
            printNo
            SUCCESS=1
        fi
    done
}

function checkDbwebbPort
{
    printTest "5" "The environment variable DBWEBB_PORT is used in client.bash."
    used=$(cat "$KMOMPATH/$1" | grep "DBWEBB_PORT")

    if [[ ! -z "$used" ]]; then
        printYes
    else
        printNo
        SUCCESS=1
    fi
}

function checkForSudoKmom05
{
    printTest "6" "Docker can start without sudo."
    used=$(cat "$KMOMPATH/maze/kmom05.bash" | grep "sudo")

    if [[ -z "$used" ]]; then
        printYes
    else
        printNo
        SUCCESS=1
    fi
}

function checkForLoopTag
{
    printTest "3" ":loop tag used in docker-compose."
    used=$(cat "$KMOMPATH/maze2/docker-compose.yml" | grep ":loop")

    if [[ ! -z "$used" ]]; then
        printYes
    else
        printNo
        SUCCESS=1
    fi
}

function checkDockerHubLines
{
    printTest "4" "The file 'dockerhub.txt' contains only $2 row(s)."
    cat "$KMOMPATH/$1/dockerhub.txt" | wc -l
    lines=$(cat "$KMOMPATH/$1/dockerhub.txt" | wc -l)

    if [[ "$lines" -eq "$2" ]]; then
        printYes
    else
        printNo
        SUCCESS=1
    fi
}
