#!/bin/bash

# --------------------------------------------- #
# | Install a hombrew / Cask package
# --------------------------------------------- #
brew_install() {

    # Arguments
    formula="$1"
    cmd="$2"

    # Check if Homebrew is installed
    if ! cmd_exists 'brew'; then
        print_error "$formula (\`brew\` is not installed)"
    fi

    # Install the specified formula
    eval "brew $cmd list $formula" &> /dev/null "$formula" & show_spinner $! $formula
    if [ $? -eq 0 ]; then
        print_success "$formula (already installed)"
    else
        execute "brew $cmd install $formula" "$formula"
    fi
}

# --------------------------------------------- #
# | Install an NPM package
# --------------------------------------------- #
npm_install() {

    # Arguments
    package="$1"

    # Check if NPM is installed
    if ! cmd_exists 'npm'; then
        print_error "$package (\`NPM\` is not installed)"
    fi

    # Install the specified package
    eval "npm list $package -g" &> /dev/null "$package" & show_spinner $! $package
    if [ $? -eq 0 ]; then
        print_success "$package (already installed)"
    else
        execute "npm install $package -g" "$package"
    fi
}
