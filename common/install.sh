#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -a SYMLINKS=(
  "../alacritty/.alacritty.yml"
  "../common/.hushlogin"
  "../compton, .config/compton"
  "../dunst, .config/dunst"
  "../fontconfig, .config/fontconfig"
  "../git/.gitconfig"
  "../git/.gitignore_global"
  "../gpg/gpg-agent.conf, .gnupg/gpg-agent.conf"
  "../i3, .config/i3"
  "../nvim/.vimrc"
  "../nvim/nvim.conf, .config/nvim"
  "../rofi, .config/rofi"
  "../stylelint/.stylelint"
  "../terminfo/tmux-256color.terminfo, .terminfo/74/tmux-256color"
  "../terminfo/xterm-256color-italic.terminfo, .terminfo/78/xterm-256color-italic"
  "../ternjs/.tern-config"
  "../tmux/.tmux.conf"
  "../xorg/.Xresources"
  "../xorg/.xinitrc"
  "../zsh/.zshenv"
  "../zsh/.zshrc"
)

# ---------------------------------------------

main() {
  output::info "Create symlinks"
  symlink::perform "${SYMLINKS[@]}"
}

main "$@"
