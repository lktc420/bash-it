#!/bin/sh

tmux new-session -d -s hive -n hive
tmux send-keys 'ghv' 'C-m'

tmux new-window -n ngmr
tmux send-keys 'gngmr' 'C-m'

tmux new-window -n run
# tmux send-keys 'ghv' 'C-m' 'cd build/dist' 'C-m'

tmux new-window -n sql
tmux send-keys 'ghv' 'C-m' 'cd sqlUnitTest' 'C-m'

tmux new-window -n mysql
tmux send-keys 'su' 'C-m'

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
