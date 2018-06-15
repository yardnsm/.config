# ---------------------------------------------
# Indication of VI mode

blox_block__vi_mode() {
  local vi_mode_format="%B%F{yellow}[NORMAL]%f%b"
  echo "${${KEYMAP/vicmd/$vi_mode_format}/(main|viins)/}"
}

# ---------------------------------------------
# Enable Vi mode

blox_helper__enable_vi_mode() {
  bindkey -v
  bindkey "^?" backward-delete-char
  export KEYTIMEOUT=1

  function zle-keymap-select {
    blox_helper__redraw_prompt
  }

  zle -N zle-keymap-select
}
