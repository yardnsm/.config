#!/usr/bin/env bash

current_dir="$(dirname "${BASH_SOURCE[0]}")"

# ---------------------------------------------

print_info "Copying IntelliJ Stuff"

# Modified version of https://github.com/square/java-code-styles/blob/master/install.sh

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    print_info "Acting on $(basename "$i")"

    # Copy themes
    execute "mkdir -p $i/colors && cp -f '$current_dir/files/colors'/* $i/colors" \
    "Copy themes"

  fi
done
