#!/usr/bin/env bash

# --------------------------------------------- #
# | Symlinking process
# --------------------------------------------- #
symlinks=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
for file in $symlinks; do
  target="$HOME/.$(basename $file ".symlink")"
  if [[ $DOTFILES_OPT__HARD == false ]] && [[ -e $target ]]; then
    print_error "~${target#$HOME} already exists, Skipping."
  else
    ln -sf $file $target &> /dev/null
    print_result $? "Creating symlink for $(basename $target)"
  fi
done
