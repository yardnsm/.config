#!/usr/bin/env bash

# ---------------------------------------------

# Install a package from apt-get

apt::install() {

  local package="$1"

  if (dpkg -s "$package" &> /dev/null) ; then
    output::success "$package (already installed)"
  else
    commands::execute "sudo apt-get install --allow-unauthenticated -qqy $package" "$package"
  fi
}
