#!/bin/bash

RED="\033[0;31m"
LIGHT_RED="\033[1;31m"
GREEN="\033[0;32m"
LIGHT_GREEN="\033[1;32m"
GRAY="\033[0;37m"
LIGHT_GRAY="\033[1;37m"
MAGENTA="\033[0;35m"
LIGHT_MAGENTA="\033[1;35m"
RESET="\033[0m"


function skip_hook_if_config {
    SKIP_HOOK_GIT=$(git config --bool hooks.empty.hook.skip)
    SKIP_HOOK_BASH=${GIT_HOOKS_EMPTY_HOOK_SKIP}

    if [ "${IGNORE_COMMITED_GIT}" == "true" ]; then
        printf "${MAGENTA}"
        echo "--- SKIPPING due to git config"
        echo
        printf "${RESET}"

        exit 0;
    fi

    if [ "${IGNORE_COMMITED_BASH}" == "true" ]; then
        printf "${MAGENTA}"
        echo "--- SKIPPING due to BASH variable"
        echo
        printf "${RESET}"

        exit 0;
    fi
}

function hook_body {
    problem_flag=false
    if $problem_flag; then
        printf "${LIGHT_RED}"
        echo
        echo "EMPTY HOOK problem message"
        echo
        echo "Problem details"
        echo
        printf "${RESET}"

        exit 1;
    fi
}


echo
echo "--- EMPTY HOOK example"
echo "        EMPTY HOOK can be skipped 'git config --bool hooks.empty.hook.skip true' or BASH variable 'GIT_HOOKS_EMPTY_HOOK_SKIP=true'"

skip_hook_if_config;
hook_body;


echo "--- EMPTY HOOK example - OK"
echo

exit 0;
