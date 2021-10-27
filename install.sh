echo "Setting up the dot files"

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

brew bundle --file ~/.dotfiles/Brewfile