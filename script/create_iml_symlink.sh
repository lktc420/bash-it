#!/bin/bash

INCEPTOR_ROOT=$DEVROOT/inceptor

HIVE_DEV_ROOT=$DEVROOT/$HIVEROOT/src
SPARK_CORE_DEV_ROOT=$DEVROOT/ngmr-1.7-transwarp/spark/core
SPARK_HOLO_DEV_ROOT=$DEVROOT/ngmr-1.7-transwarp/spark/holodesk
INCEPTOR_DEV_ROOT=$DEVROOT/ngmr-1.7-transwarp/inceptor

ln -sf $INCEPTOR_ROOT/hive.iml $HIVE_DEV_ROOT/hive.iml
ln -sf $INCEPTOR_ROOT/spark-core.iml $SPARK_CORE_DEV_ROOT/spark-core.iml
ln -sf $INCEPTOR_ROOT/spark-holodesk.iml $SPARK_HOLO_DEV_ROOT/spark-holodesk.iml
ln -sf $INCEPTOR_ROOT/inceptor.iml $INCEPTOR_DEV_ROOT/inceptor.iml
