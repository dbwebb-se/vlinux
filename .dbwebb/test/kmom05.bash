#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "sed1/answer.bash"
    "maze/client/mazerunner.bash"
    "maze/client/Dockerfile"
    "maze/server/Dockerfile"
    "maze/kmom05.bash"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# Check if the files exists and have correct filename
checkIfFilesExist "${files[@]}"
checkForSudoKmom05

exit "$(isSuccess)"
