#!/bin/bash

function find_without_slf4j ()
{
    find $* -name "*.jar" | grep -v "[^-]slf4j"
}

NGMR_SHELL_HOME="$DEVROOT/ngmr-1.7-transwarp/inceptor"
NGMR_HOME="$DEVROOT/ngmr-1.7-transwarp/spark"
INCEPTOR_HOME="$DEVROOT/inceptor"

CLASSPATH=$CLASSPATH:/usr/lib/hbase
CLASSPATH=$CLASSPATH:$INCEPTOR_HOME/conf

if [ $(uname) = "Darwin" ]; then
    MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/mac
elif [ $(uname) = "Linux" ]; then
    MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/ubuntu
fi 

#Promote slf4j1.7.5
for jar in `find $NGMR_SHELL_HOME/lib_managed -name 'slf4j*1.7.5*jar'`; do
    CLASSPATH+=:$jar
done

paths=(
$MYSQL_CONNCTOR
$INCEPTOR_HOME/lib
$NGMR_SHELL_HOME/lib
$NGMR_SHELL_HOME/lib_managed 
$NGMR_HOME/core/target
$NGMR_HOME/lib_managed 
$NGMR_SHELL_HOME/target
$DEVROOT/$HIVEROOT/src/build/dist/lib
$DEVROOT/$HIVEROOT/src/build/ivy/lib/default 
$DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.20S.shim 
)

for path in ${paths[@]}; do
    for jar in `find_without_slf4j $path`; do
        CLASSPATH+=:$jar
    done
done

#echo $CLASSPATH;

#$JAVA_HOME/bin/java -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -server -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70  -Djava.library.path="$DEVROOT/$HIVEROOT/src/build/dist/lib" -cp $CLASSPATH org.apache.hive.beeline.BeeLine -u jdbc:hive2://172.16.2.210:10000 -n np -p ""
$JAVA_HOME/bin/java -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -server -XX:+UseParNewGC -XX:NewRatio=2 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70  -Djava.library.path="$DEVROOT/$HIVEROOT/src/build/dist/lib" -cp $CLASSPATH org.apache.hadoop.hive.cli.CliDriver -N
