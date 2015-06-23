#!/bin/bash

source $BASH_IT/script/util.sh

NGMR_HOME="$DEVROOT/$NGMRROOT/spark"

if [ "$TDH_VERSION" = "3.4" ]; then
  NGMR_SHELL_HOME="$DEVROOT/$NGMRROOT/shark"
else
  NGMR_SHELL_HOME="$DEVROOT/$NGMRROOT/inceptor"
fi
INCEPTOR_HOME="$DEVROOT/inceptor"

if [ $(uname) = "Darwin" ]; then
  MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/mac
elif [ $(uname) = "Linux" ]; then
  MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/ubuntu
fi

CLASSPATH=$CLASSPATH:$INCEPTOR_HOME/conf

#Promote slf4j1.7.5
for jar in `find $NGMR_HOME/lib_managed -name 'slf4j*1.7.5*jar'`; do
  CLASSPATH+=:$jar
done

if [ "$TDH_VERSION" = "3.4" ]; then
  paths=(
  $DEVROOT/$HIVEROOT/src/build/dist/lib
  $DEVROOT/$HIVEROOT/src/build/ivy/lib/default 
  $DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.23.shim
  $NGMR_SHELL_HOME/target
  $NGMR_SHELL_HOME/lib
  $NGMR_SHELL_HOME/lib_managed 
  $NGMR_HOME/core/target
  $NGMR_HOME/lib_managed 
  $MYSQL_CONNECTOR
  )
else
  paths=(
  $NGMR_SHELL_HOME/target
  $NGMR_HOME/lib_managed
  $DEVROOT/$HIVEROOT/src
  $NGMR_SHELL_HOME/lib
  $NGMR_SHELL_HOME/lib_managed 
  $NGMR_SHELL_HOME/../scala/lib
  $MYSQL_CONNECTOR
  )
fi

for path in ${paths[@]}; do
  for jar in `find_without_slf4j $path`; do
    CLASSPATH+=:$jar
  done
done

#echo $CLASSPATH;

$JAVA_HOME/bin/java $HADOOP_OPTS -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -server -Xmx8192m -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -cp $CLASSPATH $@
#$JAVA_HOME/bin/java $HADOOP_OPTS -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -server -Xmx4096m -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -cp $CLASSPATH org.apache.hadoop.hive.cli.CliDriver -N $@
