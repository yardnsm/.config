# Init antibody
source <(antibody init)

antibody bundle <<EOBUNDLES
  lukechilds/zsh-nvm
  rupa/z
  zsh-users/zsh-completions
  chrissicool/zsh-256color
  supercrabtree/k
EOBUNDLES

# Plugins to use when not inside an ssh session
if [[ -z $SSH_CONNECTION ]]; then
  antibody bundle <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
EOBUNDLES
fi
