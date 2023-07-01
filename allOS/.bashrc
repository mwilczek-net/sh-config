HISTFILESIZE=50000

# User's BIN added to path
export PATH=$PATH:$HOME/bin

# Execute source files
for SHRC_SOURCE_DIRECTORY in "$HOME/source_bash/" "$HOME/source/"; do
  if [ -n "$(ls -A $SHRC_SOURCE_DIRECTORY)" ]; then
    for SHRC_SOURCE_FILE in ${SHRC_SOURCE_DIRECTORY}*; do
      # echo "loading ${SHRC_SOURCE_FILE}"
      . "${SHRC_SOURCE_FILE}"
    done
  fi
done

# Remove SHRC_* variables
unset SHRC_SOURCE_DIRECTORY
unset SHRC_SOURCE_FILE


