#!/bin/bash

fail() {
    echo "$@" 1>&2
    exit 1
}

git ls-remote --exit-code dokku 1>/dev/null 2>/dev/null

if [ $? = 0 ]; then
    ACTION=$1
    PARAMS="${@:2}"
    COMMAND=`git remote -v | \
        grep "^dokku" | \
        head -1 | \
        awk -v action="$ACTION" -v params="$PARAMS" 'action{ split($2,path,":"); print("ssh", "-t", path[1], action, path[2], params) } !action{ split($2,path,":"); print("ssh", "-t", path[1]) }'`
    $COMMAND
else
    fail "No dokku remote added."
fi

