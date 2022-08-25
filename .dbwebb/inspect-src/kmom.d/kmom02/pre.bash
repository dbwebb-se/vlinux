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

printf ">>> -------------- dbwebb test kmom02 -------------------------\n"

dbwebb test "kmom02"

echo "Press any key to continue."
read



printf ">>> -------------- Pre inspect -------------------------\n"

cd me/kmom02 || exit 1

success=0

echo "Press any key to view [dockerhub.bash]"
read

# if [[ "$answer" != "n" ]]; then
printthisfile "dockerhub.bash"
# fi

echo "Press any key to execute dockerhub.bash"
read

chmod +x dockerhub.bash
bash dockerhub.bash

echo "Press any key to delete the image."
read

docker images -a |  grep "vlinux-commands" | awk '{print $3}' | xargs docker rmi -f

# if [[ -f  "dockerhub.txt" ]]; then
#     url=""
#     echo ""
#     read -p "Press any key to view dockerhub.txt"
#     printthisfile "dockerhub.txt"
#
#     read -p "Good to go? [Y/n]" answer
#
#     if [[ "$answer" != "n" ]]; then
#         url=$(< dockerhub.txt)
#     else
#         read -p "Type the information manually (username/imagename:tag): " url
#     fi
#
#     docker run --rm -it "$url"
#     read -p "Press any key to delete the image."
#     docker rmi -f "$url"
#     read -p "Image gone. Press any key to move on."
# fi

exit $success
