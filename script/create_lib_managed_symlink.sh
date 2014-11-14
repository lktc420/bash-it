#!/bin/bash

rm -rf inceptor_lib_managed > /dev/null 2>&1
NGMR_SHELL_HOME="$DEVROOT/ngmr-1.7-transwarp/inceptor"

mkdir inceptor_lib_managed

for jar in `find $NGMR_SHELL_HOME/lib_managed -name '*jar'`; do
    ln -s $jar inceptor_lib_managed/`basename $jar`
done

echo "Inceptor lib managed link created."
