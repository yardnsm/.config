#!/usr/bin/env bash

# ---------------------------------------------

declare GEMS_PACKAGES_LIST

# ---------------------------------------------

# Install a Gem
gem::install() {

  local package="$1"

  if [[ -z "${GEMS_PACKAGES_LIST}" ]]; then
    output::status "Fetching installed packages. This could take a while...\\n"
    GEMS_PACKAGES_LIST="$(gem list)"
  fi

  if echo "${GEMS_PACKAGES_LIST}" | grep -q "${package}"; then
    output::success "$package (already installed)"
  else
    commands::execute "gem install $package" "$package"
  fi
}
