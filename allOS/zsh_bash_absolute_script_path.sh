
# If script was invoked normaly
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd -P)"

# If script included using . ./scritp.sh
if [ ! -z "${ZSH_NAME}" ]; then
    PATH_OF_FILE="$(cd "$(dirname "${(%):-%N}")" && pwd -P)"
elif [ ! -z "${BASH}" ]; then
    PATH_OF_FILE="$(cd "$(dirname "$BASH_SOURCE")" && pwd -P)"
else
    PATH_OF_FILE="./"
fi;
