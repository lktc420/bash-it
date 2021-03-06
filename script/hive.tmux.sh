#!/bin/sh

tmux new-session -d -s hive -n hive
tmux send-keys 'ghv' 'C-m'

tmux new-window -n ngmr
tmux send-keys 'gngmr' 'C-m' 'cd spark' 'C-m'
tmux split-window -h
tmux send-keys 'gngmr' 'C-m' 'cd idbc' 'C-m'
tmux select-pane -t 1
tmux split-window -v
tmux send-keys 'gngmr' 'C-m'
tmux select-pane -t 3
tmux split-window -v
tmux send-keys 'gngmr' 'C-m' 'cd inceptor' 'C-m'

tmux new-window -n run
tmux split-window -v

tmux new-window -n sql
tmux send-keys 'ghv' 'C-m' 'cd sqlUnitTest' 'C-m'
tmux split-window -v
tmux send-keys 'gdev; cd inceptor_idea/sql' 'C-m'

tmux new-window -n mysql
tmux send-keys 'msql' 'C-m'

tmux new-window -n bash-it
tmux send-keys 'gbsht' 'C-m'

tmux new-window -n inceptor_idea
tmux send-keys 'gdev; cd inceptor_idea' 'C-m'

tmux new-window -n precheck
tmux send-keys 'gdev; cd precheck' 'C-m'

tmux select-window -t 1
tmux select-pane -t 1
tmux -2 a -t hive
