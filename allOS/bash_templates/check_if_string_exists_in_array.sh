#!/bin/bash

strings=("ala" "je" "kotki" "bo są zdrowe")

look_for="ala"; [ -n "$(printf '%s\0' "${strings[@]}" | grep -F -x -z -- "${look_for}")" ] && echo "\"${look_for}\" is in strings" || echo "\"${look_for}\" is not in strings"
look_for="a"; [ -n "$(printf '%s\0' "${strings[@]}" | grep -F -x -z -- "${look_for}")" ] && echo "\"${look_for}\" is in strings" || echo "\"${look_for}\" is not in strings"
look_for="bo są zdrowe"; [ -n "$(printf '%s\0' "${strings[@]}" | grep -F -x -z -- "${look_for}")" ] && echo "\"${look_for}\" is in strings" || echo "\"${look_for}\" is not in strings"
look_for="bo są"; [ -n "$(printf '%s\0' "${strings[@]}" | grep -F -x -z -- "${look_for}")" ] && echo "\"${look_for}\" is in strings" || echo "\"${look_for}\" is not in strings"

