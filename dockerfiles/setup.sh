#!/bin/bash
# Setup script for the cmake-examples repository
# Will create a non root user using the UID and GID passed in from environment 
# variables and give them sudo access
#
ret=false
output=`getent passwd devuser 2>&1`
result=$?
if [ $result -ne 0 ] ; then
    echo "Creating devuser"
    if [ -z $DEV_UID ]; then
        DEV_UID=1000
    fi

    if [ -z $DEV_GID ]; then
        DEV_GID=1000
    fi

    groupadd -g $DEV_GID devgroup
    useradd -c 'container user' -u $DEV_UID -g $DEV_GID -d /home/devuser -m devuser
    echo "devuser:todo_$DEV_UID_$DEV_GID" | chpasswd
    sudo adduser devuser sudo
    echo "%sudo ALL=NOPASSWD: ALL" >> /etc/sudoers
fi

exec gosu devuser "$@"
