# Scripts
alias sudo='sudo -E '
alias fp='$HOME_ABS/script/fp.sh'
alias clipfp='$HOME_ABS/script/clipfp.sh'
alias selfp='$HOME_ABS/script/selfp.sh'
alias pk='$HOME_ABS/script/pk.sh'
alias jpk='$HOME_ABS/script/jpk.sh'

alias smst='$HOME_ABS/script/start_metastore.sh'
alias sall='$HOME_ABS/script/start_all.sh'

alias insthv='$HOME_ABS/script/install_hive.sh'
alias instspk='$HOME_ABS/script/install_spark.sh'
alias instshk='$HOME_ABS/script/install_shark.sh'
alias scpinst='$HOME_ABS/script/scp_install.sh'

alias updtrp='$HOME_ABS/script/update_repo.sh'

# Locations
alias gdev='cd $DEVROOT'
alias ghv='cd $DEVROOT/$HIVEROOT/src'
alias gngmr='cd $DEVROOT/ngmr-1.7-transwarp'

# Commands
alias tls='tmux ls' 
alias tat='tmux a -t' 
alias tns='tmux new-session -s'

alias msql='mysql -uroot -pwarp123'
alias trswp='transwarp -N'
alias hbase='/usr/lib/hbase/bin/hbase shell'

alias thive='$HOME_ABS/script/hive.tmux.sh'

alias rbdngmr='cd spark; sbt/sbt clean; cd ..; cd shark; sbt/sbt clean; cd ..; ./compile.sh init; ./compile.sh spark; ./compile.sh shark'

if [ $(uname) = "Darwin" ]; then
    alias clipcpy='tr -d '\n' | pbcopy'
    alias clippst='pbpaste'
    alias selcpy='tr -d '\n' | pbcopy'
    alias selpst='pbpaste'
elif [ $(uname) = "Linux" ]; then
    alias clipcpy='tr -d '\n' | xsel -b'
    alias clippst='xsel -b -o'
    alias selcpy='tr -d '\n' | xsel'
    alias selpst='xsel -o'
fi
