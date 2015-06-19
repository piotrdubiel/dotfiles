# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aaa"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby gem rvm bundler python pip virtualenvwrapper gradle brew nyan taskwarrior)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

#export PATH="/Users/piotrekd/.rvm/gems/ruby-2.1.1/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/android-sdk/platform-tools:$PATH"
export PATH="/opt/android-sdk/tools:$PATH"
export PATH="/opt/android-ndk:$PATH"
export PATH="$HOME/workspace/idb:$PATH"
export PATH="$HOME/workspace/dotfiles/bin:$PATH"
export PATH="$HOME/external:$PATH"


export NDK_ROOT="/opt/android-ndk"
export ANDROID_NDK_HOME=$NDK_ROOT
export ANDROID_HOME="/opt/android-sdk"
export APIARY_API_KEY=74ac3dae26f97add3ab25245fbccd949

# NVM
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

# GO
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOROOT/bin

source ~/external/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down

# Setup zsh-autosuggestions
source ~/external/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

archey -c

export PATH=./node_modules/.bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
eval $(boot2docker shellinit)

# added by travis gem
[ -f /Users/piotrekd/.travis/travis.sh ] && source /Users/piotrekd/.travis/travis.sh

PERL_MB_OPT="--install_base \"/Users/piotrekd/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/piotrekd/perl5"; export PERL_MM_OPT;
