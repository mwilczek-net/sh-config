function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function git_names {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[0m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  # case $TERM in
  #   xterm*)
  #   local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
  #   ;;
  #   *)
  #   local TITLEBAR=""
  #   ;;
  # esac
  
  local prompt_time="$GREEN[$WHITE\t$GREEN]"
  local prompt_path="$GREEN[$WHITE\w$GREEN]"
  
  # PS1="${TITLEBAR}\ # optional - change tab names
  PS1="${prompt_time}${prompt_path}${RED}\$(parse_git_branch)${WHITE}\$ "
  PS2='> '
  PS4='+ '
}

git_names;

