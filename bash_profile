export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH="$PATH:/opt/local/bin:$HOME/android-sdk/platform-tools/:/usr/local/opt/rabbitmq/sbin/"
export ANDROID_HOME="$HOME/android-sdk"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function set_colors {
  local GREEN_BOLD="\[\033[1;32m\]"  
  local GREEN="\[\033[0;32m\]"  
  local WHITE="\[\033[1;37m\]"
  local YELLOW="\[\033[0;33m\]"
  local RED="\[\033[1;31m\]"
  local EOC="\[\033[0m\]"
  export PS1="$YELLOW#\u>$EOC $GREEN_BOLD\w$EOC [\$?]$RED ∴ $EOC"
}
set_colors

alias c='clear'
alias i='ping -c 5 github.com'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# vim home
export MYVIMRC=$HOME/.vimrc

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace-djng
source /usr/local/bin/virtualenvwrapper.sh 

source $HOME/.git-completion.bash
source $HOME/.hg-completion.bash

source ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh 
