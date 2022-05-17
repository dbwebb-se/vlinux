#!/usr/bin/env bash


read -p "Press any key to stop the container and delete image."

docker stop "$(docker ps -aqf 'name=mysite')"

docker images -a |  grep "vlinux-vhost" | awk '{print $3}' | xargs docker rmi -f
