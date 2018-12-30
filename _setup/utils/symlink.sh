#!/usr/bin/env bash

# ---------------------------------------------

#
# Create symlinks.
#
# This function accepts an array of symlink. Each item in the array may be in the following form:
#
#     '$SOURCE_PATH, $DEST_PATH
#
# $SOURCE_PATH may be relative or absolute paths, and $DEST_PATH must be a relative path, relative
# to $HOME. Relative paths will be resolved relativly to the CWD, so make sure you've `cd`ed to the
# desired directory before running this function.
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
      execute "ln -sf $src_realpath $dest_realpath" \
        "$src_realpath -> ~${dest_realpath#$HOME}"
    elif [[ "$(readlink "$dest_realpath")" == "$src_realpath" ]]; then
      print_success "$src_realpath -> ~${dest_realpath#$HOME} (alreay linked)"
    else
      print_error "~${dest_realpath#$HOME} already exists, Skipping."
    fi
  done
}
