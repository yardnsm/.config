#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  output::info "Installing phpbrew"

  if ! commands::exists 'phpbrew'; then
    commands::execute \
      "curl -L -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar && chmod +x phpbrew.phar" \
      "Download executable"

    commands::execute "sudo mv phpbrew.phar /usr/local/bin/phpbrew" \
      "Installing to /usr/local/bin/"
  else
    output::success 'phpbrew is already installed'
  fi
}

main "$@"
