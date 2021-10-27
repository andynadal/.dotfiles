# Welcome

echo "Welcome back, $USERNAME"

# Antigen bundle manager

source /usr/local/share/antigen/antigen.zsh

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
    echo ' ('$branch')'
  fi
}

function mkcd() {
    mkdir -p "$@" && cd "$_";
}

setopt prompt_subst

PROMPT='%F{014}%n %F{013}%B%1d%f%b%F{010}$(git_branch_name)%f %B>>%b '
RPROMPT='%F{015}%T%f'

alias ls="ls -lAGFh"
alias lszeus="cd ~/dev/upax/zeus/ZEUS_NEW_GENERIC_APP_IOS"

