#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

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
  local ssh_key_path="$HOME/.ssh/github"

  print_info "Generating SSH key for GitHub"

  if is_connection_valid; then
    print_success "Connection to GitHub is valid"
  elif [[ -f "$ssh_key_path" ]]; then
    print_success "SSH key exists"
  else

    ask "Please enter your email address: " && echo
    ssh-keygen -t rsa -b 4096 -C "$(get_answer)" -f "$ssh_key_path" && echo
    print_result $? "Generate SSH keys"

    execute "$(ssh-agent -s)" \
      "Starting SSH agent"

    execute "ssh-add -K ${ssh_key_path}" \
      "Adding id_rsa to the ssh-agent"

    copy_to_clipboard "$(cat "${ssh_key_path}.pub")"
    print_result $? "Copy public SSH key to clipboard"

    open_in_browser "https://github.com/settings/keys"
    print_result $? "Opening GitHub settings page"

    verify_connection & show_spinner $! \
      "Verifying SSH connection"
  fi
}

main "$@"
