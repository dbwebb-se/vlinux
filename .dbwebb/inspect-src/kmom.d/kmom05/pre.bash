#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

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

# View kmom05.bash
printf "${cyan}\n"
read -r -p "View kmom05.bash? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    cd "$path" && more kmom05.bash
fi

# Execute kmom05.bash
printf "${cyan}\n"
read -r -p "Execute kmom05.bash? [Y/n] " response
printf "${normal}\n"

if [[ ! "$response" = "n" ]]; then
    student=$(sed -n -E 's/.*\s([a-zA-Z0-9]+)[/].*server.*/\1/p' kmom05.bash)

    cd "$path" && chmod +x kmom05.bash && ./kmom05.bash

    printf "${cyan}>>> -------------- Clean up -------------------------\n${normal}"

    read -p "Press any key to delete the image(s)."

    docker rmi -f "$student/vlinux-mazeserver:latest"
    docker rmi -f "$student/vlinux-mazeclient:latest"
fi
