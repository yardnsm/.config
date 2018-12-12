#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

main() {
  print_info "Installing phpbrew"

  if ! cmd_exists 'phpbrew'; then
    execute "curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && chmod +x phpbrew" \
      "Download executable"

    execute "sudo mv phpbrew /usr/local/bin/phpbrew" \
      "Installing to /usr/local/bin/"
  else
    print_success 'phpbrew is already installed'
  fi
}

main "$@"
