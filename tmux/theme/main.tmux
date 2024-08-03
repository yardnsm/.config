# vim: set foldmethod=marker foldlevel=0:

# Status bar config
set -g status on
set -g status-position top
set -g status-interval 1
set -g status-justify left
set -g status-left-length 200
set -g status-right-length 200

# Pane border
setw -g pane-border-status top
setw -g pane-border-format '─'
set -g pane-border-style fg=brightblack
set -g pane-active-border-style fg=blue

# Status bar colors
set -g status-style fg=brightwhite,bg=black
set -g message-style fg=yellow,bg=black

# Window separator
setw -g window-status-separator '#[fg=colour240 nobold] ⋅ #[bg=default fg=default]'

# Window item
setw -g window-status-format "#[bg=black, noreverse]#{?window_activity_flag,#[fg=colour240],#[fg=colour240]}#I #W#{?window_activity_flag,*,}"

# Selected window item
setw -g window-status-current-format "#[fg=blue bold, bg=black, noreverse]#I #{?window_zoomed_flag,[#W],#W}"

# Left side: session name
set -g status-left "#[fg=white bold] #S  "

# Right side: indicator when prefix is selected + right segments
set -g status-right "#{?client_prefix,#[fg=blue bold]^A#{window-status-separator},}#($XDG_CONFIG_HOME/tmux/theme/status_line.sh) "
