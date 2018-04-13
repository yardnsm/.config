# ---------------------------------------------
# Output virtualenv name

blox_block__virtualenv() {
  [[ -n "$VIRTUAL_ENV" ]] \
    || return

  local result=""

  result+="%F{green}"
  result+="${BLOX_CONF__BLOCK_PREFIX}venv${BLOX_CONF__BLOCK_SUFFIX}"
  result+="%{$reset_color%}"

  echo $result
}
