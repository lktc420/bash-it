cite about-plugin
about-plugin 'my tools'

function fp ()
{
    about 'display full path of a file'
    param '1: file name'
    group 'mine'
    if [ "${1::1}" == "/" ]; then
      echo $1
    else
      echo $1 | sed "s:^:`pwd`/:"
    fi
}

function clipcpy ()
{
    about 'copy stdin to clipboard'
    group 'mine'
    if [ $(uname) = "Darwin" ]; then
        tr -d "\n" | pbcopy
    elif [ $(uname) = "Linux" ]; then
        tr -d "\n" | xsel -b
    fi
}

function clippst ()
{
    about 'paste clipboard to stdout'
    group 'mine'
    if [ $(uname) = "Darwin" ]; then
        pbpaste
    elif [ $(uname) = "Linux" ]; then
        xsel -b -o
    fi
}

function selcpy ()
{
    about 'copy stdin to select'
    group 'mine'
    if [ $(uname) = "Darwin" ]; then
        tr -d "\n" | pbcopy
    elif [ $(uname) = "Linux" ]; then
        tr -d "\n" | xsel
    fi
}

function selpst ()
{
    about 'paste clipboard to stdout'
    group 'mine'
    if [ $(uname) = "Darwin" ]; then
        pbpaste
    elif [ $(uname) = "Linux" ]; then
        xsel -o
    fi
}

function cfp ()
{
    about 'copy full path of a file to clipboard'
    param '1: file name'
    group 'mine'
    fp $* | clipcpy
    echo "`clippst` copied to clipboard."
}

function sfp ()
{
    about 'copy full path of a file to select'
    param '1: file name'
    group 'mine'
    fp $* | selcpy
    echo "`selpst` copied to select"
}

function pk ()
{
    about 'kill the processes with specified name pattern'
    param '1: process name pattern'
    group 'mine'
    for arg in $@
    do
        ps -u $USER | grep $arg | awk '{print $1}' | xargs kill -9
    done
}

function jpk ()
{
    about 'kill the java processes with specified name pattern'
    param '1: java process name pattern'
    group 'mine'
    for arg in $@
    do
        jps | grep $arg | awk '{print $1}' | xargs kill -9
    done
}

function sce ()
{
    about 'copy full path of e.sql to select'
    group 'mine'
    sfp $DEVROOT/inceptor/sql/e.sql
}

function ccf ()
{
    about 'copy full path of a file to clipboard and paste to f.sql'
    param '1: file name'
    group 'mine'
    cfp $*
    echo "source `clippst`" > $DEVROOT/inceptor/sql/f.sql
    echo "`clippst` sourced to $DEVROOT/inceptor/sql/f.sql"
}

function scf ()
{
    about 'copy full path of a file to select and paste to f.sql'
    param '1: file name'
    group 'mine'
    sfp $*
    echo "source `selpst`" > $DEVROOT/inceptor/sql/f.sql
    echo "`selpst` sourced to $DEVROOT/inceptor/sql/f.sql"
}

function tdh34 ()
{
    about 'switch evn to TDH3.4'
    group 'mine'
    export TDH_VERSION=3.4
    export HIVEROOT=hive34
    export NGMRROOT=ngmr34
}

function tdh40 ()
{
    about 'switch evn to TDH4.0'
    group 'mine'
    export TDH_VERSION=4.0
    export HIVEROOT=hive-0.12.0-transwarp
    export NGMRROOT=ngmr-1.7-transwarp
}

function warp ()
{
    about 'switch the working warp id'
    param '1: warp number (4 digits)'
    group 'mine'
    export HIVE_BRANCH=$BRANCH/warp-$1-hive
    export NGMR_BRANCH=$BRANCH/warp-$1-ngmr
}
