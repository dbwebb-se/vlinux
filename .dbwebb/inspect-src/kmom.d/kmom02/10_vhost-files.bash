#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

e() { exit; }; export -f e
f() { exit 1; }; export -f f

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

cd me/kmom02/vhost || exit 1

echo "[$ACRONYM] Check for dump.png, log.txt and me.linux.se.conf"

files=(
    "dump.png"
    "log.txt"
    "me.linux.se.conf"
)

success=0
ls -al
for path in "${files[@]}"; do
    if [[ ! -f $path ]]; then
        printerror "Missing file" "$path"
        success=1
    fi
done

exit $success
