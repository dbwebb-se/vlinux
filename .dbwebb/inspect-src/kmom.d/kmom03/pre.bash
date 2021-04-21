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

cd me/kmom03/script

success=0

if [[ -f  "dockerhub.txt" ]]; then
    url=""
    echo ""
    read -p "Press any key to view dockerhub.txt"
    printthisfile "dockerhub.txt"

    read -p "Good to go? [Y/n]" answer

    if [[ "$answer" != "n" ]]; then
        url=$(< dockerhub.txt)
    else
        read -p "Type the information manually (username/imagename:tag): " url
    fi

    docker run --rm -it "$url"
    read -p "Press any key to delete the image."
    docker rmi -f "$url"
    read -p "Image gone. Press any key to move on."
fi

exit $success
