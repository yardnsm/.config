# ---------------------------------------------
# Async 'git fetch'

ASYNC_PROC=0
BLOX_CONF__ENABLE_ASYNC=true

function blox_hook__precmd_git_fetch() {
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
    BLOX_BLOCK__EXEC_TIME_PERSIST=true
    BLOX_BLOCK__EXEC_TIME_STOP=$EPOCHSECONDS
  else
    BLOX_BLOCK__EXEC_TIME_PERSIST=false
  fi
}

function TRAPUSR2() {
  ASYNC_PROC=0

  blox_helper__redraw_prompt

  BLOX_BLOCK__EXEC_TIME_PERSIST=false
  blox_block__exec_time_hook__precmd
}
