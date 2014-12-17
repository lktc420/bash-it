#!/bin/bash

INCEPTOR_ROOT=$DEVROOT/inceptor

HIVE_DEV_ROOT=$DEVROOT/$HIVEROOT/src
SPARK_DEV_ROOT=$DEVROOT/ngmr-1.7-transwarp/spark/core
INCEPTOR_DEV_ROOT=$DEVROOT/ngmr-1.7-transwarp/inceptor

ln -sf $INCEPTOR_ROOT/hive.iml $HIVE_DEV_ROOT/hive.iml
ln -sf $INCEPTOR_ROOT/spark.iml $SPARK_DEV_ROOT/spark.iml
ln -sf $INCEPTOR_ROOT/inceptor.iml $INCEPTOR_DEV_ROOT/inceptor.iml
