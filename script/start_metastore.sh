#!/bin/bash

source $BASH_IT/script/util.sh

INCEPTOR_HOME="$DEVROOT/inceptor"

CLASSPATH=$CLASSPATH:$INCEPTOR_HOME/conf

if [ $(uname) = "Darwin" ]; then
    MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/mac
elif [ $(uname) = "Linux" ]; then
    MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/ubuntu
fi

#Promote slf4j1.7.5
for jar in `find $DEVROOT/$HIVEROOT/src/build/dist/lib -name 'slf4j*jar'`; do
    CLASSPATH+=:$jar
done

paths=(
$MYSQL_CONNCTOR
$INCEPTOR_HOME/lib
$DEVROOT/$HIVEROOT/src/build/dist/lib
$DEVROOT/$HIVEROOT/src/build/ivy/lib/default 
$DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.23.shim 
)

for path in ${paths[@]}; do
    for jar in `find_without_slf4j $path`; do
        CLASSPATH+=:$jar
    done
done

#echo $CLASSPATH;

$JAVA_HOME/bin/java -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -cp $CLASSPATH org.apache.hadoop.hive.metastore.HiveMetaStore &

echo "Metastore started."
