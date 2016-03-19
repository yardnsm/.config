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
    else
        mkdir $target &> /dev/null
        print_result $? "Creating folder ~/$1"
    fi
}

# --------------------------------------------- #
# | Create workspace folders
# --------------------------------------------- #

# Ask if neccesarry
ask_for_confirmation "Create workspace folders (~/code)? "

# Check if answer is yes
if answer_is_yes; then

    # Create the folders
    create_folder "code"
    create_folder "code/private"
    create_folder "code/open-source"
fi
