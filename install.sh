#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "./_setup/initializer.sh"

# ---------------------------------------------

declare -r TOPICS_FILE=".topics"

declare topics_to_install=()
declare topics_to_exclude=()

declare current_flag=""
declare use_topics_file=1

# ---------------------------------------------

add_topic_to_exclude() {
  # 'only' takes priority, so we need to fill "$topics_to_exclude"
  # only if "$topics_to_install" is empty
  if is_topic_exist "$1"; then
    [[ ${#topics_to_install} -eq 0 ]] && topics_to_exclude+=("$1")
  else
    print_error "Topic $1 does not exist!"
    exit 1
  fi
}

add_topic_to_install() {
  if is_topic_exist "$1"; then
    topics_to_exclude=()
    topics_to_install+=("$1")
  else
    print_error "Topic $1 does not exist!"
    exit 1
  fi
}

# ---------------------------------------------

install_local_dotfiles() {

  print_title "Running local installation script"

  if [[ -f "$DOTFILES_LOCAL/install.sh" ]]; then
    print_status "A dotfiles-local directory was found with
       an install.sh script. It'll run in 3 seconds."

    sleep 3

    source "$DOTFILES_LOCAL/install.sh"
  else
    print_status "No local installation script was found"
  fi
}

read_from_topics_file() {
  ! [[ -f "$TOPICS_FILE" ]] && return 1

  while read -r line; do
    local excluded=0
    local topic_name="$line"

    [[ "${line:0:1}" == "#" ]] \
      && continue

    # Check if should be excluded
    if [[ "${line:0:1}" == "!" ]]; then
      excluded=1
      topic_name="${line:1}"
    fi

    if is_topic_exist "$topic_name"; then

      if [[ $excluded -eq 1 ]]; then
        add_topic_to_exclude "$topic_name"
      else
        add_topic_to_install "$topic_name"
      fi
    else
      print_error "Error in \`$TOPICS_FILE\` file: topic \`$topic_name\` does not exist!"
      exit 1
    fi
  done < "$TOPICS_FILE"
}

# ---------------------------------------------

start_procedure() {

  print_welcome_message

  if [[ $use_topics_file -eq 1 ]]; then
    read_from_topics_file

    [[ $? -ne 1 ]] \
      && print_status "A \`$TOPICS_FILE\` file was found and used\\n"
  fi

  [[ ${#topics_to_install} -ne 0 ]] \
    && print_status "Topics to install: ${topics_to_install[*]}"

  [[ ${#topics_to_exclude} -ne 0 ]] \
    && print_status "Topics to exclude: ${topics_to_exclude[*]}"

  print_title "Getting ready"

  # Run preinstall script
  print_info "Make sure everything alright"
  source "./_setup/preinstall.sh"

  # Ask if it's okay
  if ! [[ -n $auto_yes ]]; then
    print_info "Just to make sure"
    ask_for_confirmation "Continue? "
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
  cat <<EOF

  Installs the dotfiles

  Usage
    ./install.sh [options]

  Options
    -y, --yes               Skip confirmation questions
    -o, --only              Topics to install only
    -e, --exclude           Topics so exclude
    --install-local         Run the local installation script
    --no-topics-file        Do not use topics file
    -h, --help              Show help output

  Examples
    ./install.sh --exclude npm homebrew
    ./install.sh --only common git
EOF
}

# ---------------------------------------------

main() {
  while [[ "$1" != "" ]]; do
    case $1 in
      -y | --yes)
        auto_yes="true"
        shift
        ;;
      --no-topics-file )
        use_topics_file=0
        shift
        ;;
      -e | --exclude )
        current_flag="exclude"
        shift
        ;;
      -o | --only )
        current_flag="only"
        shift
        ;;
      --install-local )
        install_local_dotfiles
        exit 0
        ;;
      -h | --help )
        print_help
        exit 0
        ;;
      * )

        case $current_flag in
          "exclude" )
            add_topic_to_exclude "$1"
            ;;
          "only" )
            add_topic_to_install "$1"
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
