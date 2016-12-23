#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Create symlinks"

symlinks=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')

for file in $symlinks; do

  target="$HOME/.$(basename $file ".symlink")"

  if [[ -e $target ]]; then
    print_error "~${target#$HOME} already exists, Skipping."
  else
    ln -sf $file $target &> /dev/null
    print_result $? "Creating symlink for $(basename $target)"
  fi
done

# ---------------------------------------------

print_info "Create copies"

copies=$(find -H "$DOTFILES" -maxdepth 3 -name '*.copy')

for file in $copies; do

  target="$HOME/.$(basename $file ".copy")"

  if [[ -e $target ]]; then
    print_error "~${target#$HOME} already exists, Skipping."
  else
    if [[ -d $file ]]; then
      cp -r $file $target &> /dev/null
    else
      cp $file $target &> /dev/null
    fi
    print_result $? "Creating copy for $(basename $target)"
  fi
done
