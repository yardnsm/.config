#!/usr/bin/env bash

# ---------------------------------------------

# Get all topics
topics::get_all() {
  find "$DOTFILES" \
    -maxdepth 1 \
    -type d \
    ! -name '_*' \
    ! -name '.*' \
    ! -name 'dotfiles*' \
    -exec basename {} \; \
    | sort

}

# Get all the runnable topics
topics::get_runnable() {
  find "$DOTFILES" \
    -mindepth 2 \
    -maxdepth 2 \
    -type f \
    -regex '.*/install\(.*\).sh' \
    -exec sh -c 'echo $(basename $(dirname "$1"))' _ {} \; \
    | sort
}

# Check if a topic exists
topics::exists() {
  test -d "$DOTFILES/$1"
  return $?
}

# Install a specific topic
topics::install_single() {
  local -r TOPIC=$1

  if topics::exists "$TOPIC"; then

    # Check if has an install script
    if [[ -f $DOTFILES/$TOPIC/install.sh ]]; then
      output::title "Current topic is '$TOPIC'"
      source "$DOTFILES/$TOPIC/install.sh"
    fi
  else
    output::title "Current topic is '$TOPIC'\\n"
    output::error "Topic $TOPIC does not exist!"

    return 1
  fi
}

# Run the installation script for each topic
# shellcheck disable=SC2207,SC2206
topics::install_multiple() {
  local topics_to_install=( $1 )
  local topics_to_exclude=( $2 )

  local topic

  # No supplied topics? Get 'em all!
  [[ ${#topics_to_install} -eq 0 ]] \
    && topics_to_install=( $(topics::get_all) )

  for topic in "${topics_to_install[@]}"; do
    if [[ ! " ${topics_to_exclude[*]} " == *" ${topic} "* ]]; then
      topics::install_single "$topic"
    fi
  done
}
