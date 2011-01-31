#!/bin/bash

MSG="Current selected environment is"
DELTA=`diff -u ${HOME}/.s3cfg_dev ${HOME}/.s3cfg | wc -l`

if [ 0 -eq $DELTA ]
then
    MSG="$MSG dev"
else
    MSG="$MSG prod"
fi

if [ 1 -ne "$#" ] || ( [ "$1" != "dev" ] && [ "$1" != "prod" ] )
then
    echo "Usage: `basename $0` dev | prod"
    echo "$MSG"
    exit 0
fi

if [ "$1" = "dev" ]
then
    cp ${HOME}/.s3cfg_dev ${HOME}/.s3cfg
else
    cp ${HOME}/.s3cfg_prod ${HOME}/.s3cfg
fi
