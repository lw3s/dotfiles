#!/bin/bash

# environment variables
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export CC="gcc-14 -std=c23"
export CXX="g++-14 -std=c++23"

export BASH_SILENCE_DEPRECATION_WARNING=1

# aliases/functions
alias ll="ls -lah"
alias wt="git log --oneline --graph --all --decorate --date-order"

function rcv {
    if [[ "$#" = "1" ]] && [[ "$(git branch)" =~ "$1" ]] && [[ "$(git branch -r)" =~ "origin/$1" ]]; then
        git tag archive/$1 $1
        git branch -d $1
        git branch -dr origin/$1
        git push --tags
        git push -d origin $1
    fi
}

function rt {
    if cmake --build build 1>/dev/null < "$0"; then
        for i in $*; do
            printf "\n\033[1m"
            echo -n "$i" | tr "[:lower:]" "[:upper:]"
            printf "\033[0m\n"
            ./build/test$i
        done
    fi
}

# other
cd ~/Desktop
PS1='$(git branch --show-current 2>/dev/null) $(dirs +0) $ '
brew upgrade
clear

