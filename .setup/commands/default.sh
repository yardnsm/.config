#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

command::default() {
  # `dots` is available? The dotfiles probably have been installed.
  if commands::exists "dots"; then
    command::help "$@"
  else
    command::symlink "$@"
    command::install "$@"
  fi
}
