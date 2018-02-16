#!/usr/bin/env bash

# ---------------------------------------------

# Install a Pip

pip_list=""

pip_install() {

  package="$1"

  if [[ ${pip_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\\n"
    pip_list=$(pip list --format=legacy)
  fi

  if [[ "$(echo "${pip_list}" | grep "${package}")" ]]; then
    print_success "$package (already installed)"
  else
    execute "pip install $package" "$package"
  fi
}
