#!/usr/bin/env bash

. ".dbwebb/inspect-src/kmom.d/colors.bash"

filename="me/kmom01/structure/answers"

echo "Checking exercise 2: 'Struktur'."




# cd me/kmom01/install || exit 1
#
function printthisfile
{

    printf "\n${CYAN}"
    cat "$1"
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
echo "Done with viewing file?"
read


rsync -avq --exclude="answers" example/structure/ me/kmom01/structure_temp/
cp me/kmom01/structure/answers me/kmom01/structure_temp/

# cp -r example/structure/!(answers) "me/kmom01/ex2/"
# mv "$filename" "me/kmom01/structure/"
cd "me/kmom01/structure_temp" || exit 1




printf "${YELLOW}"
bash answers && tree .
printf "${NORMAL}"


echo ""
echo "Press any key to continue."
read

# ls -al
# pwd
# fi
#
# exit $success
