#!/usr/bin/env bash

# ---------------------------------------------

# Get all topics (full path)
get_all_topics() {
  find "$DOTFILES" \
    -maxdepth 1 \
    -type d \
    ! -name '_*' \
    ! -name '.*' \
    ! -name 'dotfiles'
}

# Check if a topic exists
is_topic_exist() {
  test -d "$DOTFILES/$1"
  return $?
}

# Install a specific topic
install_specific_topic() {
  local -r TOPIC=$1
  local -r OS="$(get_os)"

  if is_topic_exist "$TOPIC"; then

    # Check if has an install script
    if [[ -f $DOTFILES/$TOPIC/install.sh ]]; then
      print_title "Current topic is '$TOPIC'"
      source "$DOTFILES/$TOPIC/install.sh"
    fi

    # Check for OS-specific installtion
    if [[ -f $DOTFILES/$TOPIC/install-$OS.sh ]]; then
      print_title "Running os-specific installation for '$TOPIC'"
      source "$DOTFILES/$TOPIC/install-$OS.sh"
    fi
  else
    print_title "Current topic is '$TOPIC'"
    print_error "Topic $TOPIC does not exist!"
  fi
}

# Run the installation script for each topic
# shellcheck disable=SC2207,SC2206
install_topics() {
  local topics_to_install=( $1 )
  local topics_to_exclude=( $2 )

  local topic
  local is_ignored

  [[ ${#topics_to_install} -eq 0 ]] \
    && topics_to_install=( $(get_all_topics) )

  for topic in "${topics_to_install[@]}"; do

    topic=$(basename "$topic")
    is_ignored=""

    # Check if needs to be ignored
    for ignored in "${topics_to_exclude[@]}"; do
      [[ $topic == "$ignored" ]] \
        && is_ignored="true" \
        && break
    done

    if ! [[ -n $is_ignored ]]; then
      install_specific_topic "$topic"
    fi
  done
}
