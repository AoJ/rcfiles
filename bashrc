[[ -z "$PS1" ]] && return

source ~/.bash/aliases
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/welcome

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi
