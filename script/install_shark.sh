#!/bin/sh

dst=/usr/lib/ngmr-shell/target/scala-2.10

[ -n "$1" ] && dst=$1

echo "Dest: $dst"

cp -rf $DEVROOT/ngmr-1.7-transwarp/shark/target/scala-2.10/ngmr-shell_2.10-0.9.0-SNAPSHOT.jar $dst
