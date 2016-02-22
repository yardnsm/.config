#!/bin/bash

# Imprting Stuff fro _setup
source _setup/utils/messages.sh
source _setup/utils/ask.sh

# Important Variables
DOTFILES=$HOME/dotfiles

# Initializing git modules
git submodule update --init --recursive
print_result $? 'Initializing git modules'

# --------------------------------------------- #
# | Setup shell configurations
# --------------------------------------------- #
print_info "Setup shell configurations"

# Change shell to zsh

if ! [ $SHELL = $(which zsh) ]; then
    chsh -s $(which zsh)
    print_result $? 'Changed shell to zsh'
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
        print_error "~${target#$HOME} already exists... Skipping."
    else
        ln -s $file $target
        print_result $? "Creating symlink for $file"
    fi
done
