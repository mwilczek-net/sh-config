#!/bin/zsh

SCRIPT_DIRECTORY="$(cd "$(dirname "$0")" && pwd -P)"
SOURCE_SCRIPT_DIRECTORY="$(cd "$(dirname "${(%):-%N}")" && pwd -P)"

echo "Current script: ${SCRIPT_DIRECTORY}"
echo "Current file even if script sourced with \". SCRIPT_PATH\": ${SOURCE_SCRIPT_DIRECTORY}"
