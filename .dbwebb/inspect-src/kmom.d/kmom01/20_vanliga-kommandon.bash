#!/usr/bin/env bash

filename="me/kmom01/commands/info.txt"

echo "Checking exercise 1: 'vanliga kommandon'."
echo "Do not forget to look at the screenshot!"




# cd me/kmom01/install || exit 1
#
function printthisfile
{

    printf "\n${YELLOW}"
    more "$1"
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

    eval "$com"

done < "$filename"
printf "\n${NORMAL}"


read -p "\nNext exercise!"
