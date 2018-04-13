#!/usr/bin/env bash

# ---------------------------------------------

# Install an NPM package

npm_list=""
yarn_list=""

yarn_install() {

  package="$1"

  if [[ -z ${npm_list} ]] && [[ -z ${yarn_list} ]]; then
    print_status "Fetching installed packages. This could take a while...\\n"
    npm_list=$(npm list -g --depth 0 -s)
    yarn_list=$(yarn global list --depth 0)
  fi

  if echo "${npm_list}" | grep -q "${package}@"; then
    print_success "$package (already installed via npm)"
  elif echo "${yarn_list}" | grep -q "${package}@"; then
    print_success "$package (already installed via yarn)"
  else
    execute "yarn global add $package" "$package (via yarn)"
  fi
}
