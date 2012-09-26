# COMPLETION
autoload -Uz compinit
compinit
zmodload -a complist
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache
zstyle :compinstall filename "$HOME/.zshrc"

# GIT
__git_files () {
	_wanted files expl 'local files' _files
}

# HISTORY
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt extended_history

setopt no_beep
setopt extendedglob
setopt prompt_subst
setopt complete_in_word
setopt no_auto_menu
setopt no_always_last_prompt
setopt promptsubst
setopt autopushd
setopt pushdignoredups

# KEYBOARD STUFF
autoload -U edit-command-line
zle -N edit-command-line
bindkey -e
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '\C-v' edit-command-line
bindkey '\Ea' push-line
local WORDCHARS=${WORDCHARS//\//}

# PROMPT
rem_hostname=`[[ -n $SSH_CLIENT ]] && hostname`

autoload colors
colors
bright_cyan='%{[96m%}' # not provided by colors
#PROMPT="%(${SSH_CLIENT}..%m):%{${fg_bold[blue]}%}%30<...<%~%<<%{${reset_color}%}# "
PROMPT="${rem_hostname}"
RPROMPT="%(?..%{$fg_bold[red]%}%? %{$reset_color%})" # exit status
autoload -Uz vcs_info
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}*"
zstyle ':vcs_info:*' stagedstr "%{$fg[red]%}+"
zstyle ':vcs_info:*' formats "$bright_cyan%b%u%c"
zstyle ':vcs_info:*' actionformats "$bright_cyan%b%u%c|%a"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:*' enable git hg bzr svn cvs
precmd () { vcs_info }
RPROMPT+='${vcs_info_msg_0_}'
RPROMPT+="%{$reset_color%}"

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -bx | vim -c 'set ft=man' -\""
export GREP_COLORS='ms=01;36:mc=01;31:sl=:cx=:fn=35:ln=33:bn=33:se=01;34'

alias ls='ls --color=auto -hv --group-directories-first'
alias ll='ls -l'
alias l.='ls -Ad .*'
alias la='ls -A'
alias grep='grep --color -s'
alias df='df -hx tmpfs'
alias du='du --max-depth=1'
alias sr='screen -r'
alias gil='git log --graph --abbrev-commit --stat -C --decorate --date=local'
alias gib='git branch -a'
alias gis='git status'
alias gid='git diff -C --date=local'
alias giw='git show -C --date=local --decorate'
alias gic='git checkout'
alias gibl='gil master..HEAD'

stty stop undef
