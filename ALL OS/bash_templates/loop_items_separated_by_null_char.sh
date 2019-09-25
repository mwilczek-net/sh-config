#!/bin/bash

FIND_PATH="/"

find "${FIND_PATH}" -iname '*.sh' -type f -print0 | xargs -0 -n 1 -I '{}' echo "{}";

FOUND_FILES="`find \"${FIND_PATH}\" -type f -print0`"
while IFS= read -r -d '' FILE_TO_PROCESS ; do
    echo "${FILE_TO_PROCESS}"
done <<<"${FOUND_FILES}"


while IFS= read -r -d '' FILE_TO_PROCESS ; do
    echo "${FILE_TO_PROCESS}"
done < <(find /some/path -type f -print0)

