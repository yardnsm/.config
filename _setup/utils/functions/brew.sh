#!/usr/bin/env bash

# --------------------------------------------- #
# | Install a hombrew / Cask package
# --------------------------------------------- #

# Store 'brew list' to make it faster
brew_list=""

brew_install() {

  # Arguments
  formula="$1"
  cmd="$2"

  # Check if there is a list
  if [[ ${brew_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\n"
    brew_list=$(brew list && brew cask list)
  fi

  # Install the specified formula
  if [[ $(echo ${brew_list} | grep "${formula}") ]]; then
    print_success "$formula (already installed)"
  else
    execute "brew $cmd install $formula" "$formula"
  fi
}
