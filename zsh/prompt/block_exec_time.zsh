# ---------------------------------------------
# Last command exec time

# The following were taken from https://github.com/miekg/lean/
# cmd_timestamp_start: start
# cmd_timestamp_stop: stop
# cmd_timstatmp_persist: persist the timestamp to next redraw

blox_block__exec_time() {
  local stop=${cmd_timestamp_stop:-$EPOCHSECONDS}
  local start=${cmd_timestamp_start:-$stop}
  local elapsed=$(( $stop - $start ))
  [[ $elapsed -gt 5 ]] && echo "%F{yellow}$(blox_helper__humen_time $elapsed)%f"
}

blox_helper__humen_time() {
  local tmp=$1
  local days=$(( tmp / 60 / 60 / 24 ))
  local hours=$(( tmp / 60 / 60 % 24 ))
  local minutes=$(( tmp / 60 % 60 ))
  local seconds=$(( tmp % 60 ))
  (( $days > 0 )) && echo -n "${days}d "
  (( $hours > 0 )) && echo -n "${hours}h "
  (( $minutes > 0 )) && echo -n "${minutes}m "
  echo "${seconds}s"
}

blox_hook__preexec_exec_time() {
  unset cmd_timestamp_stop
  cmd_timestamp_start=$EPOCHSECONDS
}

blox_hook__precmd_exec_time() {
  [[ $cmd_timestamp_persist != 1 ]] && unset cmd_timestamp_start
}
