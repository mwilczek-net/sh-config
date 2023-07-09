#/bin/bash

CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
VENV_PATH="${CURRENT_PATH}/venv"

echo "Execution dir: '${CURRENT_PATH}'"
echo "VENV dir: '${VENV_PATH}'"



source "${VENV_PATH}/bin/activate"

s-tui

deactivate

