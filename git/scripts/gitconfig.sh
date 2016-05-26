#!/bin/bash

# --------------------------------------------- #
# | Create a local git config file
# --------------------------------------------- #

# Ask if neccesarry
if ! [ -f $current_dir/symlinks/gitconfig.local.symlink ]; then
    ask_for_confirmation "Need to create a local gitconfig? "
else
    #ask_for_confirmation "A local gitconfig is already exist. Need to create again? "
    print_status "A local gitconfig is already exist"
    REPLY='n'
fi

# Check if answer is yes
if answer_is_yes; then

    # Ask details
    ask 'What is your github author name? '
    git_authorname=$(get_answer)
    ask 'What is your github author email? '
    git_authoremail=$(get_answer)

    # Create it
    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" symlinks/git/gitconfig.local.symlink.placeholder > symlinks/git/gitconfig.local.symlink
fi
