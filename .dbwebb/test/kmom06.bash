#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "maze2/client/mazerunner.bash"
    "maze2/docker-compose.yml"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"
checkForLoopTag

exit "$(isSuccess)"
