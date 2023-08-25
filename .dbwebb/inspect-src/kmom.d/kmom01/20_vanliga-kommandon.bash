#!/usr/bin/env bash

. ".dbwebb/inspect-src/kmom.d/colors.bash"

filename="info.bash"


echo "Checking exercise 1: 'vanliga kommandon'."
echo "Do not forget to look at the screenshot!"

cd me/kmom01/commands || exit 1
#
function printthisfile
{
    printf "\n${YELLOW}"
    cat "$1"
    printf "${NORMAL}\n"
}
#
# function printerror
# {
#     printf "${red} $1 '%s'\n ${normal}" "$2"
# }
#
printthisfile "$filename"


printf "\n${CYAN}"

while read com; do
    echo ">>> "
    eval "$com"

done < "$filename"

printf "\n${NORMAL}"

echo ""
echo "Press any key to continue."
read
