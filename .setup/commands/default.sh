#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

command::default() {
  # `dots` is available? The dotfiles probably have been installed.
  if commands::exists "dots"; then
    command::help "$@"
  else
    OPT_INIT=1

    command::symlink "$@"
    command::install "$@"
  fi
}
