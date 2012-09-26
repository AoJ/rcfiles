source ~/.zsh/aliases
source ~/.zsh/completion
source ~/.zsh/config
source ~/.zsh/prompt
source ~/.zsh/paths
source ~/.zsh/welcome

if [ -f ~/.localrc ]; then
. ~/.localrc
fi

if [ -f ~/.localrc_end ]; then
  . ~/.localrc_end
fi

