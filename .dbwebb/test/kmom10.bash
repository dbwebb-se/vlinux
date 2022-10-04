#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "bthloggen/log2json.bash"
    "bthloggen/docker-compose.yml"
    "bthloggen/client/bthloggen.bash"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"
# checkForLoopTag

exit "$(isSuccess)"
