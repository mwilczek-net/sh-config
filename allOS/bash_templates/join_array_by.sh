#!/bin/bash

function join_array_by_single_char {
    local IFS="${1}"; shift; echo "$*";
}

function join_array_by_string {
    local separator="$1"
    shift

    local first_element="$1"
    shift

    printf "%s" "${first_element}" "${@/#/$separator}"
}

files="$(find * -iname '*.sh' -print0 | xargs -0 realpath)"

join_array_by_single_char '|' ${files[@]}

echo =======

join_array_by_string ' [separator string] ' ${files[@]}


