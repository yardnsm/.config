#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "./_setup/initializer.sh"

# ---------------------------------------------

declare topics=()

declare auto_yes=0
declare exclude_topics=0

# ---------------------------------------------

add_topic() {
  if is_topic_exist "$1"; then
    topics+=( "$1" )
  else
    print_error "Error: topic $1 does not exist!"
    exit 1
  fi
}

# ---------------------------------------------

install_local_dotfiles() {

  print_title "Running local installation script"
  printf '\n'

  if [[ -f "$DOTFILES_LOCAL/install.sh" ]]; then
    print_status "A dotfiles-local directory was found with
        an install.sh script. It'll run in 3 seconds."

    sleep 3

    source "$DOTFILES_LOCAL/install.sh"
  else
    print_status "No local installation script was found"
  fi
}

# ---------------------------------------------

start_procedure() {

  print_welcome_message

  if [[ ${#topics} -ne 0 ]]; then
    if [[ ${exclude_topics} -eq 1 ]]; then
      print_status "Topics to exclude: ${topics[*]}"
    else
      print_status "Topics to install: ${topics[*]}"
    fi
  fi

  print_title "Getting ready"

  # Run preinstall script
  print_info "Make sure everything's alright"
  source "./_setup/preinstall.sh"

  # Ask if it's okay
  if ! [[ $auto_yes -eq 1 ]]; then
    print_info "Just to make sure"
    ask_for_confirmation "Continue? "
  fi

  # Check if answer is yes
  if answer_is_yes || [[ $auto_yes -eq 1 ]]; then
    check_for_sudo

    if [[ ${exclude_topics} -eq 1 ]]; then
      install_topics "" "${topics[*]}"
    else
      install_topics "${topics[*]}"
    fi

    install_local_dotfiles

  else
    print_error "Error: aborted"
    exit 1
  fi

  print_finish_message
}

# ---------------------------------------------

print_help() {
  local script_name="./install.sh"

  [[ -n "$DOTS" ]] \
    && script_name="dots install"

  cat <<EOF

  Installs the dotfiles

  Usage

    $script_name [options] [...topics]

  Options

    -y, --yes               Skip confirmation questions
    -e, --exclude           Exclude [...topics] from installation
    -l, --install-local     Run the local installation script
    -h, --help              Show help output

  Examples

    $script_name common git
    $script_name --exclude npm homebrew
EOF
}

# ---------------------------------------------

main() {
  while [[ "$1" != "" ]]; do
    case $1 in
      -y | --yes)
        auto_yes=1
        shift
        ;;
      -e | --exclude )
        exclude_topics=1
        shift
        ;;
      -l | --install-local )
        install_local_dotfiles
        exit 0
        ;;
      -h | --help )
        print_help
        exit 0
        ;;
      * )
        add_topic "$1"
        shift
        ;;
    esac
  done

  start_procedure
}

main "$@"
