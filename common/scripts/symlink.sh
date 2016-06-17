#!/bin/bash

# --------------------------------------------- #
# | Symlinking process
# --------------------------------------------- #
symlinks=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
for file in $symlinks; do
  target="$HOME/.$(basename $file ".symlink")"
  if [ -e $target ]; then
    print_error "~${target#$HOME} already exists, Skipping."
  else
    ln -s $file $target &> /dev/null
    print_result $? "Creating symlink for $(basename $target)"
  fi
done
