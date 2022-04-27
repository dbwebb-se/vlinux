#!/usr/bin/env bash



echo "Running dbwebb test kmom01"

dbwebb test "kmom01"

read -p "Press any key to continue."
# cd me/kmom01/install || exit 1
#
# function printthisfile
# {
#
#     printf "\n${cyan}"
#     more "$1"
#     printf "${normal}\n"
# }
#
# function printerror
# {
#     printf "${red} $1 '%s'\n ${normal}" "$2"
# }
#
# echo "[$ACRONYM] Check for ssh.png and log.txt"
#
# files=(
#     "ssh.png"
#     "log.txt"
# )
#
# success=0
# for path in "${files[@]}"; do
#     if [[ ! -f $path ]]; then
#         printerror "Missing file" "$path"
#         success=1
#     fi
#     ls -al
# done
#
# if [[ $success -eq 0 ]]; then
#     printthisfile "log.txt"
# fi
#
# exit $success
