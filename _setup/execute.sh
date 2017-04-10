#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

for tdir in $DOTFILES/*/ ; do

  tdir=$(basename $tdir)

  # Check if the directory is a topic directory
  if ! [[ $tdir == _* ]]; then

    # Check if has an install script
    if [[ -f $DOTFILES/$tdir/install.sh ]]; then
      print_title "Current topic is '${tdir%/}'"
      source $DOTFILES/$tdir/install.sh
    fi
  fi
done
