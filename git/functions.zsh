function gitzip() {
  git archive -o $(basename `git rev-parse --show-toplevel`).zip HEAD
}

function gittgz() {
  git archive -o $(basename `git rev-parse --show-toplevel`).tgz HEAD
}
