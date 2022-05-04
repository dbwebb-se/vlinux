#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

function printthisfile
{
    printf "\n${cyan}"
    more "$1"
    printf "${normal}\n"
}

function printerror
{
    printf "${red} $1 '%s'\n ${normal}" "$2"
}

cd me/kmom02/script || exit 1

read -p "View commands.bash? [Y/n]" answer

if [[ "$answer" != "n" ]]; then
    printthisfile "commands.bash"
    success=$(echo $?)
fi

exit $success
