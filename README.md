# .dotfiles configurations

## Sim Links

To add files to this repo, you'll need to create a `symlink`, in the home directory,
so the system can use the files, and without needing to copy and sync them to this repo.

```
$ ln -s ~/.dotfiles/.your-file ~/.your-file
```

## Homebrew

### Install homebrew

#### Install globally
`/bin/bash -c "$(curl - fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`

#### Install in arm64

Required to install some dependencies

`cd /opt`
`sudo git clone https://github.com/Homebrew/brew homebrew`
`sudo chown -R $(whoami) /opt/homebrew`
`eval "$(homebrew/bin/brew shellenv)"`
`brew update --force --quiet`
`chmod -R go-w "$(brew --prefix)/share/zsh"`

Pass the brewfile location
`brew bundle --file ~/.dotfiles/Brewfile`

`brew bundle dump --describe`



