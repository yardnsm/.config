# ---------------------------------------------
# Output python version via pyenv if needed

blox_block__pyenv() {
  [[ -n *.py(#qN^/) ]] \
    || return

  local python_version=$(pyenv version-name 2>/dev/null)
  local result=""

  if [[ ! -z "${python_version}" ]]; then
    result+="%F{green}"
    result+="${BLOX_CONF__BLOCK_PREFIX}py:${python_version}${BLOX_CONF__BLOCK_SUFFIX}"
    result+="%{$reset_color%}"
  fi

  echo $result
}
