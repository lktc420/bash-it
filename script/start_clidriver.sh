#!/bin/bash

source $BASH_IT/script/util.sh

NGMR_HOME="$DEVROOT/ngmr-1.7-transwarp/spark"

if [ "$TDH_VERSION" = "3.4" ]; then
NGMR_SHELL_HOME="$DEVROOT/ngmr-1.7-transwarp/shark"
else
NGMR_SHELL_HOME="$DEVROOT/ngmr-1.7-transwarp/inceptor"
fi
INCEPTOR_HOME="$DEVROOT/inceptor"

CLASSPATH=$CLASSPATH:$INCEPTOR_HOME/conf

#Promote slf4j1.7.5
for jar in `find $NGMR_SHELL_HOME/lib_managed -name 'slf4j*1.7.5*jar'`; do
    CLASSPATH+=:$jar
done

paths=(
$NGMR_SHELL_HOME/target
$NGMR_HOME/lib_managed
$NGMR_SHELL_HOME/lib
$NGMR_SHELL_HOME/lib_managed 
$NGMR_SHELL_HOME/../scala/lib
)

for path in ${paths[@]}; do
    for jar in `find_without_slf4j $path`; do
        CLASSPATH+=:$jar
    done
done

#echo $CLASSPATH;

$JAVA_HOME/bin/java $HADOOP_OPTS -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -server -Xmx4096m -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -cp $CLASSPATH org.apache.hadoop.hive.cli.CliDriver -N $@
