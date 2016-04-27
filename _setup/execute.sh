#!/bin/bash

# --------------------------------------------- #
# | Run the 'main.sh' scripts of every topic
# --------------------------------------------- #
for d in $DOTFILES/*/ ; do

    d=$(basename $d)

    # Check if the directory is a topic directory
    if ! [[ $d == _* ]]; then

        print_title "Current topic is '${d%/}'"

        # Check if has a 'main.sh' script
        if [[ -f $d/main.sh ]]; then
            source $d/main.sh
        else
            print_success "'main.sh' was not found! Skipping..."
        fi

        # Because I like it
        sleep 0.5

        # Divid'em
        print_divider
    fi
done
