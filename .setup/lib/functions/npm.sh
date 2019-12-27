#!/usr/bin/env bash

# ---------------------------------------------

# Install an NPM package

npm_list=""

npm::install() {

  package="$1"

  if [[ ${npm_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\\n"
    npm_list=$(npm list -g --depth 0 -s)
  fi

  if echo "${npm_list}" | grep -q "${package}@"; then
    print_success "$package (already installed)"
  else
    commands::execute "sudo npm install $package -g" "$package"
  fi
}
