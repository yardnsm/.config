#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Install gems
# --------------------------------------------- #
print_info "Installing Gems"

# Dev stuff
gem_install 'bundler'
gem_install 'sass'
gem_install 'compass'
gem_install 'haml'
