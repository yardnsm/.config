#!/usr/bin/env bash

# ---------------------------------------------

# Install a hombrew / Cask package

brew_list=""

brew_install() {

  formula="$1"
  tap="$2"
  args="$3"

  if [[ ${brew_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\n"
    brew_list=$(brew list && brew cask list)
  fi

  if [[ "$(echo "${brew_list}" | grep "${formula}")" ]]; then
    print_success "$formula (already installed)"
  else
    execute "brew $tap install $formula $args" "$formula"
  fi
}

# ---------------------------------------------

# Install a hombrew tap

brew_taps_list=""

brew_tap() {

  tap="$1"

  if [[ ${brew_taps_list} = "" ]]; then
    brew_taps_list=$(brew tap)
  fi

  if [[ "$(echo "${brew_taps_list}" | grep "${tap}")" ]]; then
    print_success "$tap (already installed)"
  else
    execute "brew tap $tap" "Tapping $formula"
  fi
}
