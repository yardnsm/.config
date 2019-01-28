# Init antibody
source <(antibody init)

antibody bundle <<EOBUNDLES
  rupa/z
  zsh-users/zsh-completions
  supercrabtree/k
EOBUNDLES

# Plugins to use when *not* inside an ssh session
if [[ -z $SSH_CONNECTION ]]; then
  antibody bundle <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
EOBUNDLES
fi
