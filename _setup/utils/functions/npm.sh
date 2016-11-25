#!/usr/bin/env bash

# --------------------------------------------- #
# | Install an NPM package
# --------------------------------------------- #

# Store 'npm list' to make it faster
npm_list=""

npm_install() {

  # Arguments
  package="$1"

  # Check if there is a list
  if [[ ${npm_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\n"
    npm_list=$(npm list -g --depth 0 -s)
  fi

  # Install the specified package
  if [[ $(echo ${npm_list} | grep "${package}@") ]]; then
    print_success "$package (already installed)"
  else
    execute "npm install $package -g" "$package"
  fi
}
