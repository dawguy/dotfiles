tmux new-session -d -s tripanels
tmux split-window -v
tmux split-window -h

tmux attach-session -t tripanels
