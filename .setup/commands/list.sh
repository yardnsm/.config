#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

# shellcheck disable=SC2207
command::list() {

  output::title "Available topics"
  echo

  # shellcheck disable=SC2207
  local topics

  if [[ $OPT_ALL -eq 0 ]]; then
    topics=( $(topics::get_runnable) )
  else
    topics=( $(topics::get_all) )
  fi

  for topic in "${topics[@]}"; do
    printf "     %-8s\\n" "${topic}"
  done | column
}
