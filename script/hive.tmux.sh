#!/bin/sh

tmux new-session -d -s hive -n hive
tmux send-keys 'ghv' 'C-m'

tmux new-window -n ngmr
tmux send-keys 'gngmr' 'C-m'

tmux new-window -n run
tmux split-window -v

tmux new-window -n sql
tmux send-keys 'ghv' 'C-m' 'cd sqlUnitTest' 'C-m'

tmux new-window -n inceptor
if [ "$TDH_VERSION" = "3.4" ]; then
tmux send-keys 'gdev; cd shark' 'C-m'
else
tmux send-keys 'gdev; cd inceptor' 'C-m'
fi

tmux new-window -n mysql
tmux send-keys 'msql' 'C-m'

tmux new-window -n bash-it
tmux send-keys 'gbsht' 'C-m'

# tmux new-window -n hadoop
# tmux send-keys 'ghdp' 'C-m'
# 
# tmux new-window -n warehouse
# tmux send-keys 'gwhs' 'C-m'
# 
# tmux new-window -n scratch
# tmux send-keys 'gscrt' 'C-m'

tmux select-window -t 0
tmux -2 a -t hive
