#!/usr/bin/env bash

# ---------------------------------------------

# Status bar config
set -g status on
set -g status-interval 3
set -g status-justify "left"
set -g status-left-length 200
set -g status-right-length 200

# Pane border
set -g pane-border-fg brightblue
set -g pane-active-border-fg brightcyan

# Status bar colors
set -g status-fg brightwhite
set -g status-bg black       # for gotham
set -g message-fg yellow
set -g message-bg black

# Window items
setw -g window-status-format "#[bg=black, fg=cyan, noreverse] #I #[bg=brightblack, fg=brightcyan, noreverse] #W "
setw -g window-status-current-format "#[bg=brightblue, fg=white, noreverse] #I #[fg=brightcyan, bg=brightgreen] #W "
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black
set -g window-status-attr reverse
set -g window-status-activity-attr bold

# Status bar segments

# Make this shit happen
set -g status-left "#[fg=magenta,bold] ♜  #S  "
set -g status-right "#($DOTFILES/tmux/right_segments.sh)"
