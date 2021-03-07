tmux new-session -d -s lcancel
tmux split-window -v
tmux split-window -h

# Setup my most common development setup for lcancel
tmux select-pane -t 1
tmux send-keys 'cd ~/Lcancel/lcancel_react/lcancel; node_modules/.bin/nodemon ./bin/www;'
tmux send-keys Enter
tmux select-pane -t 2
tmux send-keys 'cd ~/Lcancel/lcancel_react/lcancel; npm start;'
tmux send-keys Enter
tmux select-pane -t 0
tmux send-keys 'cd ~/Lcancel/lcancel_react/lcancel; git status;'
tmux send-keys Enter

tmux attach-session -t lcancel
