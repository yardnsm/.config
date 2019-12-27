#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "./.setup/initializer.sh"

# ---------------------------------------------

declare topics=()

declare auto_yes=0
declare exclude_topics=0

# ---------------------------------------------

add_topic() {
  if topics::exists "$1"; then
    topics+=( "$1" )
  else
    echo
    output::error "Error: topic $1 does not exist!"
    exit 1
  fi
}

# ---------------------------------------------

install_local_dotfiles() {

  output::title "Running local installation script"
  printf '\n'

  if [[ -f "$DOTFILES_LOCAL/install.sh" ]]; then
    output::status "A dotfiles-local directory was found with
        an install.sh script. It'll run in 3 seconds."

    sleep 3

    source "$DOTFILES_LOCAL/install.sh"
  else
    output::status "No local installation script was found"
  fi
}

# ---------------------------------------------

start_procedure() {

  output::welcome_message

  if [[ ${#topics} -ne 0 ]]; then
    echo

    if [[ ${exclude_topics} -eq 1 ]]; then
      output::status "Topics to exclude: ${topics[*]}"
    else
      output::status "Topics to install: ${topics[*]}"
    fi
  fi

  output::title "Getting ready"

  # Run preinstall script
  output::info "Make sure everything's alright"
  source "./.setup/preinstall.sh"

  # Ask if it's okay
  if ! [[ $auto_yes -eq 1 ]]; then
    output::info "Just to make sure"
    ask::prompt_confirmation "Continue? "
  fi

  # Check if answer is yes
  if ! ( ask::answer_is_yes || [[ $auto_yes -eq 1 ]] ); then
    output::error "Error: aborted"
    exit 1
  fi

  ask::check_sudo

  if [[ ${exclude_topics} -eq 1 ]]; then
    topics::install_multiple "" "${topics[*]}"
  else
    topics::install_multiple "${topics[*]}"
  fi

  install_local_dotfiles

  output::info " Setup is done! You might need to restart your system to see full changes."
}

# ---------------------------------------------

print_help() {
  local script_name="./install.sh"

  [[ -n "$FROM_DOTS" ]] \
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
