#!/bin/sh

find $* | sed "s:^:`pwd`/:"
