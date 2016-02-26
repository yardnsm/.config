#!/bin/bash

# --------------------------------------------- #
# | Create a local git config file
# --------------------------------------------- #

#Ask if neccesarry
ask_for_confirmation "Need to create a local gitconfig? "

# Check if answer is yes
if answer_is_yes; then

    # Ask details
    ask 'What is your github author name? '
    git_authorname=$(get_answer)
    ask 'What is your github user name? '
    git_username=$(get_answer)
    ask 'What is your github author email? '
    git_authoremail=$(get_answer)

    # Create it
    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/USERNAME/$git_username/g" symlinks/git/gitconfig.local.symlink.dis > symlinks/git/gitconfig.local.symlink
fi
