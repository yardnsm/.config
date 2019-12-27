#!/usr/bin/env bash

# ---------------------------------------------

# Get all topics
topics::get_all() {
  find "$DOTFILES" \
    -maxdepth 1 \
    -type d \
    ! -name '_*' \
    ! -name '.*' \
    ! -name 'dotfiles' \
     -exec basename {} \;
}

# Get all the runnable topics
topics::get_runnable() {
  find "$DOTFILES" \
    -mindepth 2 \
    -maxdepth 2 \
    -type f \
    -regex '.*/install\(.*\).sh' \
    -exec sh -c 'echo $(basename $(dirname "$1"))' _ {} \;
}

# Check if a topic exists
topics::exists() {
  test -d "$DOTFILES/$1"
  return $?
}

# Install a specific topic
topics::install_single() {
  local -r TOPIC=$1
  local -r OS="$(get_os)"

  if topics::exists "$TOPIC"; then

    # Check if has an install script
    if [[ -f $DOTFILES/$TOPIC/install.sh ]]; then
      output::title "Current topic is '$TOPIC'"
      source "$DOTFILES/$TOPIC/install.sh"
    fi

    # Check for OS-specific installtion
    if [[ -f $DOTFILES/$TOPIC/install-$OS.sh ]]; then
      output::title "Running os-specific installation for '$TOPIC'"
      source "$DOTFILES/$TOPIC/install-$OS.sh"
    fi
  else
    output::title "Current topic is '$TOPIC'\\n"
    output::error "Topic $TOPIC does not exist!"
  fi
}

# Run the installation script for each topic
# shellcheck disable=SC2207,SC2206
topics::install_multiple() {
  local topics_to_install=( $1 )
  local topics_to_exclude=( $2 )

  local topic
  local is_ignored

  [[ ${#topics_to_install} -eq 0 ]] \
    && topics_to_install=( $(topics::get_all) )

  for topic in "${topics_to_install[@]}"; do

    is_ignored=""

    # Check if needs to be ignored
    for ignored in "${topics_to_exclude[@]}"; do
      if [[ $topic == "$ignored" ]]; then
        is_ignored="true"
        break
      fi
    done

    if [[ -z $is_ignored ]]; then
      topics::install_single "$topic"
    fi
  done
}
