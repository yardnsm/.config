# Change window name to the current git dir
_tmux_update_window_name() {
  [[ -z $TMUX ]] && return;

  if git rev-parse 2> /dev/null; then
    tmux rename-window "$(basename `git rev-parse --show-toplevel`)"
  else
    tmux setw automatic-rename
  fi
}

add-zsh-hook chpwd _tmux_update_window_name \
  && _tmux_update_window_name
