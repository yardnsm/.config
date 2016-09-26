#!/usr/bin/env bash

# --------------------------------------------- #
# | Run the 'main.sh' scripts of every topic
# --------------------------------------------- #
for d in $DOTFILES/*/ ; do

  d=$(basename $d)

  # Check if the directory is a topic directory
  if ! [[ $d == _* ]]; then

    # Check if has a 'main.sh' script
    if [[ -f $DOTFILES/$d/main.sh ]]; then
      print_title "Current topic is '${d%/}'"
      source $DOTFILES/$d/main.sh
    fi
  fi
done
