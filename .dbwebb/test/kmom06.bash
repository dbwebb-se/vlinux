#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "awk/1.awk"
    "awk/2.awk"
    "awk/3.awk"
    "awk/4.awk"
    "awk/5.awk"
    "awk/6.awk"
    "awk/7.awk"
    "awk/8.awk"
    "awk/9.awk"
    "sed1/answer.bash"
    "maze2/client/mazerunner.bash"
    "maze2/docker-compose.yml"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"
# checkForLoopTag

exit "$(isSuccess)"
