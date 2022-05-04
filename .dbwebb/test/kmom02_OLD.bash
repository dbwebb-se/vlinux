#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "bash1/answer.bash"
    "vhost/dump.png"
    "vhost/me.linux.se.conf"
    "vhost/log.txt"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"

exit "$(isSuccess)"
