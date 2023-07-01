#!/bin/bash

# Requires new_tab command. which can be found in bin directory
CURRENT_PATH="$(cd "$(dirname "$0")" && pwd -P)"

# Overwrite default shell for gnome terminal to open scripts with desired shell
# SHELL='/bin/zsh'

new_tab "Tab 1" ". '${CURRENT_PATH}/start_terminal/script_01.sh'"

