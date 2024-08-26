echo "Setting up the dot files"

echo "STEP 1 - Symlinks"
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

echo "STEP 2 - Homebrew"
brew bundle --file ~/.dotfiles/Brewfile