#!/usr/bin/env bash

current_dir="$(dirname "${BASH_SOURCE[0]}")"

# ---------------------------------------------

source "$current_dir/_setup/initializer.sh"

# ---------------------------------------------

declare topics_to_install=()
declare topics_to_exclude=()
declare current_flag=""

# ---------------------------------------------

install_local_dotfiles() {

  print_title "Running local installation script"

  if [[ -f "$DOTFILES_LOCAL/install.sh" ]]; then
    print_status "A dotfiles-local directory was found with
       an install.sh script. It'll run in 3 seconds."

    sleep 3

    source "$DOTFILES_LOCAL/install.sh"
  else
    print_status "Mo local installation script was found"
  fi
}

# ---------------------------------------------

start_procedure() {

  print_welcome_message

  [[ ${#topics_to_install} -ne 0 ]] && \
    print_status "Topics to install: ${topics_to_install[*]}"

  [[ ${#topics_to_exclude} -ne 0 ]] && \
    print_status "Topics to exclude: ${topics_to_exclude[*]}"

  print_title "Getting ready"

  # Run preinstall script
  print_info "Make sure everything alright"
  source "$DOTFILES/_setup/preinstall.sh"

  # Ask if it's okay
  if ! [[ -n $auto_yes ]]; then
    print_info "Just to make sure"
    ask_for_confirmation "Continue? "
    print_divider
  fi

  # Check if answer is yes
  if answer_is_yes || [[ -n $auto_yes ]]; then
    check_for_sudo

    install_topics "${topics_to_install[*]}" "${topics_to_exclude[*]}"

    install_local_dotfiles

  else
    print_error "aborted"
    exit 1
  fi

  print_finish_message

}

# ---------------------------------------------

print_help() {
  echo "Usage: ./install,sh [options]"
  echo "  Installs the dotfiles"
  echo ""
  echo "Options:"
  echo "  -o, --only [topics]           Specify topics to install and ignore everything else"
  echo "  -e, --exclude [topics]        Specify topics to exclude"
  echo "  --install-local               Run the local installation script"
  echo "  -h, --help                    Show this output"
  echo ""
  echo "Example:"
  echo "  $ ./install --exclude npm homebrew"
  echo "  $ ./install --only common git"
  echo ""
}

# ---------------------------------------------

main() {
  while [[ "$1" != "" ]]; do
    case $1 in
      -y | --yes)
        auto_yes="true"
        shift
        ;;
      -e | --exclude )
        current_flag="exclude"
        shift
        ;;
      --install-local )
        install_local_dotfiles
        exit 0
        ;;
      -o | --only )
        current_flag="only"
        shift
        ;;
      -h | --help )
        print_help
        exit 0
        ;;
      * )

        case $current_flag in
          "exclude" )
            # 'only' should be in higher priority, so only if
            # $topic_to_install is empty, fill topic_to_ignore
            if is_topic_exist "$1"; then
              [[ ${#topics_to_install} -eq 0 ]] && topics_to_exclude+=("$1")
            else
              print_error "Topic $1 does not exist!"
              exit 1
            fi
            ;;
          "only" )
            if is_topic_exist "$1"; then
              topics_to_exclude=()
              topics_to_install+=("$1")
            else
              print_error "Topic $1 does not exist!"
              exit 1
            fi
            ;;
          * )
            print_error "Unknown option $1";
            exit 1;
        esac
        shift
        ;;
    esac
  done

  start_procedure
}

main "$@"
