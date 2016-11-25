#!/usr/bin/env bash

# --------------------------------------------- #
# | Install Atom package
# --------------------------------------------- #
apm_install() {

  # Arguments
  package="$1"

  # Install the specified package
  apm list | grep $package &> /dev/null & show_spinner $! $package
  if [ $? -eq 0 ]; then
    print_success "$package (already installed)"
  else
    execute "apm install $package" "$package"
  fi
}
