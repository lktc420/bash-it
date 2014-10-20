# Scripts
alias sudo='sudo -E '
alias fp='$SCRIPT_HOME/fp.sh'
alias clipfp='$SCRIPT_HOME/clipfp.sh'
alias selfp='$SCRIPT_HOME/selfp.sh'
alias pk='$SCRIPT_HOME/pk.sh'
alias jpk='$SCRIPT_HOME/jpk.sh'

alias smst='$SCRIPT_HOME/start_metastore.sh'
alias sall='$SCRIPT_HOME/start_all.sh'

alias insthv='$SCRIPT_HOME/install_hive.sh'
alias instspk='$SCRIPT_HOME/install_spark.sh'
alias instshk='$SCRIPT_HOME/install_shark.sh'
alias scpinst='$SCRIPT_HOME/scp_install.sh'

alias updtrp='$SCRIPT_HOME/update_repo.sh'

# Locations
alias gdev='cd $DEVROOT'
alias gbsht='cd $BASH_IT'
alias ghv='cd $DEVROOT/$HIVEROOT/src'
alias gngmr='cd $DEVROOT/ngmr-1.7-transwarp'

# Commands
alias tls='tmux ls' 
alias tat='tmux a -t' 
alias tns='tmux new-session -s'

alias msql='mysql -uroot -pwarp123'
alias trswp='transwarp -N'
alias hbase='/usr/lib/hbase/bin/hbase shell'

alias thive='$SCRIPT_HOME/hive.tmux.sh'

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
