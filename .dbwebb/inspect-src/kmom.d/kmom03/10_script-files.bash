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

cd me/kmom03/script || exit 1

echo "[$ACRONYM] Check for commands.bash, Dockerfile, dockerhub.txt"

files=(
    "commands.bash"
    "Dockerfile"
    "dockerhub.txt"
)

success=0
for path in "${files[@]}"; do
    if [[ ! -f $path ]]; then
        printerror "Missing file" "$path"
        success=1
    fi
done

ls -al

exit $success