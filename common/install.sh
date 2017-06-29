#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Create symlinks"

symlinks=$(find -H "$DOTFILES" "$DOTFILES_LOCAL" -maxdepth 3 -name '*.symlink')

for file in $symlinks; do

  target="$HOME/.$(basename $file ".symlink")"

  if [[ -e $target ]]; then
    print_error "~${target#$HOME} already exists, Skipping."
  else
    ln -sf $file $target &> /dev/null
    print_result $? "Creating symlink for $(basename $target)"
  fi
done
