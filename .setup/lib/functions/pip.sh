#!/usr/bin/env bash

# ---------------------------------------------

declare PIP_PACKAGES_LIST
declare PIP_COMMAND

# ---------------------------------------------

# `pyenv` can cause trouble with its shims, so we're need to
# figure out which `pip` executable to use
__get_pip_command() {
  local -a commands=( pip pip2 pip3 )

  for cmd in "${commands[@]}"; do
    eval "$cmd --version" &> /dev/null \
      && echo "$cmd" \
      && return 0
  done
}

# Install a Pip
pip::install() {

  [[ -z "$PIP_COMMAND" ]] \
    && PIP_COMMAND="$(__get_pip_command)"

  local package="$1"

  if [[ -z "${PIP_PACKAGES_LIST}" ]]; then
    output::status "Fetching installed packages. This could take a while...\\n"
    PIP_PACKAGES_LIST="$($PIP_COMMAND list --format=columns)"
  fi

  if echo "${PIP_PACKAGES_LIST}" | grep -q "${package}"; then
    output::success "$package (already installed)"
  else
    commands::execute "$PIP_COMMAND install $package" "$package"
  fi
}
