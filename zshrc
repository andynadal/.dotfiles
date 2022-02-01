# Welcome

echo "Welcome back, $USERNAME"

# Architecture dependent scripts

arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
    source /usr/local/share/antigen/antigen.zsh
elif [ "${arch_name}" = "arm64" ]; then
    source /opt/homebrew/share/antigen/antigen.zsh
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

PROMPT='%F{014}%n %F{013}%B%2d%f%b %F{010}$(git_branch_name)%f %B>>%b '
RPROMPT='%F{015}%T%f'

alias ls="exa -laFh --git"
alias lstree="exa --tree --level=3"
alias brewfile="brew bundle dump --force --describe"
alias cdzeus="cd ~/dev/zeus/zeus-ios-sdk-new-generic-app"
alias xcode12="/Applications/Xcode-12.app/Contents/MacOS/Xcode"