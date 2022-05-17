#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "bash2/answer.bash"
    "script/commands.bash"
    "script/dockerhub.txt"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"
checkDockerHubLines "script/" "1"

exit "$(isSuccess)"
