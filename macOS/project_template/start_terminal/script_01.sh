#!/bin/bash

# In case of importing script with '. SCRIPT_NAME'
case $(basename "${SHELL}") in
  bash)
    echo 'Current shell BASH'
    CURRENT_PATH="$(cd "$(dirname "$BASH_SOURCE")" && pwd -P)"
    ;;
  zsh)
    echo 'Current shell ZSH'
    CURRENT_PATH="$(cd "$(dirname "${(%):-%N}")" && pwd -P)"
    ;;
  *)
    echo 'Unknown shell'
    CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
    ;;
esac

PROJECT_DESTINATION="${CURRENT_PATH}/../"


echo "Welcome in script 01"

echo "Going to: \"${PROJECT_DESTINATION}\""

cd "${PROJECT_DESTINATION}"

