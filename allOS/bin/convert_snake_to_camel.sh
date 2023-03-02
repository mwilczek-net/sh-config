#!/usr/bin/env zsh

got_underscore=1

while read -sk1 -u0 c
do
    if [[ "${c}" == "_" ]]; then
        got_underscore=0
    elif [[ $got_underscore -eq 0 ]]; then
        got_underscore=1
        echo -n "${c}" | tr '[:lower:]' '[:upper:]'
    else
        echo -n "${c}"
    fi
done
