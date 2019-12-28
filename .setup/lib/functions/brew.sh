#!/usr/bin/env bash

# ---------------------------------------------

declare HOMEBREW_PACKAGES_LIST
declare HOMEBREW_TAPS_LIST

# ---------------------------------------------

# Install a hombrew / Cask package
brew::install() {

  local package="$1"
  local tap="$2"

  if [[ -z "${HOMEBREW_PACKAGES_LIST}" ]]; then
    output::status "Fetching installed packages. This could take a while...\\n"
    HOMEBREW_PACKAGES_LIST="$(brew list && brew cask list 2> /dev/null)"
  fi

  if echo "${HOMEBREW_PACKAGES_LIST}" | grep -q "${package}"; then
    output::success "$package (already installed)"
  else
    commands::execute "brew $tap install $package" "$package"
  fi
}

# ---------------------------------------------

# Install a hombrew tap
brew::tap() {

  local tap="$1"

  if [[ -z "${HOMEBREW_TAPS_LIST}" ]]; then
    HOMEBREW_TAPS_LIST="$(brew tap 2> /dev/null)"
  fi

  if echo "${HOMEBREW_TAPS_LIST}" | grep -q "${tap}"; then
    output::success "Tapping $tap (already installed)"
  else
    commands::execute "brew tap $tap" "Tapping $tap"
  fi
}
