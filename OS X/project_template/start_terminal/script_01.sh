#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
PROJECT_DESTINATION="${CURRENT_PATH}/../"

echo "Welcome in script 01"

echo "Going to: \"${PROJECT_DESTINATION}\""

cd "${PROJECT_DESTINATION}"

