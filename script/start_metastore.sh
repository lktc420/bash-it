#!/bin/sh

CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/mysql-connector-java.jar
CLASSPATH=$CLASSPATH:$CONF_HOME
CLASSPATH=$CLASSPATH:/usr/lib/hbase/conf

for dir in $DEVROOT/$HIVEROOT/src/build/dist/lib
do
    for file in `ls $dir`
    do
        CLASSPATH=$CLASSPATH:$dir/$file
    done
done

for dir in $DEVROOT/$HIVEROOT/src/build/ivy/lib
do
    for file in `ls $dir`
    do
        CLASSPATH=$CLASSPATH:$dir/$file
    done
done

for dir in $DEVROOT/$HIVEROOT/src/build/ivy/lib/hadoop0.20.shim
do
    for file in `ls $dir`
    do
        CLASSPATH=$CLASSPATH:$dir/$file
    done
done

# echo $CLASSPATH ;

$JAVA_HOME/bin/java  -Xmx256m -Dlog4j.configuration=file://$CONF_HOME/hive-log4j.properties -Djava.library.path=$DEVROOT/$HIVEROOT/src/build/dist/lib -cp $CLASSPATH org.apache.hadoop.hive.metastore.HiveMetaStore &
