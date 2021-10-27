# .dotfiles configurations

## Sim Links

To add files to this repo, you'll need to create a `symlink`, in the home directory,
so the system can use the files, and without needing to copy and sync them to this repo.

`ln -s ~/.dotfiles/.your-file ~/.your-file`

## Homebrew

Install homebrew
`/bin/bash -c "$(curl - fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`

Pass the brewfile location
`brew bundle --file ~/.dotfiles/Brewfile`

`brew bundle dump --describe`
