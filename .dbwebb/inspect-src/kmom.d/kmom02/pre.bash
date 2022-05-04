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

printf ">>> -------------- Pre inspect -------------------------\n"

cd me/kmom02/script || exit 1

success=0

read -p "View dockerhub.bash? [Y/n]" answer

if [[ "$answer" != "n" ]]; then
    printthisfile "dockerhub.bash"
fi

read -p "Press any key to execute dockerhub.bash"

chmod +x dockerhub.bash
bash dockerhub.bash

read -p "Press any key to delete the image."

docker images -a |  grep "vlinux-commands" | awk '{print $3}' | xargs docker rmi

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
