# Envs

# stty -ixon -ixoff

if [ $(uname) = "Darwin" ]; then
  export HOME_ABS=/Users/zanmato
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
elif [ $(uname) = "Linux" ]; then
  export HOME_ABS=/home/ruoxi
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle
    # export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
fi
export DEVROOT=$HOME_ABS/dev
export MAVEN_OPTS="-Xmx4096m -XX:MaxPermSize=1024m"
export SCRIPT_HOME=$BASH_IT/script
export SCALA_HOME=/usr/lib/scala-2.11.1
export PATH=$JAVA_HOME:$JAVA_HOME/bin:$SCALA_HOME/bin:$HIVE_HOME/bin:/usr/lib/hadoop/bin:/usr/lib/hadoop-hdfs/bin:$PATH
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_LIBEXEC_DIR=$HADOOP_HOME/libexec
export HIVE_HOME=/usr/lib/hive
export HIVEROOT=hive-0.12.0-transwarp
export NGMRROOT=ngmr-1.7-transwarp
export HBASE_CONF_DIR=/usr/lib/hbase/conf
export POOIQWRKNV_JKLJFWPEO_DFQQWE_LBIERPL_MDCJKD_NOT_RECOMMANDED=true

export SVN_ROOT=https://172.16.1.168/transwarp
export BRANCH=$SVN_ROOT/sbranches/ruoxi
export TRUNK=$SVN_ROOT/trunk/hadoop/sources

#export HIVE_BRANCH=$BRANCH/warp-2836-hive
#export NGMR_BRANCH=$BRANCH/warp-2836-ngmr
export HIVE_BRANCH=$BRANCH/warp-3479-hive
export NGMR_BRANCH=$BRANCH/warp-3479-ngmr

export HIVE_TRUNK=$TRUNK/hive-0.12.0-transwarp
export NGMR_TRUNK=$TRUNK/ngmr-1.7-transwarp

export EDITOR='vi'
export GIT_EDITOR='vi'

alias sudo='sudo -E '

# Scripts
alias smst='$SCRIPT_HOME/start_hive.sh org.apache.hadoop.hive.metastore.HiveMetaStore &'
alias scldr='$SCRIPT_HOME/start_hive.sh org.apache.hadoop.hive.cli.CliDriver -N'
alias sisv='$SCRIPT_HOME/start_hive.sh io.transwarp.ngmr.NgmrServer &'
alias sbl='$SCRIPT_HOME/start_hive.sh org.apache.hive.beeline.BeeLine -u jdbc:hive://localhost:10000/default'
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

alias rbdgrm='mvn clean org.antlr:antlr3-maven-plugin:3.4:antlr 2>&1 | tee ../grammar.log'
alias bdhv='if [ "$TDH_VERSION" = "3.4" ]; then ant package; else mvn install -Dmaven.test.skip=true; fi'
alias rbdhv='if [ "$TDH_VERSION" = "3.4" ]; then ant clean package; else mvn clean install -Dmaven.test.skip=true; fi'
# alias bdhv='if [ "$TDH_VERSION" = "3.4" ]; then ant package; else mvn install -DskipTests; fi'
# alias rbdhv='if [ "$TDH_VERSION" = "3.4" ]; then ant clean package; else mvn clean install -DskipTests; fi'
alias clhbs='rm -rf ~/.m2/repository/org/apache/hbase ~/.ivy2/cache/org.apache.hbase'
alias clhv='rm -rf ~/.m2/repository/org/apache/hive ~/.ivy2/local/org.apache.hive ~/.ivy2/local/org.apache.hive.shims ~/.ivy2/cache/org.apache.hive ~/.ivy2/cache/org.apache.hive.shims'
alias clspk='rm -rf ~/.m2/repository/org/apache/spark ~/.ivy2/local/org.apache.spark ~/.ivy2/cache/org.apache.spark'
alias rbdspk='if [ "$TDH_VERSION" = "3.4" ]; then cd spark; sbt/sbt clean; cd ..; ./compile.sh init; ./compile.sh spark; else cd spark; sbt/sbt clean publish-local; cd ..; fi'
alias bdicpt='if [ "$TDH_VERSION" = "3.4" ]; then ./compile.sh shark; else cd inceptor; sbt/sbt package; cd ..; fi'
alias rbdicpt='if [ "$TDH_VERSION" = "3.4" ]; then cd shark; sbt/sbt clean; cd ..; ./compile.sh shark; else rm -rf ~/.ivy2/local/org.apache.hive ~/.ivy2/cache/org.apache.hive; cd inceptor; sbt/sbt clean package; cd ..; fi'
alias rbdngmr='if [ "$TDH_VERSION" = "3.4" ]; then cd spark; sbt/sbt clean; cd ../shark; sbt/sbt clean; cd ..; ./compile.sh init; ./compile.sh spark; ./compile.sh shark; else cd spark; sbt/sbt clean publish-local; rm -rf ~/.ivy2/local/org.apache.hive ~/.ivy2/cache/org.apache.hive; cd ../inceptor; sbt/sbt clean package; cd ..; fi'
alias plt='$SCRIPT_HOME/pl_test.sh'

alias insthv='rm -rf $DEVROOT/PreCheck/jar/hive/*; if [ "$TDH_VERSION" = "3.4" ]; then cp $DEVROOT/$HIVEROOT/src/build/dist/lib/hive*jar $DEVROOT/PreCheck/jar/hive; else for src in `find $DEVROOT/$HIVEROOT/src -name "hive*jar" | grep -v "tests.jar"`; do dst=`basename $src`; dst=${dst/tdh40\.jar/transwarp-tdh40\.jar}; cp $src $DEVROOT/PreCheck/jar/hive/$dst; done fi'
alias instspk='rm -rf $DEVROOT/PreCheck/jar/spark/*; if [ "$TDH_VERSION" = "3.4" ]; then cp $DEVROOT/$NGMRROOT/spark/core/target/scala-2.10/ngmr-core_2.10-0.9.0-incubating-SNAPSHOT.jar $DEVROOT/PreCheck/jar/spark; else cp $DEVROOT/$NGMRROOT/spark/core/target/scala-2.10/spark-core_2.10-1.1.0-transwarp.jar $DEVROOT/PreCheck/jar/spark/ngmr-core_2.10-1.1.0-transwarp.jar; cp $DEVROOT/$NGMRROOT/spark/holodesk/target/scala-2.10/spark-holodesk_2.10-1.1.0-transwarp.jar $DEVROOT/PreCheck/jar/spark/ngmr-holodesk_2.10-1.1.0-transwarp.jar; fi'
alias insticpt='rm -rf $DEVROOT/PreCheck/jar/inceptor/*; if [ "$TDH_VERSION" = "3.4" ]; then cp $DEVROOT/$NGMRROOT/shark/target/scala-2.10/ngmr-shell_2.10-0.9.0-SNAPSHOT.jar $DEVROOT/PreCheck/jar/inceptor; else cp $DEVROOT/$NGMRROOT/inceptor/target/scala-2.10/inceptor_2.10-1.1.0-transwarp.jar $DEVROOT/PreCheck/jar/inceptor/ngmr-shell_2.10-1.1.0-transwarp.jar; fi'
