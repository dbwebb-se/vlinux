#!/usr/bin/env bash

filename="me/kmom01/structure/answers"

echo "Checking exercise 2: 'Struktur'."




# cd me/kmom01/install || exit 1
#
function printthisfile
{

    printf "\n${CYAN}"
    more "$1"
    printf "${NORMAL}\n"
}
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
printthisfile "$filename"
read -p "Done with viewing file?"

rsync -avq --exclude="answers" example/structure/* me/kmom01/structure/
# cp -r example/structure/!(answers) "me/kmom01/ex2/"
# mv "$filename" "me/kmom01/structure/"
cd "me/kmom01/structure" || exit 1

printf "${YELLOW}"
bash answers && tree .
printf "${NORMAL}"

# ls -al
# pwd
# fi
#
# exit $success
