#!/usr/bin/env bash

# ---------------------------------------------

#
# Create symlinks.
#
# This function accepts an array of symlinks. Each item in the array may be in the following form:
#
#     $SOURCE_PATH[, $DEST_PATH]
#
# $SOURCE_PATH may be a relative (to the CWD) or an absolute path, and $DEST_PATH must be a relative
# path to $HOME. You can omit $DEST_PATH, and the symlink will be created directly at $HOME.
#
create_symlinks() {
  local -r SYMLINKS=( "$@" )

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
      commands::execute "ln -sf $src_realpath $dest_realpath" \
        "$src_realpath -> ~${dest_realpath#$HOME}"
    elif [[ "$(readlink "$dest_realpath")" == "$src_realpath" ]]; then
      print_success "$src_realpath -> ~${dest_realpath#$HOME} (alreay linked)"
    else
      print_error "~${dest_realpath#$HOME} already exists, Skipping."
    fi
  done
}
