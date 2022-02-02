#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

arch_name="$(uname -m)"

if exists brew; then
    echo "--- Brew already installed, skipping instalation ---\n"
else 
    echo "--- Installing homebrew for architecture $arch_name ---\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ "${arch_name}" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

brew bundle --verbose