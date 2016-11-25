#!/usr/bin/env bash

# --------------------------------------------- #
# | Install a Gem
# --------------------------------------------- #

# Store 'gem list' to make it faster
gem_list=""

gem_install() {

  # Arguments
  package="$1"

  # Check if there is a list
  if [[ ${gem_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\n"
    gem_list=$(gem list)
  fi

  # Install the specified gem
  if [[ $(echo ${gem_list} | grep "${package}") ]]; then
    print_success "$package (already installed)"
  else
    execute "gem install $package" "$package"
  fi
}
