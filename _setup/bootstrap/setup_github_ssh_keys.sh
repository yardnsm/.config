#!/usr/bin/env bash

# ---------------------------------------------

is_connection_valid() {
  ssh -T git@github.com &> /dev/null
  return $?
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

  if is_connection_valid || ! [[ -f "$ssh_key_path" ]]; then

    title "Generating an SSH key for you"

    ask "Please enter your email address" && echo
    ssh-keygen -t rsa -b 4096 -C "$(get_answer)" -f "$ssh_key_path"
    print_result $? "Generate SSH keys"

    eval "$(ssh-agent -s)"
    print_result $? "Starting SSH agent"

    ssh-add -K ~/.ssh/id_rsa
    print_result $? "Adding id_rsa to the ssh-agent"

    copy_to_clipboard "$(cat "${ssh_key_path}.pub")" \
      "Copy public SSH key to clipboard"

    print_status "Please proceed manually"
    open_in_browser "https://github.com/settings/keys"

    verify_connection & show_spinner $! \
      "Verifying SSH connection"
  fi
}

main "$@"
