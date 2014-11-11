cite about-plugin
about-plugin 'my tools'

function fp ()
{
    about 'display full path of a file'
    param '1: file name'
    group 'mine'
    find $* | sed "s:^:`pwd`/:"
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

function clipfp ()
{
    about 'copy full path of a file to clipboard'
    param '1: file name'
    group 'mine'
    fp $* | clipcpy
    echo "`clippst` copied to clipboard."
}

function selfp ()
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

