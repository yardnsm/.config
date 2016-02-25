#!/bin/bash

# --------------------------------------------- #
# | Install a hombrew / Cask package
# --------------------------------------------- #
brew_install() {

    # Arguments
    declare -r FORMULA="$1"
    declare -r CMD="$2"

    # Check if Homebrew is installed
    if ! cmd_exists 'brew'; then
        print_error "$FORMULA (\`brew\` is not installed)"
    fi

    # Install the specified formula
    eval "brew $CMD list $FORMULA" &> /dev/null
    if [ $? -eq 0 ]; then
        print_success "$FORMULA (already installed)"
    else
        execute "brew $CMD install $FORMULA" "$FORMULA"
    fi
}

# --------------------------------------------- #
# | Install an NPM package
# --------------------------------------------- #
npm_install() {

    # Arguments
    declare -r PACKAGE="$1"

    # Check if NPM is installed
    if ! cmd_exists 'npm'; then
        print_error "$PACKAGE (\`NPM\` is not installed)"
    fi

    # Install the specified package
    eval "npm list $PACKAGE -g" &> /dev/null
    if [ $? -eq 0 ]; then
        print_success "$PACKAGE (already installed)"
    else
        execute "npm install $PACKAGE -g" "$PACKAGE"
    fi
}
