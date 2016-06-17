#!/bin/bash

# --------------------------------------------- #
# | Copying process
# --------------------------------------------- #
copies=$(find -H "$DOTFILES" -maxdepth 3 -name '*.copy')
for file in $copies; do
  target="$HOME/.$(basename $file ".copy")"
  if [ -e $target ]; then
    print_error "~${target#$HOME} already exists, Skipping."
  else
    if [ -d $file ]; then
      cp -r $file $target &> /dev/null
    else
      cp $file $target &> /dev/null
    fi
    print_result $? "Creating copy for $(basename $target)"
  fi
done
