#!/bin/bash

# locations for config files
S3CFG_BASE="${HOME}/.s3cfg"
AWS_IAM_BASE="${HOME}/.aws_iam"

MSG="Current selected environment is"
DELTA=`diff -u ${S3CFG_BASE}_dev ${S3CFG_BASE} | wc -l`
(( DELTA += `diff -u ${AWS_IAM_BASE}_dev ${AWS_IAM_BASE} | wc -l` ))

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
    cp "${S3CFG_BASE}_dev" "${S3CFG_BASE}"
    cp "${AWS_IAM_BASE}_dev" "${AWS_IAM_BASE}"
else
    cp "${S3CFG_BASE}_prod" "${S3CFG_BASE}"
    cp "${AWS_IAM_BASE}_prod" "${AWS_IAM_BASE}"
fi
