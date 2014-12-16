#!/bin/bash

PL_TEST_ROOT=$DEVROOT/$HIVEROOT/src/sqlUnitTest/pl

for sql in `find $PL_TEST_ROOT -name '*.sql'` ; do
  log=${sql/\.sql/\.log}
  echo "Running $sql ..."
  $SCRIPT_HOME/start_clidriver.sh -f $sql >& $log 
done

for ref in `find $PL_TEST_ROOT -name '*.txt'` ; do
  log=${ref/\.txt/\.log}
  echo "Diffing $log ..."
  vimdiff $ref $log
done
