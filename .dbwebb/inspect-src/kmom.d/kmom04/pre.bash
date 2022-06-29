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

cd me/kmom04/ || exit 1

printf ">>> -------------- Pre inspect -------------------------\n"

read -p "View dockerhub.bash? [Y/n]" answer

if [[ "$answer" != "n" ]]; then
    printthisfile "dockerhub.bash"
fi

read -p "Press any key to execute dockerhub.bash"

mkdir server/temp
cp ../../example/json/* server/temp/

chmod +x dockerhub.bash
bash dockerhub.bash server/temp

eval "$BROWSER" "http://localhost:8080" &

read -p "[CHECK BROWSER] Press any key to continue."

# read -p "Press any key to delete the image."
#
# docker images -a |  grep "vlinux-vhost" | awk '{print $3}' | xargs docker rmi -f
