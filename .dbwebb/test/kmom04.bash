#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "client/client.bash"
    "server/Dockerfile"
    "dockerhub.bash"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"
# checkDockerHubLines "server/" "2"
checkDbwebbPort "client/client.bash"

exit "$(isSuccess)"
