#!/usr/bin/env bash

# ---------------------------------------------

# `pyenv` can cause trouble with its shims, so we're need to
# figure out which `pip` executable to use
_get_pip_command() {
  local -a commands=( pip pip2 pip3 )

  for cmd in "${commands[@]}"; do
    eval "$cmd --version" &> /dev/null \
      && echo "$cmd" \
      && return 0
  done
}

# Install a Pip

pip_list=""
pip_command=""

pip::install() {

  [[ -z "$pip_command" ]] \
    && pip_command="$(_get_pip_command)"

  package="$1"

  if [[ ${pip_list} = "" ]]; then
    print_status "Fetching installed packages. This could take a while...\\n"
    pip_list=$($pip_command list --format=legacy)
  fi

  if echo "${pip_list}" | grep -q "${package}"; then
    print_success "$package (already installed)"
  else
    commands::execute "$pip_command install $package" "$package"
  fi
}
