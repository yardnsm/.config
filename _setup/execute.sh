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

    os=$(get_os)

    if [[ -f $DOTFILES/$tdir/install-$os.sh ]]; then
      print_title "Running os-specific installation for '${tdir%/}'"
      source $DOTFILES/$tdir/install-$os.sh
    fi
  fi
done
