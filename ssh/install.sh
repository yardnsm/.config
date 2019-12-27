#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r SSH_KEY_PATH="$HOME/.ssh/github"

# ---------------------------------------------

is_connection_valid() {
  ssh -T git@github.com &> /dev/null
  [[ $? -eq 1 ]]
}

verify_connection() {
  while true; do
    if is_connection_valid; then
      break
    else
      sleep 3
    fi
  done
}

# ---------------------------------------------

main() {
  print_info "Generating SSH key for GitHub"

  if is_connection_valid; then
    print_success "Connection to GitHub is valid"
  elif [[ -f "${SSH_KEY_PATH}.pub" ]]; then
    print_success "SSH key exists"
  else

    ask::prompt "Please enter your email address: " && echo
    ssh-keygen -t rsa -b 4096 -C "$(ask::get_answer)" -f "$SSH_KEY_PATH" && echo
    print_result $? "Generate SSH keys"

    commands::execute "$(ssh-agent -s)" \
      "Starting SSH agent"

    commands::execute "ssh-add -K ${SSH_KEY_PATH}" \
      "Adding id_rsa to the ssh-agent"

    copy_to_clipboard "$(cat "${SSH_KEY_PATH}.pub")"
    print_result $? "Copy public SSH key to clipboard"

    open_in_browser "https://github.com/settings/keys"
    print_result $? "Opening GitHub settings page"

    verify_connection & show_spinner $! \
      "Verifying SSH connection"
  fi
}

main "$@"
