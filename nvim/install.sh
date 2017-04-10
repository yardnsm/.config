#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Symlink nvim config"

ln -s "$DOTFILES/nvim/nvim.conf" "$HOME/.config/nvim" &> /dev/null
print_result $? "Creating symlink for nvim.conf"

print_info "Installing plugins"

nvim -c 'PlugInstall' -c 'qa!'
print_result $? "Installed plugins"
