# ./zsh/.zshev
s/\(TMUX_SPOTIFY_API_KEY="\).*\("\)$/\1{{ TMUX_SPOTIFY_API_KEY }}\2/

# ./git/local
s/^\(  name = \).*$/\1{{ GIT_PERSONAL_NAME }}/
s/^\(  email = \).*$/\1{{ GIT_PERSONAL_EMAIL }}/
s/^\(  user = \).*$/\1{{ GIT_PERSONAL_USER }}/
