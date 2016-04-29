#!/bin/bash

# --------------------------------------------- #
# | Create folder function
# --------------------------------------------- #
create_folder() {

    # Arguments
    target="$HOME/$1"

    # Do that.
    if [ -f $target ]; then
        print_error "~/$1 already exists (file), Skipping."
    elif [ -d $target ]; then
        print_error "~/$1 already exists (directory), Skipping."
    else
        mkdir $target &> /dev/null
        print_result $? "Creating folder ~/$1"
    fi
}

# --------------------------------------------- #
# | Create workspace folders
# --------------------------------------------- #
create_folder "dev"
create_folder "dev/private"
create_folder "dev/github"
