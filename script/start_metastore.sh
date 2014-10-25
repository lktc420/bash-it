#!/bin/bash

CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/mysql-connector-java.jar
CLASSPATH=$CLASSPATH:$CONF_HOME

#Promote slf4j1.7.5
for jar in `find $DEVROOT/$HIVEROOT/src/build/dist/lib -name 'slf4j*jar'`; do

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
)

for path in ${paths[@]}; do
    for jar in `find_without_slf4j $path`; do
        CLASSPATH+=:$jar
    done
done

#echo $CLASSPATH;

$JAVA_HOME/bin/java -Dlog4j.configuration=file://$CONF_HOME/hive-log4j.properties -cp $CLASSPATH org.apache.hadoop.hive.metastore.HiveMetaStore &

echo "Metastore started."
