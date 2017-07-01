#!/usr/bin/env bash

# ---------------------------------------------

# Get all topics
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
  [[ -d $DOTFILES/$topic ]] &> /dev/null
  return $?
}

# Run the installation script for each topic
install_topics() {
  local topics_to_install=$1
  local topics_to_ignore=$2

  local os
  os=$(get_os)

  [[ ${#topics_to_install} -eq 0 ]] && topics_to_install=( $(get_all_topics) )

  for topic in "${topics_to_install[@]}"; do

    topic=$(basename "$topic")
    topic=${topic%/}

    # Check if needs to be ignored
    is_ignored=""
    for ignored in "${topics_to_ignore[@]}"; do
      [[ $topic == "$ignored" ]] && is_ignored="true" && break
    done

    [[ -n $is_ignored ]] && continue


    if is_topic_exist "$topic"; then

      # Check if has an install script
      if [[ -f $DOTFILES/$topic/install.sh ]]; then
        print_title "Current topic is '$topic'"
        source "$DOTFILES/$topic/install.sh"
      fi

      # Check for os-specific installtion
      if [[ -f $DOTFILES/$topic/install-$os.sh ]]; then
        print_title "Running os-specific installation for '$topic'"
        source "$DOTFILES/$topic/install-$os.sh"
      fi
    else
      print_title "Current topic is '$topic'"
      print_error "Topic $topic does not exist!"
    fi
  done
}
