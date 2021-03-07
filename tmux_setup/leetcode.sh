tmux new-session -d -s leetcode
tmux new-window

# Setup my most common development setup for lcancel
tmux select-window -t 1
tmux send-keys 'cd ~/leetcode/go'
tmux send-keys Enter
tmux select-window -t 2
tmux send-keys 'cd ~/leetcode/go'
tmux send-keys Enter

tmux attach-session -t leetcode
