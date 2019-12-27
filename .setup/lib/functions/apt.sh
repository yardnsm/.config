#!/usr/bin/env bash

# ---------------------------------------------

# Install a package from apt-get

apt::install() {

  package="$1"

  if (dpkg -s "$package" &> /dev/null) ; then
    print_success "$package (already installed)"
  else
    execute "sudo apt-get install --allow-unauthenticated -qqy $package" "$package"
  fi
}
