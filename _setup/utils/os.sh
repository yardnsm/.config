#!/usr/bin/env bash

# ---------------------------------------------

# Detect os
get_os() {
  if [[ "$(uname -s)" == "Linux" ]]; then
    echo "linux"
  elif [[ "$(uname -s)" == "Darwin" ]]; then
    echo 'macos'
  else
    echo 'dafuq'
  fi
}
