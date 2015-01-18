#!/bin/bash

source $BASH_IT/script/util.sh

INCEPTOR_HOME="$DEVROOT/inceptor"

if [ $(uname) = "Darwin" ]; then
    MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/mac
elif [ $(uname) = "Linux" ]; then
    MYSQL_CONNECTOR=$INCEPTOR_HOME/lib/ubuntu
fi

CLASSPATH=$CLASSPATH:$INCEPTOR_HOME/conf

#Promote slf4j1.7.5
for jar in `find $DEVROOT/ngmr-1.7-transwarp/inceptor/lib_managed -name 'slf4j*jar'`; do
    CLASSPATH+=:$jar
done

if [ "$TDH_VERSION" = "3.4" ]; then
paths=(
$DEVROOT/$HIVEROOT/src/build/dist/lib
$DEVROOT/$HIVEROOT/src/build/ivy/lib/default 
$DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.23.shim
$MYSQL_CONNECTOR
)
else
paths=(
$DEVROOT/$HIVEROOT/src
$DEVROOT/ngmr-1.7-transwarp/inceptor/lib_managed
$MYSQL_CONNECTOR
)
fi

for path in ${paths[@]}; do
    for jar in `find_without_slf4j $path`; do
        CLASSPATH+=:$jar
    done
done

#echo $CLASSPATH;

$JAVA_HOME/bin/java -Dlog4j.configuration=file://$INCEPTOR_HOME/conf/hive-log4j.properties -cp $CLASSPATH org.apache.hadoop.hive.metastore.HiveMetaStore &

echo "Metastore started."
