#!/bin/bash

# --------------------------------------------- #
# | Symlinking process
# --------------------------------------------- #
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
