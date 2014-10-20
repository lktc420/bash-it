#!/bin/bash

if [ $(uname) = "Darwin" ]; then
    $SCRIPT_HOME/fp.sh $* | tr -d '\n' | pbcopy
    echo "`pbpaste` copied to clipboard."
elif [ $(uname) = "Linux" ]; then
    $SCRIPT_HOME/fp.sh $* | tr -d '\n' | xsel -b
    echo "`xsel -b -o` copied to clipboard."
fi
