# ---------------------------------------------
# Indication of VI mode

blox_block__vi() {
  local vim_mode_format="%B%F{yellow}[NORMAL]%f%b"
  echo "${${KEYMAP/vicmd/$vim_mode_format}/(main|viins)/}"
}

# ---------------------------------------------
# Set Vi mode

blox_helper__enable_vi() {
  bindkey -v
  bindkey "^?" backward-delete-char
  export KEYTIMEOUT=1

  function zle-keymap-select {
    blox_helper__redraw_prompt
  }

  zle -N zle-keymap-select
}
