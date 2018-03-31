# ---------------------------------------------
# Output node version only if nvm was loaded

blox_block__nodejs_ng() {
  if ! $(type node | grep -q 'shell function'); then
    blox_block__nodejs
  fi
}
