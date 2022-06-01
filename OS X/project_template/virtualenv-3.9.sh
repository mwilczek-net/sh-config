#!/bin/sh

CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"

PYTHON_3_9="$(which python3.9)"
ENV_DIR="${CURRENT_PATH}/.venv/python3.9"
REQUIREMENTS_PATH="${CURRENT_PATH}/pip-requirements.txt"

init_required=""

if ! [ -d "${ENV_DIR}" ]; then
  echo "!! Init required !!"
  init_required="yes"
fi

echo
echo "Python binary: \"${PYTHON_3_9}\""
echo


if [ -n "${init_required}" ]; then
  echo "Creating VIRTUAL ENV"
  echo
  
  virtualenv "${ENV_DIR}" --python="${PYTHON_3_9}"

  echo
  echo "Virtual env created: \"${ENV_DIR}\""
  echo
fi

source "${ENV_DIR}/bin/activate"

if [ -n "${init_required}" ]; then
  echo
  echo "Creating Installing requirements"
  echo
  
  pip install -r "${REQUIREMENTS_PATH}"
fi

echo
echo "Virtual env activated"
echo "To deactivate Virtual env use \"deactivate\""
echo

python --version
