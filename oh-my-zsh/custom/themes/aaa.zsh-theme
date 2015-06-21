# vim:ft=zsh
autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

directory () {
    if [[ x$PWD = x$HOME ]] {
        echo '%B%F{blue}⌂'
    } else {
      echo '%B%F{blue}%c'
    }
}

current_time () {
    date +"[%H:%M]"
}

setopt prompt_subst

PROMPT='$(current_time) $(directory)%B%F{green}${vcs_info_msg_0_} ${ret_status}%{$reset_color%} '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
