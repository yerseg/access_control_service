#!/bin/bash

CONF=./conf
IFS=":"

function Trace {
    systemd-cat echo $1
}

function validateOwner {
    currentFileOwner=$( find $FILE_NAME -printf '%u\n' )
    if [[ $currentFileOwner != $VALID_OWNER ]]
    then
        Trace "WARNING: " 
        chown $VALID_OWNER $FILE_NAME
    fi
}

function validateGroup {
    currentFileGroup=$( stat $FILE_NAME -c %G )
    if [[ $currentFileGroup != $VALID_GROUP ]]
    then
        Trace "WARNING: " 
        chgrp $VALID_GROUP $FILE_NAME
    fi
}

function validatePermissions {
    currentFilePermissions=$( stat $FILE_NAME -c %a )
    if [[ $currentFilePermissions != $VALID_PERM ]]
    then
        Trace "WARNING: " 
        chmod $VALID_PERM $FILE_NAME
    fi
}

function Service {
    Trace "ACCESS_CONTROL_SERVICE: begin scan"
    while read FILE_NAME VALID_PERM VALID_OWNER VALID_GROUP
    do
        validateOwner $FILE_NAME $VALID_OWNER
        validateGroup $FILE_NAME $VALID_GROUP
        validatePermissions $FILE_NAME $VALID_PERM
    done < $CONF
    Trace "ACCESS_CONTROL_SERVICE: complete scan"
}

function OnSignal {
    Trace "SIGUSR1"
    Service
}

function OnExit {
    Trace "exit"
}

trap "OnSignal" SIGUSR1
trap "OnExit" EXIT

while true
do
    Trace "SERVICE START"
    wait && Service
    sleep 1 &
done
