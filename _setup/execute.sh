#!/bin/bash

# --------------------------------------------- #
# | Dotfile's main setup
# --------------------------------------------- #

# Show text
print_info "Setting up installation"

# Initializing git modules
git submodule update --init --recursive
print_result $? "Initializing git modules"
print_success "Everything is OK!"; sleep 2

# --------------------------------------------- #
# | Setup shell configurations
# --------------------------------------------- #
print_info "Setup shell configurations"

# Change shell to zsh if needed
if ! [ $SHELL = $(which zsh) ]; then
    chsh -s $(which zsh)
    print_result $? "Changed shell to ZSH"
else
    print_success "ZSH is already your shell, horray!"
fi

# --------------------------------------------- #
# | Creating symlinks
# --------------------------------------------- #
print_info "Creating symlinks"

# symlinking process
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ]; then
        print_error "~${target#$HOME} already exists, Skipping."
    else
        ln -s $file $target
        print_result $? "Creating symlink for $file"
    fi
done

# --------------------------------------------- #
# | Setting up OSX
# --------------------------------------------- #
print_info "Setup OSX configurations"

# First Check that we're on a Mac
if ! [ "$(uname -s)" == "Darwin" ]; then
    print_error "I SAID AT THE BEGINING THAT THESE DOTFILES ARE COMPATIBLE WITH MAC ONLY!"
    print_error "Sorry, Exiting..."
    exit 1
fi
source ./osx/run_configurations.sh

# --------------------------------------------- #
# | Installing Homebrew and Cask
# --------------------------------------------- #
print_info "Installing Homebrew and Cask"
source ./osx/homebrew/install_homebrew_cask.sh

# --------------------------------------------- #
# | Installing Homebrew dependencies
# --------------------------------------------- #
print_info "Installing Homebrew dependencies"
source ./osx/homebrew/install_dependencies.sh

# --------------------------------------------- #
# | Installing Applications
# --------------------------------------------- #
print_info "Installing Applications"
source ./osx/applications/install_applications.sh

# --------------------------------------------- #
# | Setting applications settings
# --------------------------------------------- #
print_info "Setting applications settings"
source ./osx/applications/set_applications_settings.sh

# --------------------------------------------- #
# | Finito
# --------------------------------------------- #
print_info "Cleaning up..."
source ./_setup/clean.sh

# Say that we done
print_info_secondary "DONE. Enjoy your new system :)
 Review the console for errors"
