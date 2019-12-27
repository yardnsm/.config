#!/usr/bin/env bash

# ---------------------------------------------

# Detect os
os::get_name() {
  if [[ "$(uname -s)" == "Linux" ]]; then
    echo "linux"
  elif [[ "$(uname -s)" == "Darwin" ]]; then
    echo 'macos'
  else
    echo 'dafuq'
  fi
}
