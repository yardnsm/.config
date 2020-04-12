#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

command::symlink() {

  # Declare it in the fucntion scope since the $DOTFILES variable may be changed before this script
  # is sourced
  declare -r __SYMLINKS="$DOTFILES/.symlinks"

  local readlink_cmd="readlink"
  if [[ "$(os::get_name)" == "macos" ]]; then

    # Use greadlink on the mac
    readlink_cmd="greadlink"
  fi

  local item_src
  local item_dest

  local src_realpath
  local dest_realpath

  if [[ $OPT_DRY_RUN -eq 1 ]]; then
    echo
    output::status "Executing a dry-run\n"
  fi

  # Everything should be relative to the location of the symlinks file
  pushd "$(dirname "$__SYMLINKS")" &> /dev/null \
    || exit 1

  while read -r symlink; do

    # Start with a '#'? Ignore!
    [[ "$symlink" =~ ^\# ]] || [[ -z "$symlink" ]] \
      && continue

    item_src="$(echo "$symlink" | awk '{print $1}')"
    item_dest="$(echo "$symlink" | awk '{print $2}')"

    src_realpath="$("${readlink_cmd}" -f "$item_src")"

    if [[ -z "$item_dest" ]]; then

      # Default under .config
      dest_realpath="$HOME/.config/$(basename "$item_src")"
    else

      # Relative to $HOME
      dest_realpath="$HOME/$item_dest"
    fi

    if ! [[ -e "$dest_realpath" ]]; then

      if [[ $OPT_DRY_RUN -eq 1 ]]; then

        # Dry run, only output
        output::success "$src_realpath -> ~${dest_realpath#$HOME}"
      else

        commands::execute "ln -sf $src_realpath $dest_realpath" \
          "$src_realpath -> ~${dest_realpath#$HOME}"
      fi

    elif [[ "$("${readlink_cmd}" "$dest_realpath")" == "$src_realpath" ]]; then
      output::status "$src_realpath -> ~${dest_realpath#$HOME} (alreay linked)"
    else
      output::error "~${dest_realpath#$HOME} already exists, Skipping."
    fi

  done < "$__SYMLINKS"

  popd &> /dev/null \
    || return 1
}
