#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions will be managed by `n`, installed via HomeBrew.
# See zshrc for N_PREFIX variable, appended to the PATH.

if exists node; then
    echo "Node $(node --version) and NPM $(npm --version) already installed"    
else 
    echo "Installing Node and NPM using n..."
    n lts 
fi

## installing global NPM packages

npm install --global typescript
npm install --global json-server

echo "Global NPM packages installed"
npm list --global --depth=0