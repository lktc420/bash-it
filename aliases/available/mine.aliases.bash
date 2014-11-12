# Envs
if [ $(uname) = "Darwin" ]; then
    export HOME_ABS=/Users/zanmato
    export DEVROOT=$HOME_ABS/git
    export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
elif [ $(uname) = "Linux" ]; then
    export HOME_ABS=/home/ruoxi
    export DEVROOT=$HOME_ABS/dev
    export JAVA_HOME=/usr/lib/jvm/java-6-oracle
    # export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
fi
export SCRIPT_HOME=$BASH_IT/script
export CONF_HOME=$BASH_IT/conf
export SCALA_HOME=/usr/lib/scala-2.11.1
export PATH=$JAVA_HOME:$JAVA_HOME/bin:$SCALA_HOME/bin:$HIVE_HOME/bin:/usr/lib/hadoop/bin:/usr/lib/hadoop-hdfs/bin:$PATH
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec
export HIVE_HOME=/usr/lib/hive
export HIVEROOT=hive-0.12.0-transwarp
#export HIVEROOT=WARP-1019-hive-0.12.0-transwarp
export HBASE_CONF_DIR=/usr/lib/hbase/conf
export POOIQWRKNV_JKLJFWPEO_DFQQWE_LBIERPL_MDCJKD_NOT_RECOMMANDED=true

export SVN_HIVE_BRANCH=https://172.16.1.168/transwarp/sbranches/ruoxi/warp-1336-hive-0.12.0-transwarp/hive-0.12.0-transwarp
export SVN_HIVE_TRUNK=https://172.16.1.168/transwarp/trunk/hadoop/sources/hive-0.12.0-transwarp

export EDITOR='vi'
export GIT_EDITOR='vi'

# Scripts
alias sudo='sudo -E '

alias smst='$SCRIPT_HOME/start_metastore.sh'
alias scldr='$SCRIPT_HOME/start_clidriver.sh'
alias sall='$SCRIPT_HOME/start_all.sh'

alias insthv='$SCRIPT_HOME/install_hive.sh'
alias instspk='$SCRIPT_HOME/install_spark.sh'
alias insticpt='$SCRIPT_HOME/install_inceptor.sh'
alias scpinst='$SCRIPT_HOME/scp_install.sh'

alias updtrp='$SCRIPT_HOME/update_repo.sh'
unalias q

# Locations
alias gdev='cd $DEVROOT'
alias gbsht='cd $BASH_IT'
alias ghv='cd $DEVROOT/$HIVEROOT/src'
alias gngmr='cd $DEVROOT/ngmr-1.7-transwarp'

# Commands
alias tmux='tmux -2' 
alias tls='tmux ls' 
alias tat='tmux a -t' 
alias tns='tmux new-session -s'

alias msqld='mysqld_safe &'
alias msql='mysql -uroot -ppassword hive_metastore'
alias trswp='transwarp -N'
alias hbase='/usr/lib/hbase/bin/hbase shell'

alias thive='$SCRIPT_HOME/hive.tmux.sh'

alias rbdhv='ant clean package'
alias rbdicpt='cd inceptor; sbt/sbt clean; cd ..; ./compile.sh inceptor'
alias rbdngmr='cd spark; sbt/sbt clean; cd ..; cd inceptor; sbt/sbt clean; cd ..; ./compile.sh init; ./compile.sh spark; ./compile.sh inceptor'
