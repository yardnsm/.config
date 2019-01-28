# ---------------------------------------------
# Indication of VI mode

blox_block__vi_mode() {
  local vi_mode_format="%B%F{yellow}[NORMAL]%f%b"
  echo "${${KEYMAP/vicmd/$vi_mode_format}/(main|viins)/}"
}

# ---------------------------------------------
# Enable Vi mode

blox_helper__enable_vi_mode() {

  # Enable vi line editing
  bindkey -v

  # Restore some keymaps removed by vim keybind mode
  bindkey '^P' up-history
  bindkey '^N' down-history
  bindkey '^?' backward-delete-char
  bindkey '^h' backward-delete-char

  export KEYTIMEOUT=1

  # Callback for vim mode change
  function zle-keymap-select {

    # Change cursor shape accoridngly
    # Taken from https://github.com/JakobGM/dotfiles/blob/master/autoload/vim.zsh
    if [ "$TERM" = "xterm-256color" ] || \
      [ "$TERM" = "tmux-256color" ] || \
      [ "$TERM" = "xterm-kitty" ] || \
      [ "$TERM" = "screen-256color" ]; then
      if [ $KEYMAP = vicmd ]; then

        # Set block cursor
        echo -ne '\e[2 q'
      else

        # Set beam cursor
        echo -ne '\e[6 q'
      fi
    fi

    # Refresh prompt
    blox_helper__redraw_prompt
  }

  zle -N zle-keymap-select
  zle -N edit-command-line

  # Press `v` to open the command in vim
  bindkey -M vicmd v edit-command-line
}
