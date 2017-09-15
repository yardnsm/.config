#!/usr/bin/env bash

# ---------------------------------------------

# Install a hombrew / Cask package

brew_list=""

brew_install() {

  formula="$1"
  cmd="$2"
  args="$3"

  if [[ ${brew_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\n"
    brew_list=$(brew list && brew cask list)
  fi

  if [[ "$(echo "${brew_list}" | grep "${formula}")" ]]; then
    print_success "$formula (already installed)"
  else
    execute "brew $cmd install $formula $args" "$formula"
  fi
}
