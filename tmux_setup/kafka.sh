tmux new-session -d -s kafka
tmux split-window -v

# Start zookeeper
tmux select-pane -t 0
tmux send-keys 'cd ${MY_KAFKA_HOME}'
tmux send-keys Enter
tmux send-keys 'bin/zookeeper-server-start.sh config/zookeeper.properties'
tmux send-keys Enter

# Start kafka server
tmux select-pane -t 1
tmux send-keys 'cd ${MY_KAFKA_HOME}'
tmux send-keys Enter
tmux send-keys 'bin/kafka-server-start.sh config/server.properties'
tmux send-keys Enter

echo "To see the kafka windows run the below command"
echo "tmux a -t kafka"
