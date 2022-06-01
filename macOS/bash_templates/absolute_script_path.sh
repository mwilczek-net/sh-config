#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"

PATH_OF_SCRIPT="$(cd "$(dirname "$BASH_SOURCE")" && pwd -P)"

echo "Current script: ${CURRENT_PATH}"
echo "Current file even if script sourced with \". SCRIPT_PATH\": ${PATH_OF_SCRIPT}"
