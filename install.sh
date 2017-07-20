#!/usr/bin/env bash

if [ ! -f "install.sh" ]; then
echo 'install must be run within its container folder' 1>&2
exit 1
fi

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
OLDGOBIN="$GOBIN"
export GOPATH="$CURDIR"
export GOBIN="$CURDIR"/bin

echo $GOBIN

gofmt -w src

go install src/ndp/dk/dk.go

export GOPATH="$OLDGOPATH"
export GOBIN="$OLDGOBIN"

echo 'finished'