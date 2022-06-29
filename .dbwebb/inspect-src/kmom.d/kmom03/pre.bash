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

cd me/kmom03/vhosts || exit 1

printf ">>> -------------- Pre inspect -------------------------\n"

echo "Press any key to view [dockerhub.bash?]"
read

# if [[ "$answer" != "n" ]]; then
printthisfile "dockerhub.bash"
# fi

echo "Press any key to execute [dockerhub.bash]"
read

mkdir "klwtest"
touch "klwtest/index.html"
echo "<h1>The magic script says everything is ok.</h1>" > "klwtest/index.html"
date >> "klwtest/index.html"


chmod +x dockerhub.bash
bash dockerhub.bash "klwtest"

eval "$BROWSER" "http://mysite.vlinux.se:8080" &

# read -p "Press any key to delete the image."
#
# docker images -a |  grep "vlinux-vhost" | awk '{print $3}' | xargs docker rmi -f
