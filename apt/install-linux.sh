#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Updating apt"

execute "sudo apt-get update -qqy" "apt-get (update)"

# ---------------------------------------------

print_info "Install APT packages"

apt_install 'tmux'
apt_install 'neovim'
apt_install 'python-neovim'
apt_install 'python3-neovim'
apt_install 'ruby-full'
apt_install 'rbenv'

# ---------------------------------------------

print_info "Cleanup"

execute "sudo apt-get autoremove -qqy" "apt-get (autoremove)"
