# ---------------------------------------------
# More git stuff

blox_block__git_enhanced_helper__stashed() {
  local color="cyan"
  local char="\$"

  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    echo "%F{${color}}${char}%{$reset_color%}"
  fi
}

blox_block__git_enhanced() {
  if blox_block__git_helper__is_git_repo; then

    local stashed="$(blox_block__git_enhanced_helper__stashed)"

    echo "$stashed"
  fi
}


# ---------------------------------------------
# Async 'git fetch'

ASYNC_PROC=0
BLOX_CONF__ENABLE_ASYNC=true

blox_hook__precmd_git_fetch() {
  async() {
    git fetch &> /dev/null
    kill -s USR2 $$
  }

  # Kill child if necessary
  if [[ "${ASYNC_PROC}" != 0 ]]; then
    kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
  fi

  if blox_block__git_helper__is_git_repo && [[ $BLOX_CONF__ENABLE_ASYNC == true ]]; then
    async &!
    ASYNC_PROC=$!

    # After the async process the prompt will be redrawen, so
    # we need to persist the current execution information
    # till the next redraw
    cmd_timestamp_persist=1
    cmd_timestamp_stop=$EPOCHSECONDS
  else
    cmd_timestamp_persist=0
  fi
}

function TRAPUSR2() {
  ASYNC_PROC=0
  blox_helper__redraw_prompt

  cmd_timestamp_persist=0
  blox_hook__precmd_exec_time
}
