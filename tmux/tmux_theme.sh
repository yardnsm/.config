#!/usr/bin/env bash

# ---------------------------------------------

# Status bar config
set -g status on
set -g status-position top
set -g status-interval 3
set -g status-justify "left"
set -g status-left-length 200
set -g status-right-length 200

# Pane border
set -g pane-border-fg brightblue
set -g pane-active-border-fg brightcyan

# Show border on top
setw -g pane-border-status top
setw -g pane-border-format '─'

# Status bar colors
set -g status-fg brightwhite
set -g status-bg black       # for gotham
set -g message-fg yellow
set -g message-bg black

# Window items
setw -g window-status-format "#[bg=black, noreverse]#{?window_activity_flag,#{?window_bell_flag,#[fg=brightred],#[fg=colour243]},#[fg=colour235]}#W "
setw -g window-status-current-format "#[fg=brightcyan, bg=black, noreverse]#{?window_zoomed_flag,[#W],#W} "
setw -g window-status-current-attr dim
setw -g window-status-bg green
setw -g window-status-fg black
set -g window-status-attr reverse
set -g window-status-activity-attr bold

# Make this shit happen
set -g status-left "#[fg=yellow] λ #[fg=blue] --  "
set -g status-right "#($DOTFILES/tmux/right_segments.sh)"
