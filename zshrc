# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Welcome

echo "Welcome back, using VI mode, $USERNAME"

# VIM 
bindkey -v

# Architecture dependent scripts

arch_name="$(uname -m)"

echo "Running an interactive ${arch_name} shell"

if [ "${arch_name}" = "x86_64" ]; then
    source /usr/local/share/antigen/antigen.zsh
elif [ "${arch_name}" = "arm64" ]; then
    source /opt/homebrew/share/antigen/antigen.zsh
    eval $(/opt/homebrew/bin/brew shellenv)
fi

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme robbyrussell
antigen apply

# Styling

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

function mkcd() {
    mkdir -p "$@" && cd "$_";
}

setopt prompt_subst

## Syntax highligthing for `man` pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS=""
export NULLCMD=bat
export N_PREFIX="$HOME/.n"

typeset -U path

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

path=(
    "$N_PREFIX/bin"
    $path
)

PROMPT='%F{014}%n %F{013}%B%2d%f%b %F{010}$(git_branch_name)%f %B>>%b '
RPROMPT='%F{015}%T%f'

alias ls="exa -laFh --git"
alias lstree="exa --tree --level=3"
alias trail="<<<${(F)path}"
export HOMEBREW_BREWFILE=~/.dotflines/Brewfile
alias brewfile="brew bundle dump --force --describe"
alias node="/opt/homebrew/bin/node"
alias python="/Users/andynadal/.pyenv/versions/3.10.14/bin/python"

alias rm=trash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf 
killall gpg-agent
