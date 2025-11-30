#!/usr/bin/env bash

PARAM=$1
TTY=/dev/ttyUSB0
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ -e ${TTY} ]
then
    if [ $(ls -l ${TTY} | grep -c 'rw-rw-rw') == "0" ]
    then
        echo "give read and write access to all users for ${TTY}"
        sudo chmod a+rw ${TTY}
    else
        echo "all users have access to ${TTY}"
    fi
else
    echo "no ${TTY} present"
fi

if [ "${PARAM}" == "start" ]
then
    echo "start"
    cd ${SCRIPT_DIR}
    docker compose up -d
elif [ "${PARAM}" == "stop" ]
then
    echo "stop"
    cd ${SCRIPT_DIR}
    docker compose down 
elif [ "${PARAM}" == "status" ]
then
    echo "status"
    cd ${SCRIPT_DIR}
    docker ps 
elif [ "${PARAM}" == "subscribe" ]
then
    mosquitto_sub -t '#' -v
else
    echo "no parameter:"
    echo "       status : status services"
    echo "        start : start services"
    echo "         stop : stop services"
fi

