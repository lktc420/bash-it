#!/bin/bash

NGMR_SHELL_HOME="$DEVROOT/ngmr-1.7-transwarp/shark"
NGMR_HOME="$DEVROOT/ngmr-1.7-transwarp/spark"

CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/mysql-connector-java.jar
CLASSPATH=$CLASSPATH:/usr/lib/hbase/hbase-0.94.11-transwarp.jar
CLASSPATH=$CLASSPATH:$CONF_HOME

#Promote asm4.0
for jar in `find $NGMR_SHELL_HOME/lib_managed -name 'asm*4.0*jar'`; do
    CLASSPATH+=:$jar
done

#Promote slf4j1.7.5
for jar in `find $NGMR_SHELL_HOME/lib_managed -name 'slf4j*1.7.5*jar'`; do
    CLASSPATH+=:$jar
done

function find_without_slf4j ()
{
    find $* -name "*.jar" | grep -v "[^-]slf4j"
}

paths=(
$DEVROOT/$HIVEROOT/src/build/dist/lib
$DEVROOT/$HIVEROOT/src/build/ivy/lib/default 
$DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.20S.shim 
$NGMR_SHELL_HOME/lib
$NGMR_SHELL_HOME/lib_managed 
$NGMR_HOME/core/target
$NGMR_HOME/lib_managed 
$NGMR_SHELL_HOME/target
)

for path in ${paths[@]}; do
    for jar in `find_without_slf4j $path`; do
        CLASSPATH+=:$jar
    done
done

#echo $CLASSPATH;

$JAVA_HOME/bin/java -Dlog4j.configuration=file://$CONF_HOME/hive-log4j.properties -server -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70  -Djava.library.path="$DEVROOT/$HIVEROOT/src/build/dist/lib" -cp $CLASSPATH org.apache.hadoop.hive.cli.CliDriver -N
