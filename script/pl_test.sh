#!/bin/bash

PL_TEST_ROOT=$DEVROOT/$HIVEROOT/src/sqlUnitTest/pl

TEST_DIRS=(
anon_exec
collection
conversion
cursor
empty_func
for_all
for_loop
goto
query
select_into
simple_loop
syscall
type
udf
while_loop
)

for dir in ${TEST_DIRS[@]}; do
  for ref in `find $PL_TEST_ROOT/$dir -name '*.txt'` ; do
    sql=${ref/\.txt/\.sql}
    log=${ref/\.txt/\.log}
    echo "Running $sql ..."
    $SCRIPT_HOME/start_clidriver.sh -f $sql | grep -v "^OK" | grep -v "Time taken:" | grep -v "output" >& $log 
  done
done

for dir in ${TEST_DIRS[@]}; do
  for ref in `find $PL_TEST_ROOT/$dir -name '*.txt'` ; do
    log=${ref/\.txt/\.log}
    echo "Diffing $log ..."
    vimdiff $ref $log
  done
done
