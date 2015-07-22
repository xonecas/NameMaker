#!/bin/bash

PWD=`dirname $0`
mkdir -p $PWD/logs
touch $PWD/logs/babel.log

babel script.js --watch --out-file script-compiled.js &> $PWD/logs/babel.log &
BABEL_PID=$!

function finish {
    kill $BABEL_PID
    rm -rf $PWD/logs
}
trap finish EXIT

tail -n 100 -f $PWD/logs/*
