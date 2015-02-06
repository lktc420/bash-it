#!/bin/bash

PL_TEST_ROOT=$DEVROOT/$HIVEROOT/src/sqlUnitTest/pl

if [ $# = 0 ];then
  TEST_DIRS=`cat $PL_TEST_ROOT/test_list.txt`
else
  TEST_DIRS=($@)
fi
echo "Test dirs are:"
echo $TEST_DIRS

for dir in ${TEST_DIRS[@]}; do
  $PL_TEST_ROOT/pl_test.sh $PL_TEST_ROOT/$dir
done
