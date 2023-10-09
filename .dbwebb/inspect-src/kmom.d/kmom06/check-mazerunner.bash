#!/usr/bin/env bash

. ".dbwebb/inspect-src/kmom.d/colors.bash"


# red=$(tput setaf 1)
# green=$(tput setaf 2)
# cyan=$(tput setaf 6)
# normal=$(tput sgr 0)

cd "me/kmom06/maze2/client"

printf "${CYAN}\n"
echo "Press any key to view mazerunner.bash?"
read
printf "${NORMAL}\n"

# if [[ ! "$response" = "n" ]]; then
more "mazerunner.bash"
# fi
