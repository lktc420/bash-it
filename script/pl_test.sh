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
exception
parameters
variable
block
chinese
dynamic_sql
advanced/palindrome
)

# ddl set up
cat <<@ > $PL_TEST_ROOT/ddl/create_table_template.sql
create database if not exists pl_test;
use pl_test;

DROP TABLE IF EXISTS t1;
CREATE EXTERNAL TABLE t1 (id INT, value INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY  '\t';
LOAD DATA LOCAL INPATH '$PWD/ddl/t1.txt' OVERWRITE INTO TABLE t1;

DROP TABLE IF EXISTS t2;
CREATE EXTERNAL TABLE t2 (id INT, value INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY  '\t';
LOAD DATA LOCAL INPATH '$PWD/ddl/t2.txt' OVERWRITE INTO TABLE t2;

DROP TABLE IF EXISTS palindrome1;
CREATE EXTERNAL TABLE palindrome1 (id INT, value STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY  '\t';
LOAD DATA LOCAL INPATH '$PWD/ddl/palindrome1.txt' OVERWRITE INTO TABLE palindrome1;

DROP TABLE IF EXISTS palindrome2;
CREATE EXTERNAL TABLE palindrome2 (id INT, value STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY  '\t';
LOAD DATA LOCAL INPATH '$PWD/ddl/palindrome2.txt' OVERWRITE INTO TABLE palindrome2;

DROP TABLE IF EXISTS palindrome3;
CREATE EXTERNAL TABLE palindrome3 (id INT, value STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY  '\t';
LOAD DATA LOCAL INPATH '$PWD/ddl/palindrome3.txt' OVERWRITE INTO TABLE palindrome3;

DROP TABLE IF EXISTS palindrome4;
CREATE EXTERNAL TABLE palindrome4 (id INT, value STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY  '\t';
LOAD DATA LOCAL INPATH '$PWD/ddl/palindrome4.txt' OVERWRITE INTO TABLE palindrome4;
@

# create table
# transwarp -t -h localhost -f ddl/create_table_template.sql >& /dev/null
$SCRIPT_HOME/start_clidriver.sh -f ddl/create_table_template.sql >& /dev/null

echo "Starting pl test..."
for dir in ${TEST_DIRS[@]}; do
  for ref in `find $PL_TEST_ROOT/$dir -name '*.txt'` ; do
    sql=${ref/\.txt/\.sql}
    log=${ref/\.txt/\.log}
    $SCRIPT_HOME/start_clidriver.sh -f $sql | grep -v "^OK" | grep -v "Time taken:" | grep -v "output" | grep -v "Executing " | grep -v "^Deleted file:" >& $log
    # transwarp -t -h localhost -f $sql | grep -v "^OK" | grep -v "Time taken:" | grep -v "output" | grep -v "Executing " | grep -v "^Deleted file:" >& $log

    diff -b -B $ref $log >& tmp
    if [ ! -s tmp ] ; then
      echo "$ref: PASS"
    else
      echo "$ref: FAIL" 
    fi
  done
done

rm -fr tmp.* tmp
