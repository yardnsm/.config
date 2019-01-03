#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -a SYMLINKS=(
  "../alacritty/.alacritty.yml"

  "../common/.hushlogin"

  "../git/.gitconfig"
  "../git/.gitignore_global"

  "../gpg/gpg-agent.conf, .gnupg/gpg-agent.conf"

  "../nvim/.vimrc"
  "../nvim/nvim.conf, .config/nvim"

  "../stylelint/.stylelint"

  "../terminfo/tmux-256color.terminfo, .terminfo/74/tmux-256color"
  "../terminfo/xterm-256color-italic.terminfo, .terminfo/78/xterm-256color-italic"

  "../ternjs/.tern-config"

  "../tmux/.tmux.conf"

  "../zsh/.zshrc"
)

# ---------------------------------------------

main() {
  print_info "Create symlinks"
  create_symlinks "${SYMLINKS[@]}"
}

main "$@"
