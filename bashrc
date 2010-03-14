#####################################
# Setup 
#####################################

# SETUP RUBYGEMS
export GEM_PATH="$HOME/.gem/ruby/1.8"
export GEM_HOME="$HOME/.gem/ruby/1.8"
export RUBYOPT=rubygems

export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

# HISTORY CONTROL
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Include dot (.) files in the results of expansion
shopt -s dotglob
# Case-insensitive matching for filename expansion
shopt -s nocaseglob
# Enable extended pattern matching
shopt -s extglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Define some colors first:
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
grey='\[\e[0;37m\]'
NC='\[\e[0m\]'              # No Color
BOLD='\[\e[1m\]'

#####################################
# Prompt
#####################################

PS1="${BOLD}\$(mypwd) ${green}\$ ${NC}"  # simple prompt

export PS1="\[\e]0;\u@\h: \w\a\]$PS1" # simple title


#####################################
# Alias's 
#####################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
fi

alias terminal='xfce4-terminal'

# lets get around faster!
alias p='pushd'
alias o='popd'
alias n='pushd +1'

alias t='timetxt'
alias ta='timetxt -a'
alias tl='timetxt -l'
alias ts='timetxt -s'
alias tt='timetxt -t'

alias scannetwork='nmap -sP 192.168.2.0/24'

#####################################
# Welcome Screen 
#####################################
date

export RCFILES_UPDATED=$(git ls-remote ~/dev/rcfiles | cut -f 1 | uniq -c | awk '{print $1==4}')

if [[ $RCFILES_UPDATED == 0 ]]
  then echo -e "\nRCFILES repo is not up-to date."
fi

if [[ -s /home/carl/.rvm/scripts/rvm ]] ; then
  source /home/carl/.rvm/scripts/rvm ;
fi
