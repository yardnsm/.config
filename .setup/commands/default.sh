#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

command::default() {
  # `dots` is available? The dotfiles probably have been installed.
  commands::exists "dots" \
    && command::help "$@" \
    || command::install "$@"
}
