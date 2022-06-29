#!/usr/bin/env bash
. ".dbwebb/inspect-src/kmom.d/colors.bash"

# red=$(tput setaf 1)
# green=$(tput setaf 2)
# cyan=$(tput setaf 6)
# normal=$(tput sgr 0)

function printthisfile
{
    printf "\n${CYAN}"
    cat "$1"
    printf "${NORMAL}\n"
}

function printerror
{
    printf "${RED} $1 '%s'\n ${NORMAL}" "$2"
}

cd me/kmom02/script || exit 1

echo "Press any key to view [commands.bash]"
read

# if [[ "$answer" != "n" ]]; then
printthisfile "commands.bash"
#     success=$(echo $?)
# fi

# exit $success
