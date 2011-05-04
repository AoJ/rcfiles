if [ -n "$PS1" ]; then
  source ~/.bash/aliases
  source ~/.bash/paths
  source ~/.bash/config
  source ~/.bash/functions
  source ~/.bash/welcome

  if [ -f ~/.localrc ]; then
    . ~/.localrc
  fi
fi

if [ -f ~/.localrc_end ]; then
  . ~/.localrc_end
fi

