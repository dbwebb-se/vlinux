#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "bash2/answer.bash"
    "vhosts/dump.png"
    "vhosts/Dockerfile"
    "vhosts/mysite.vlinux.se.conf"
    "dockerhub.bash"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"

exit "$(isSuccess)"
