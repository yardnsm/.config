#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

declare -a SYMLINKS=(
  "../alacritty/.alacritty.yml"

  "../common/.hushlogin"

  "../git/.gitconfig"
  "../git/.gitignore_global"

  "../gpg/gpg-agent.conf, .gnupg/gpg-agent.conf"

  "../nvim/.vimrc"
  "../nvim/nvim.conf, .config/nvim"

  "../terminfo/tmux-256color.terminfo, .terminfo/74/tmux-256color"
  "../terminfo/xterm-256color-italic.terminfo, .terminfo/78/xterm-256color-italic"

  "../ternjs/.tern-config"

  "../tmux/.tmux.conf"

  "../zsh/.zshrc"
)

# ---------------------------------------------

main() {
  print_info "Create symlinks"

  local symlink_item

  local item_src
  local item_dest

  local src_realpath
  local dest_realpath

  for symlink_item in "${SYMLINKS[@]}"; do

    item_src="$(echo "$symlink_item" | awk -F', ' '{print $1}')"
    item_dest="$(echo "$symlink_item" | awk -F', ' '{print $2}')"

    src_realpath="$(realpath "$item_src")"

    [[ -z "$item_dest" ]] \
      && dest_realpath="$HOME/$(basename "$item_src")" \
      || dest_realpath="$HOME/$item_dest"

    if ! [[ -e "$dest_realpath" ]]; then
      execute "ln -sf $src_realpath $dest_realpath" \
        "$src_realpath -> ~${dest_realpath#$HOME}"
    elif [[ "$(readlink "$dest_realpath")" == "$src_realpath" ]]; then
      print_success "$src_realpath -> ~${dest_realpath#$HOME} (alreay linked)"
    else
      print_error "~${dest_realpath#$HOME} already exists, Skipping."
    fi
  done
}

main "$@"
