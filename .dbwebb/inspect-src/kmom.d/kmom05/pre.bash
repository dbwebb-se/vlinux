#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

printf ">>> -------------- dbwebb test kmom05 -------------------------\n"

dbwebb test "kmom05"

echo "Press any key to continue."
read

printf ">>> -------------- Pre inspect -------------------------\n"



cd me/kmom05/maze || exit 1

path=$(pwd)

# View server Dockerfile
printf "${cyan}\n"
read -r -p "View Server Dockerfile? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    cd "$path/server" && more Dockerfile
fi

# View Client Dockerfile
printf "${cyan}\n"
read -r -p "View Client Dockerfile? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    cd "$path/client" && more Dockerfile
fi

# View dockerhub.bash
printf "${cyan}\n"
read -r -p "View dockerhub.bash? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    echo $path
    cd "$path/../" && more dockerhub.bash
fi

# Execute dockerhub.bash
printf "${cyan}\n"
read -r -p "Execute dockerhub.bash? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    # student=$(sed -n -E 's/.*\s([a-zA-Z0-9]+)[/].*server.*/\1/p' kmom05.bash)

    cd "$path/../" && chmod +x dockerhub.bash && ./dockerhub.bash

    # printf "${cyan}>>> -------------- Clean up -------------------------\n${normal}"

    # read -p "Press any key to delete the image(s)."

    # docker rmi -f "$student/vlinux-mazeserver:latest"
    # docker rmi -f "$student/vlinux-mazeclient:latest"
fi
