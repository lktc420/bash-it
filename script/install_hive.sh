#!/bin/sh

dst=/usr/lib/hive/lib

[ -n "$1" ] && dst=$1

echo "Dest: $dst"

cp -rf $DEVROOT/$HIVEROOT/src/build/dist/lib/hive*.jar $dst
