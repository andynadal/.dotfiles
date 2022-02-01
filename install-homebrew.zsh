#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

arch_name="$(uname -m)"

if exists brew; then
    echo "--- Brew already installed, skipping instalation ---\n"
else 
    echo "--- Installing homebrew for architecture $arch_name ---\n"
    if [ "${arch_name}" = "x86_64" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    elif [ "${arch_name}" = "arm64" ]; then
        cd /opt
        sudo git clone https://github.com/Homebrew/brew homebrew
        sudo chown -R $(whoami) /opt/homebrew
        eval "$(homebrew/bin/brew shellenv)"
        brew update --force --quiet
        chmod -R go-w "$(brew --prefix)/share/zsh"
    fi
fi

brew bundle --verbose