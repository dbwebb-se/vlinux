#!/usr/bin/env bash

red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
normal=$(tput sgr 0)

printf ">>> -------------- Post inspect -------------------------\n"


docker ps -a | grep "bthloggen" | awk '{print $1}' | xargs docker stop
docker ps -a | grep "bthloggen" | awk '{print $1}' | xargs docker rm
docker images -a |  grep "bthloggen" | awk '{print $3}' | xargs docker rmi -f

# docker images -a |  grep "vlinux-mazeclient" | awk '{print $3}' | xargs docker rmi -f

# docker stop myserver && docker rm myserver
# docker stop maze-server && docker rm maze-server
# docker stop myclient && docker rm myclient
# docker stop maze-client && docker rm maze-client