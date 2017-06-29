#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Setup local gitconfig"

# Ask if neccesarry
if ! [ -f $current_dir/gitconfig.local.symlink ]; then
  ask_for_confirmation "Need to create a local gitconfig? "
  echo ""
else
  print_status "A local gitconfig is already exist"
  REPLY='n'
fi

if answer_is_yes; then

  # Ask details
  ask 'What is your github author name? '
  git_authorname=$(get_answer)
  ask 'What is your github author email? '
  git_authoremail=$(get_answer)

  # Create it
  sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" \
    git/files/gitconfig.local.symlink.placeholder > git/gitconfig.local.symlink
fi
