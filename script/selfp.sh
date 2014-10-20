#!/bin/bash

if [ $(uname) = "Darwin" ]; then
    $SCRIPT_HOME/fp.sh $* | tr -d '\n' | pbcopy
    echo "`pbpaste` selected."
elif [ $(uname) = "Linux" ]; then
    $SCRIPT_HOME/fp.sh $* | tr -d '\n' | xsel
    echo "`xsel -o` selected."
fi
