#!/bin/bash

# --------------------------------------------- #
# | Install a hombrew / Cask package
# --------------------------------------------- #
brew_install() {

    # Arguments
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r FORMULA="$2"
    declare -r CMD="$3"

    # Check if Homebrew is installed
    if ! cmd_exists 'brew'; then
        print_error "$FORMULA_READABLE_NAME (\`brew\` is not installed)"
    fi

    # Install the specified formula
    eval "brew $CMD list $FORMULA" &> /dev/null
    if [ $? -eq 0 ]; then
        print_success "$FORMULA_READABLE_NAME (already installed)"
    else
        execute "brew $CMD install $FORMULA" "$FORMULA_READABLE_NAME"
    fi
}
