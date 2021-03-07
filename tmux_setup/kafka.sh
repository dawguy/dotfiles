tmux new-session -d -s kafka
tmux split-window -v
tmux select-window -t 1

# Start zookeeper
tmux send-keys 'cd ${MY_KAFKA_HOME}'
tmux send-keys Enter
tmux send-keys 'bin/zookeeper-server-start.sh config/zookeeper.properties'
tmux send-keys Enter

# Start kafka server
tmux select-window -t 2
tmux send-keys 'cd ${MY_KAFKA_HOME}'
tmux send-keys Enter
tmux send-keys 'bin/kafka-server-start.sh config/server.properties'
tmux send-keys Enter

tmux attach-session -t kafka
