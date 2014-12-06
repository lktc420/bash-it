#!/bin/sh

dst=/usr/lib/ngmr/core/target/scala-2.10

[ -n "$1" ] && dst=$1

echo "Dest: $dst"

cp -rf $DEVROOT/ngmr-1.7-transwarp/spark/core/target/scala-2.10/ngmr-core_2.10-1.1.0-transwarp.jar $dst
