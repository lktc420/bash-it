#!/bin/sh

for arg in $@
do
jps | grep $arg | awk '{print $1}' | xargs kill -9
done
