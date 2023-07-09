#/bin/bash

CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
VENV_PATH="${CURRENT_PATH}/venv"

echo "Execution dir: '${CURRENT_PATH}'"
echo "VENV dir: '${VENV_PATH}'"


mkdir -p "${VENV_PATH}"
python3.11 -m venv "${VENV_PATH}"
source "${VENV_PATH}/bin/activate"

pip install -r "${CURRENT_PATH}/requirements.txt"

deactivate

