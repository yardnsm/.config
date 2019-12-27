#!/usr/bin/env bash

# ---------------------------------------------

# Install a hombrew / Cask package

brew_list=""

brew::install() {

  formula="$1"
  tap="$2"

  if [[ ${brew_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\\n"
    brew_list=$(brew list && brew cask list)
  fi

  if echo "${brew_list}" | grep -q "${formula}"; then
    print_success "$formula (already installed)"
  else
    execute "brew $tap install $formula" "$formula"
  fi
}

# ---------------------------------------------

# Install a hombrew tap

brew_taps_list=""

brew::tap() {

  tap="$1"

  if [[ ${brew_taps_list} = "" ]]; then
    brew_taps_list=$(brew tap)
  fi

  if echo "${brew_taps_list}" | grep -q "${tap}"; then
    print_success "$tap (already installed)"
  else
    execute "brew tap $tap" "Tapping $tap"
  fi
}
