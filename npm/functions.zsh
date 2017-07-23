function yolo() {
  local install_cmd='npm install'

  if [[ -f yarn.lock ]]; then
    install_cmd='yarn install --no-lockfile'
  fi

  echo "\n  > rm -rf node_modules && $install_cmd\n"
  sleep 2

  eval "rm -rf node_modules && $install_cmd"
}
