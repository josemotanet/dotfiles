# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# General options {{{

HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
setopt clobber

export LANG=en_US.UTF-8
export EDITOR=vim
export TERMINAL=urxvtc
export GOPATH=/home/jose/.go

export PATH=$PATH:/usr/local/sbin:$HOME/bin:$HOME/bin/scripts:/usr/local/heroku/bin:$HOME/.yarn/bin:$GOPATH/bin

zstyle :compinstall filename '/home/jose/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -U add-zsh-hook
setopt PROMPT_SUBST

set -o emacs

RPROMPT='%~%{$fg[yellow]%}$(git_branch)%{$reset_color%}$(git_status)'
PROMPT="%{$fg[yellow]%}▶ %{$reset_color%}"
TERM="screen-256color"

# }}}

### Functions {{{

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc

function git_status() { # {{{
  local st="$(git status 2> /dev/null)"
  local ret=""
  local color="green"

  if [[ $st == *Untracked* ]] then
    ret="${ret} @"
    color="magenta"
  fi

  if [[ $st == *"not staged for commit"* ]] then
    ret="${ret} ?"
    color="red"
  fi

  if [[ $st == *"to be committed"* ]] then
    ret="${ret} !"
    color="yellow"
  fi

  if [[ $st == *clean* ]] then
    ret="${ret} \u2713"
    color="green"
  fi

  echo "%{$fg[$color]%}$ret%{$reset_color%}"
} # }}}

function git_branch() { # {{{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
} # }}}

function openemacs() {
  emacsclient -c $@ &; disown
}

# }}}

### Alias {{{

alias be="bundle exec"
alias g=git
alias hub=git-hub
alias ls='ls --color=auto'
alias r="bundle exec rails"
alias v=vim
alias e=openemacs
alias ec="emacsclient -nw"
alias dc=docker-compose
alias d=docker
alias y=yarn
alias cdp="source cdproject"

# }}}

# Source external applications {{{

source ~/.zshenv
source ~/.nvm/nvm.sh
# source /usr/share/chruby/chruby.sh
# source /usr/share/chruby/auto.sh
test -s ~/.kiex/scripts/kiex && source ~/.kiex/scripts/kiex
test -s direnv && eval "$(direnv hook zsh)"
test -s ~/.config/shell/less_termcap.sh && source ~/.config/shell/less_termcap.sh

# }}}

# vim: foldmethod=marker foldmarker={{{,}}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias dnfi="sudo dnf install -y"

if [ -f ~/.config/exercism/exercism_completion.zsh  ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

grep --quiet Microsoft /proc/version 2>/dev/null && [[ "$(umask)" == '000' ]] && umask 022
