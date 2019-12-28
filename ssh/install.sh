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
  output::info "Generating SSH key for GitHub"

  if os::is_ci; then
    output::status "Skipping inside a CI"
    return 1
  fi

  if is_connection_valid; then
    output::success "Connection to GitHub is valid"
  elif [[ -f "${SSH_KEY_PATH}.pub" ]]; then
    output::success "SSH key exists"
  else

    ask::prompt "Please enter your email address: " && echo
    ssh-keygen -t rsa -b 4096 -C "$(ask::get_answer)" -f "$SSH_KEY_PATH" && echo
    output::result $? "Generate SSH keys"

    commands::execute "$(ssh-agent -s)" \
      "Starting SSH agent"

    commands::execute "ssh-add -K ${SSH_KEY_PATH}" \
      "Adding id_rsa to the ssh-agent"

    actions::copy_to_clipboard "$(cat "${SSH_KEY_PATH}.pub")"
    output::result $? "Copy public SSH key to clipboard"

    actions::open "https://github.com/settings/keys"
    output::result $? "Opening GitHub settings page"

    verify_connection & spinner:show_for_process $! \
      "Verifying SSH connection"
  fi
}

main "$@"
