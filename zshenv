echo "Hello, .zshenv file loaded"

function exists() {
    command -v $1 >/dev/null 2>&1
}
