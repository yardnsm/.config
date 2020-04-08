function yolo() {
  local cmd="rm -rf node_modules && npm install --no-package-lock"

  echo "\n  > ${cmd}\n"
  eval "${cmd}"
}

# Make npm fast (use the cache)
alias npmo="npm --cache-min 9999999"

alias npmt="npm test"
alias npms="npm start"
alias npmb="npm run build"
alias npml="npm run lint"

alias npmi="npm install"
alias npmis="npm install --save"
alias npmid="npm install --save-dev"
alias npmig="npm install -g"
