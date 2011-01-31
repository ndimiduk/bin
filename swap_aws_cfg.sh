#!/bin/bash

S3CFG_BASE="${HOME}/.s3cfg"

MSG="Current selected environment is"
DELTA=`diff -u ${S3CFG_BASE}_dev ${S3CFG_BASE} | wc -l`

if [ 0 -eq $DELTA ]
then
    MSG="$MSG dev"
else
    MSG="$MSG prod"
fi

if [ 1 -ne "$#" ] || ( [ "$1" != "dev" ] && [ "$1" != "prod" ] )
then
    echo "Usage: `basename $0` [ dev | prod ]"
    echo "$MSG"
    exit 0
fi

if [ "$1" = "dev" ]
then
    cp ${S3CFG_BASE}_dev ${S3CFG_BASE}
else
    cp ${S3CFG_BASE}_prod ${S3CFG_BASE}
fi
