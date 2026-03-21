#!/usr/bin/env bash

PARAM=$1
TTY0=/dev/ttyUSB0
TTY1=/dev/ttyUSB1
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function checkTty()
{
    if [ -e ${TTY0} ]
    then
        if [ $(ls -l ${TTY0} | grep -c 'rw-rw-rw') == "0" ]
        then
            echo "give read and write access to all users for ${TTY0}"
            sudo chmod a+rw ${TTY0}
        else
            echo "all users have access to ${TTY0}"
        fi
    else
        echo "no ${TTY0} present"
    fi

    if [ -e ${TTY1} ]
    then
        if [ $(ls -l ${TTY1} | grep -c 'rw-rw-rw') == "0" ]
        then
            echo "give read and write access to all users for ${TTY1}"
            sudo chmod a+rw ${TTY1}
        else
            echo "all users have access to ${TTY1}"
        fi
    else
        echo "no ${TTY1} present"
    fi
}

if [ "${PARAM}" == "start" ]
then
    checkTty
    echo "start"
    cd ${SCRIPT_DIR}
    docker compose up -d
elif [ "${PARAM}" == "stop" ]
then
    echo "stop"
    cd ${SCRIPT_DIR}
    docker compose down 
elif [ "${PARAM}" == "restart" ]
then
    checkTty
    echo "stop"
    cd ${SCRIPT_DIR}
    docker compose restart raduino-gw1
    docker compose restart raduino-gw2
    docker compose restart raduino-proxy
    docker compose restart raduino-subscriptions
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
    echo "        start : start services"
    echo "         stop : stop services"
    echo "      restart : restart raduino service"
    echo "       status : status services"
    echo "    subscribe : subscribe to mqtt messages"
fi

