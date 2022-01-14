echo "STEP 1 - Update Homebrew"
source .zshrc

brew update
brew upgrade
brew bundle --file ~/.dotfiles/Brewfile