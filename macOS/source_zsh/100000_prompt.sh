
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="\$vcs_info_msg_0_ %(?.%F{green}√.%F{red}?%?)%f"
PROMPT='%F{green}[%f%*%F{green}]%f%F{green}[%f%~%f%b%F{green}]%f%# '
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%f'
zstyle ':vcs_info:*' enable git

# Git autocomplete
autoload -Uz compinit && compinit
