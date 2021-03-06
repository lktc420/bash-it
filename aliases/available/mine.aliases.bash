# Envs

# stty -ixon -ixoff
export MAVEN_OPTS="-Xmx8192m -XX:MaxPermSize=1024m"
export SCRIPT_HOME=$BASH_IT/script
export SCALA_HOME=/usr/lib/scala-2.11.1
export PATH=$JAVA_HOME:$JAVA_HOME/bin:$SCALA_HOME/bin:$MAVEN_HOME/bin:$PATH
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec
export HIVE_HOME=/usr/lib/hive
export HIVEROOT=hive-0.12.0-transwarp
export NGMRROOT=ngmr-1.7-transwarp
export INCEPTORIDEAROOT=inceptor_idea
export HBASE_CONF_DIR=/usr/lib/hbase/conf
export POOIQWRKNV_JKLJFWPEO_DFQQWE_LBIERPL_MDCJKD_NOT_RECOMMANDED=true

export SVN_ROOT=https://172.16.1.168/transwarp
export BRANCH=$SVN_ROOT/sbranches/ruoxi
export TRUNK=$SVN_ROOT/trunk/hadoop/sources

export HIVE_BRANCH=$BRANCH/warp-4813-hive
export NGMR_BRANCH=$BRANCH/warp-4813-ngmr
export INCEPTOR_BRANCH=$BRANCH/warp-4813-inceptor

export HIVE_TRUNK=$TRUNK/hive-0.12.0-transwarp
export NGMR_TRUNK=$TRUNK/ngmr-1.7-transwarp
export INCEPTOR_TRUNK=$TRUNK/inceptor_idea

export EDITOR='vi'
export GIT_EDITOR='vi'

alias sudo='sudo -E '

# Scripts
alias rfricpt='touch $DEVROOT/$NGMRROOT/inceptor/target/scala-2.10/inceptor_2.10-1.1.0-transwarp.jar'
alias smst='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.metastore.HiveMetaStore &'
alias scldr='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.cli.CliDriver -N'
alias shsv='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh io.transwarp.ngmr.NgmrServer &'
alias srcldr='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hadoop.hive.cli.CliDriver -N -h localhost'
alias sbl='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive://localhost:10000/default'
alias shsv2='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh io.transwarp.inceptor.InceptorServer2 &'
alias sbl2='$DEVROOT/$INCEPTORIDEAROOT/bin/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive2://localhost:10000/default -n zhu -p 123456'

alias sall='$SCRIPT_HOME/start_all.sh'

alias scpinst='$SCRIPT_HOME/scp_install.sh'

alias updtrp='$SCRIPT_HOME/update_repo.sh'
unalias q

# Locations
alias gdev='cd $DEVROOT'
alias gbsht='cd $BASH_IT'
alias ghv='cd $DEVROOT/$HIVEROOT/src'
alias gngmr='cd $DEVROOT/$NGMRROOT'

# Commands
alias tmux='tmux -2' 
alias tls='tmux ls' 
alias tat='tmux a -t' 
alias tns='tmux new-session -s'

alias msqld='mysqld_safe &'
alias msql='mysql -uroot -ppassword hive_metastore'
alias hbase='/usr/lib/hbase/bin/hbase shell'

alias thive='$SCRIPT_HOME/hive.tmux.sh'

alias icv='iconv -f gbk -t utf-8'

alias clhbs='rm -rf ~/.m2/repository/org/apache/hbase ~/.ivy2/cache/org.apache.hbase'
alias clhv='rm -rf ~/.m2/repository/org/apache/hive ~/.ivy2/local/org.apache.hive ~/.ivy2/local/org.apache.hive.shims ~/.ivy2/cache/org.apache.hive ~/.ivy2/cache/org.apache.hive.shims'
alias clspk='rm -rf ~/.m2/repository/org/apache/spark ~/.ivy2/local/org.apache.spark ~/.ivy2/cache/org.apache.spark'

alias rbdgrm='mvn clean org.antlr:antlr3-maven-plugin:3.4:antlr 2>&1 | tee ../grammar.log'
alias bdhv='mvn install -DskipTests -Pidea'
alias rbdhv='mvn clean install -DskipTests -Pidea'

alias bdspk='mvn install -DskipTests -Pyarn -Pidea'
alias rbdspk='mvn clean install -DskipTests -Pyarn -Pidea'

alias bdidbc='mvn install -DskipTests -Pidea'
alias rbdidbc='mvn clean install -DskipTests -Pidea'

alias bdicpt='mvn install -Dmaven.test.skip=true -Pidea'
alias rbdicpt='mvn clean install -Dmaven.test.skip=true -Pidea'

alias plt='$SCRIPT_HOME/plt.sh'

alias insthv='rm -rf $DEVROOT/precheck/jar/hive/*; cp `find $DEVROOT/$HIVEROOT/src -name "hive*jar" | grep -v "tests.jar"` $DEVROOT/precheck/jar/hive/'
alias instspk='rm -rf $DEVROOT/precheck/jar/spark/*; cp $DEVROOT/$NGMRROOT/spark/core/target/scala-2.10/spark-core_2.10-1.1.0-transwarp.jar $DEVROOT/precheck/jar/spark/ngmr-core_2.10-1.1.0-transwarp.jar; cp $DEVROOT/$NGMRROOT/spark/holodesk/target/scala-2.10/spark-holodesk_2.10-1.1.0-transwarp.jar $DEVROOT/precheck/jar/spark/ngmr-holodesk_2.10-1.1.0-transwarp.jar'
alias insticpt='rm -rf $DEVROOT/precheck/jar/inceptor/*; cp $DEVROOT/$NGMRROOT/inceptor/target/scala-2.10/inceptor_2.10-1.1.0-transwarp.jar $DEVROOT/precheck/jar/inceptor/ngmr-shell_2.10-1.1.0-transwarp.jar'
