#!/bin/bash

# --------------------------------------------- #
# | Symlinking process
# --------------------------------------------- #
print_info_secondary "Symlinking files"
symlinks=$( find -H "$DOTFILES"/symlinks -maxdepth 3 -name '*.symlink' )
for file in $symlinks; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ]; then
        print_error "~${target#$HOME} already exists, Skipping."
    else
        ln -s $file $target &> /dev/null
        print_result $? "Creating symlink for $file"
    fi
done

# --------------------------------------------- #
# | Copying process
# --------------------------------------------- #
print_info_secondary "Copying files"
copies=$( find -H "$DOTFILES"/copies -maxdepth 3 -name '*.copy' )
for file in $copies; do
    target="$HOME/.$( basename $file ".copy" )"
    if [ -e $target ]; then
        print_error "~${target#$HOME} already exists, Skipping."
    else
        if [ -d $file ]; then
            cp -r $file $target &> /dev/null
        else
            cp $file $target &> /dev/null
        fi
        print_result $? "Creating copy for $file"
    fi
done
