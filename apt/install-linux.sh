#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Install APT packages"

apt_install 'tmux'
apt_install 'neovim'
apt_install 'python-neovim'
apt_install 'python3-neovim'
apt_install 'ruby-full'

# ---------------------------------------------

print_info "Cleanup"

execute "sudo apt-get autoremove -qqy" "apt-get (autoremove)"
