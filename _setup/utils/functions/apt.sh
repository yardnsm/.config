#!/usr/bin/env bash

# ---------------------------------------------

# Install a package from apt-get

apt_updated=""

apt_install() {

  package="$1"

  if [[ ${apt_updated} = "" ]]; then
    print_status "Updating apt-get... \n"
    sudo apt-get update -qqy
    apt_get_updated=true
  fi

  if (dpkg -s "$package" &> /dev/null) ; then
    print_success "$package (already installed)"
  else
    execute "sudo apt-get install --allow-unauthenticated -qqy $package" "$package"
  fi
}
