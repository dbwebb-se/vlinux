#!/usr/bin/env bash
# shellcheck disable=SC1091
. "functions.bash"

declare -a files=(
    "cal.png"
    "info.txt"
    "answers"
    )

# Print the header for the testsuite
header "$1" "$2" "$3"

# CHeck if the files exists and have correct filename
checkIfFilesExist "${files[@]}"

exit "$(isSuccess)"
